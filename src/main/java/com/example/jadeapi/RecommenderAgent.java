// Arquivo: src/main/java/com/example/jadeapi/RecommenderAgent.java
package com.example.jadeapi;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import jade.core.AID;
import jade.core.Agent; // Para converter JSONArray para List<JSONObject> se necessário
import jade.core.behaviours.CyclicBehaviour; // Se precisar embaralhar para fallback
import jade.lang.acl.ACLMessage;  // Se precisar ordenar para fallback

public class RecommenderAgent extends Agent {

    // Parâmetros para o Algoritmo Genético (podem ser ajustados)
    private static final int GA_POPULATION_SIZE = 50;
    private static final int GA_PATH_LENGTH = 3; // Recomendar 3 quizzes
    private static final double GA_MUTATION_RATE = 0.02; // 2%
    private static final int GA_TOURNAMENT_SIZE = 5;
    private static final int GA_NUMBER_OF_GENERATIONS = 75; // Ajustar conforme necessidade e performance
    private static final int GA_ELITISM_COUNT = 2;

    @Override
    protected void setup() {
        System.out.println("Agente Recomendador " + getLocalName() + " iniciado e pronto para usar AG.");

        addBehaviour(new CyclicBehaviour(this) {
            @Override
            public void action() {
                ACLMessage msg = myAgent.receive();

                if (msg != null) {
                    System.out.println("[" + getLocalName() + "] Mensagem recebida de " + msg.getSender().getName() + ". Conteúdo: " + msg.getContent() + ". ConvID: " + msg.getConversationId());
                    String content = msg.getContent();
                    AID sender = msg.getSender();
                    String originalConversationId = msg.getConversationId();

                    try {
                        JSONObject jsonContent = new JSONObject(content);
                        String action = jsonContent.optString("action", "unknown_action");

                        if ("generate_recommendations_for_user".equals(action) && msg.getPerformative() == ACLMessage.REQUEST) {
                            long userId = jsonContent.optLong("userId", -1);
                            double lastScore = jsonContent.optDouble("lastScore", -1.0);
                            long lastQuizIdAttempted = jsonContent.optLong("lastQuizId", -1);
                            int difficultyOfLastQuiz = jsonContent.optInt("difficultyOfLastQuiz", -1); // Default -1 se não presente
                            long subjectIdOfLastQuiz = jsonContent.optLong("subjectIdOfLastQuiz", -1L); // Default -1L se não presente
                            JSONArray allAvailableQuizzesReceived = jsonContent.optJSONArray("allAvailableQuizzes");

                            System.out.println("[" + getLocalName() + "] Processando pedido de recomendação para userId: " + userId
                                    + ", último score: " + lastScore + ", último quiz: " + lastQuizIdAttempted
                                    + ", dif. último quiz: " + difficultyOfLastQuiz + ", mat. último quiz: " + subjectIdOfLastQuiz);

                            if (allAvailableQuizzesReceived == null || allAvailableQuizzesReceived.length() == 0) {
                                System.err.println("[" + getLocalName() + "] Lista de quizzes disponíveis não recebida ou vazia do TutorAgent.");
                                // Lógica de erro existente...
                                ACLMessage errorReply = new ACLMessage(ACLMessage.FAILURE);
                                errorReply.addReceiver(sender);
                                errorReply.setLanguage("JSON");
                                errorReply.setOntology("recommendation-error");
                                errorReply.setConversationId(originalConversationId);
                                errorReply.setContent("{\"action\":\"recommendation_error\", \"error\":\"Lista de quizzes disponíveis não recebida ou vazia.\"}");
                                myAgent.send(errorReply);
                                block();
                                return;
                            }

                            // --- INÍCIO DA INTEGRAÇÃO COM AG ---
                            // Passo 1: Coletar dados do usuário para o AG
                            // TODO: Obter 'recentlyCompletedQuizIds' de forma mais robusta. Por agora, um Set vazio.
                            Set<Long> recentlyCompletedQuizIds = new HashSet<>();
                            // Se lastQuizIdAttempted é válido, adicione-o para evitar recomendá-lo imediatamente.
                            if (lastQuizIdAttempted != -1) {
                                recentlyCompletedQuizIds.add(lastQuizIdAttempted);
                            }

                            UserProfileForGA userProfile = new UserProfileForGA(
                                    userId,
                                    lastScore,
                                    (difficultyOfLastQuiz == -1 ? 1 : difficultyOfLastQuiz), // Usa 1 como default se -1
                                    (subjectIdOfLastQuiz == -1L ? null : subjectIdOfLastQuiz), // null se -1L
                                    recentlyCompletedQuizIds
                            );

                            // Passo 2: Instanciar e executar o AG
                            GeneticAlgorithmEngine gaEngine = new GeneticAlgorithmEngine(
                                    GA_POPULATION_SIZE,
                                    GA_PATH_LENGTH,
                                    allAvailableQuizzesReceived,
                                    GA_MUTATION_RATE,
                                    GA_TOURNAMENT_SIZE,
                                    GA_NUMBER_OF_GENERATIONS,
                                    GA_ELITISM_COUNT
                            );

                            System.out.println("[" + getLocalName() + "] Executando Algoritmo Genético para userId: " + userId);
                            LearningPath bestPath = gaEngine.runEvolution(userProfile);
                            System.out.println("[" + getLocalName() + "] Algoritmo Genético concluído. Melhor trilha: " + bestPath);

                            // Passo 3: Processar o resultado do AG
                            JSONArray recommendedQuizzesJsonArray = new JSONArray();
                            String recommendationMessage = "";

                            if (bestPath != null && bestPath.getQuizSequence() != null
                                    && !bestPath.getQuizSequence().isEmpty()
                                    && // Verifica se a trilha não é composta apenas de nulls
                                    bestPath.getQuizSequence().stream().anyMatch(id -> id != null)) {

                                List<Long> bestQuizIds = bestPath.getQuizSequence();
                                int quizzesAdded = 0;
                                for (Long quizId : bestQuizIds) {
                                    if (quizId == null) {
                                        continue; // Pula quizzes nulos na trilha
                                    }
                                    // Encontra o JSONObject do quiz na lista original para enviar todos os detalhes
                                    for (int i = 0; i < allAvailableQuizzesReceived.length(); i++) {
                                        JSONObject quizJson = allAvailableQuizzesReceived.getJSONObject(i);
                                        if (quizJson.getLong("id") == quizId) {
                                            recommendedQuizzesJsonArray.put(quizJson); // Adiciona o objeto JSON completo do quiz
                                            quizzesAdded++;
                                            break;
                                        }
                                    }
                                }
                                if (quizzesAdded > 0) {
                                    recommendationMessage = "Aqui estão algumas sugestões personalizadas para você, baseadas na sua evolução!";
                                } else {
                                    recommendationMessage = "Não conseguimos gerar recomendações personalizadas no momento. Explore nossos quizzes!";
                                    // Poderia aqui chamar a lógica de fallback (regras antigas)
                                }

                            } else {
                                // Lógica de Fallback: Se o AG não encontrar uma boa trilha,
                                // use a lógica de recomendação baseada em regras original ou outra estratégia.
                                System.out.println("[" + getLocalName() + "] AG não retornou uma trilha válida. Usando lógica de fallback (simplificada: pegar os 2 primeiros disponíveis).");
                                recommendationMessage = "Temos estas sugestões para você (fallback):";
                                for (int i = 0; i < allAvailableQuizzesReceived.length() && i < 2; i++) {
                                    recommendedQuizzesJsonArray.put(allAvailableQuizzesReceived.getJSONObject(i));
                                }
                                if (recommendedQuizzesJsonArray.length() == 0 && allAvailableQuizzesReceived.length() > 0) {
                                    recommendedQuizzesJsonArray.put(allAvailableQuizzesReceived.getJSONObject(0)); // Pega pelo menos um se houver
                                }
                            }

                            if (recommendedQuizzesJsonArray.length() == 0 && allAvailableQuizzesReceived.length() > 0) {
                                // Último fallback se tudo falhar mas houver quizzes
                                recommendedQuizzesJsonArray.put(allAvailableQuizzesReceived.getJSONObject(0));
                                recommendationMessage = "Que tal tentar este quiz?";
                            } else if (recommendedQuizzesJsonArray.length() == 0 && allAvailableQuizzesReceived.length() == 0) {
                                recommendationMessage = "Não há quizzes disponíveis no momento.";
                            }

                            // --- FIM DA INTEGRAÇÃO COM AG ---
                            // Montar e enviar a resposta (lógica existente)
                            JSONObject recommendationsPayload = new JSONObject();
                            recommendationsPayload.put("recommendedQuizzes", recommendedQuizzesJsonArray);
                            recommendationsPayload.put("message", recommendationMessage);

                            ACLMessage replyToTutor = new ACLMessage(ACLMessage.INFORM);
                            replyToTutor.addReceiver(sender);
                            replyToTutor.setLanguage("JSON");
                            replyToTutor.setOntology("recommendation-response");
                            replyToTutor.setConversationId(originalConversationId);

                            JSONObject fullReplyContent = new JSONObject();
                            fullReplyContent.put("action", "recommendation_result");
                            fullReplyContent.put("userId", userId);
                            fullReplyContent.put("recommendations", recommendationsPayload);

                            replyToTutor.setContent(fullReplyContent.toString());
                            myAgent.send(replyToTutor);
                            System.out.println("[" + getLocalName() + "] Recomendações (via AG ou fallback) enviadas para " + sender.getLocalName() + ": " + fullReplyContent.toString());

                        } else {
                            System.out.println("[" + getLocalName() + "] Ação desconhecida ou não tratada: " + action + " (Performative: " + ACLMessage.getPerformative(msg.getPerformative()) + ") - Conteúdo: " + content);
                        }

                    } catch (JSONException e) {
                        // Lógica de erro existente...
                        System.err.println("[" + getLocalName() + "] Erro ao fazer parse do JSON ou criar resposta: " + content + " - " + e.getMessage());
                        // ... (envio de mensagem de erro)
                        ACLMessage errorReply = new ACLMessage(ACLMessage.FAILURE);
                        errorReply.addReceiver(sender);
                        errorReply.setLanguage("JSON");
                        errorReply.setOntology("recommendation-error");
                        errorReply.setConversationId(originalConversationId);
                        try {
                            JSONObject errorPayload = new JSONObject();
                            errorPayload.put("action", "recommendation_error");
                            errorPayload.put("error", e.getMessage().replace("\"", "\\\"")); // Escapa aspas para JSON
                            errorReply.setContent(errorPayload.toString());
                        } catch (JSONException je) {
                            errorReply.setContent("{\"action\":\"recommendation_error\", \"error\":\"Erro interno no RecommenderAgent ao processar JSON e erro subsequente.\"}");
                        }
                        myAgent.send(errorReply);
                    }
                } else {
                    block();
                }
            }
        });
    }

    // O método jsonArrayContainsId não é mais usado diretamente aqui se o AG retornar IDs
    // e buscamos o JSONObject completo. Manter apenas se a lógica de fallback usar.
    @Override
    protected void takeDown() {
        System.out.println("Agente Recomendador " + getLocalName() + " finalizando.");
    }
}
