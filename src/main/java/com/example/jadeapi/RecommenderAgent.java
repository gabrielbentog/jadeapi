package com.example.jadeapi;

import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;
import jade.core.AID;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
// import java.util.List; // Conflita com jade.util.leap.List, usar java.util.List explicitamente

public class RecommenderAgent extends Agent {

    @Override
    protected void setup() {
        System.out.println("Agente Recomendador " + getLocalName() + " iniciado e pronto para gerar recomendações REAIS.");

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
                            int difficultyOfLastQuiz = jsonContent.optInt("difficultyOfLastQuiz", -1);
                            long subjectIdOfLastQuiz = jsonContent.optLong("subjectIdOfLastQuiz", -1L);
                            JSONArray allAvailableQuizzesReceived = jsonContent.optJSONArray("allAvailableQuizzes");

                            System.out.println("[" + getLocalName() + "] Processando pedido de recomendação para userId: " + userId +
                                               ", último score: " + lastScore + ", último quiz: " + lastQuizIdAttempted +
                                               ", dif. último quiz: " + difficultyOfLastQuiz + ", mat. último quiz: " + subjectIdOfLastQuiz);
                            
                            if (allAvailableQuizzesReceived == null || allAvailableQuizzesReceived.length() == 0) {
                                System.err.println("[" + getLocalName() + "] Lista de quizzes disponíveis não recebida ou vazia do TutorAgent.");
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

                            JSONArray recommendedQuizzesJsonArray = new JSONArray();
                            String recommendationMessage = "";

                            java.util.List<JSONObject> availableQuizzesList = new ArrayList<>();
                            for (int i = 0; i < allAvailableQuizzesReceived.length(); i++) {
                                availableQuizzesList.add(allAvailableQuizzesReceived.getJSONObject(i));
                            }

                            if (lastScore >= 70.0) { // BOM DESEMPENHO
                                recommendationMessage = "Ótimo trabalho! Com base no seu desempenho, aqui estão alguns próximos desafios:";
                                
                                // Prioridade 1: Mesma matéria, dificuldade maior
                                availableQuizzesList.stream()
                                    .filter((JSONObject q) -> q.getLong("id") != lastQuizIdAttempted && // TIPO EXPLÍCITO
                                                 q.optLong("subjectId", -2L) == subjectIdOfLastQuiz && 
                                                 q.getInt("difficulty") > difficultyOfLastQuiz)
                                    .sorted(Comparator.comparingInt((JSONObject q_sort) -> q_sort.getInt("difficulty"))) // TIPO EXPLÍCITO
                                    .forEach((JSONObject q_each) -> { // TIPO EXPLÍCITO
                                        if (recommendedQuizzesJsonArray.length() < 2 && !jsonArrayContainsId(recommendedQuizzesJsonArray, q_each.getLong("id"))) {
                                            recommendedQuizzesJsonArray.put(q_each);
                                        }
                                    });
                                
                                // Prioridade 2: Matéria diferente, dificuldade similar ou um pouco maior
                                if (recommendedQuizzesJsonArray.length() < 2) {
                                    availableQuizzesList.stream()
                                        .filter((JSONObject q) -> q.getLong("id") != lastQuizIdAttempted && // TIPO EXPLÍCITO
                                                     !jsonArrayContainsId(recommendedQuizzesJsonArray, q.getLong("id")) &&
                                                     q.optLong("subjectId", -2L) != subjectIdOfLastQuiz &&
                                                     q.getInt("difficulty") >= difficultyOfLastQuiz)
                                        .sorted(Comparator.comparingInt((JSONObject q_sort) -> q_sort.getInt("difficulty"))) // TIPO EXPLÍCITO
                                        .forEach((JSONObject q_each) -> { // TIPO EXPLÍCITO
                                            if (recommendedQuizzesJsonArray.length() < 2) {
                                                recommendedQuizzesJsonArray.put(q_each);
                                            }
                                        });
                                }
                                 // Prioridade 3: Mesma matéria, mesma dificuldade (outro quiz)
                                if (recommendedQuizzesJsonArray.length() < 2) {
                                    availableQuizzesList.stream()
                                        .filter((JSONObject q) -> q.getLong("id") != lastQuizIdAttempted && // TIPO EXPLÍCITO
                                                     !jsonArrayContainsId(recommendedQuizzesJsonArray, q.getLong("id")) &&
                                                     q.optLong("subjectId", -2L) == subjectIdOfLastQuiz &&
                                                     q.getInt("difficulty") == difficultyOfLastQuiz)
                                        .forEach((JSONObject q_each) -> { // TIPO EXPLÍCITO
                                            if (recommendedQuizzesJsonArray.length() < 2 ) {
                                                recommendedQuizzesJsonArray.put(q_each);
                                            }
                                        });
                                }

                            } else { // DESEMPENHO A MELHORAR
                                recommendationMessage = "Continue praticando! Sugerimos focar nesta matéria ou revisar alguns conceitos:";
                                
                                // Prioridade 1: Mesma matéria, dificuldade menor
                                availableQuizzesList.stream()
                                    .filter((JSONObject q) -> q.getLong("id") != lastQuizIdAttempted && // TIPO EXPLÍCITO
                                                 q.optLong("subjectId", -2L) == subjectIdOfLastQuiz &&
                                                 q.getInt("difficulty") < difficultyOfLastQuiz)
                                    .sorted(Comparator.comparingInt((JSONObject q_sort) -> q_sort.getInt("difficulty")).reversed()) // TIPO EXPLÍCITO
                                    .forEach((JSONObject q_each) -> { // TIPO EXPLÍCITO
                                        if (recommendedQuizzesJsonArray.length() < 2 && !jsonArrayContainsId(recommendedQuizzesJsonArray, q_each.getLong("id"))) {
                                            recommendedQuizzesJsonArray.put(q_each);
                                        }
                                    });

                                // Prioridade 2: Mesma matéria, mesma dificuldade (outro quiz para praticar)
                                if (recommendedQuizzesJsonArray.length() < 2) {
                                    availableQuizzesList.stream()
                                        .filter((JSONObject q) -> q.getLong("id") != lastQuizIdAttempted && // TIPO EXPLÍCITO
                                                     !jsonArrayContainsId(recommendedQuizzesJsonArray, q.getLong("id")) &&
                                                     q.optLong("subjectId", -2L) == subjectIdOfLastQuiz &&
                                                     q.getInt("difficulty") == difficultyOfLastQuiz)
                                        .forEach((JSONObject q_each) -> { // TIPO EXPLÍCITO
                                             if (recommendedQuizzesJsonArray.length() < 2 ) {
                                                recommendedQuizzesJsonArray.put(q_each);
                                            }
                                        });
                                }

                                // Prioridade 3: Se a dificuldade já era a mínima (1) na mesma matéria, sugerir refazer ou outro fácil da mesma matéria.
                                if (difficultyOfLastQuiz == 1 && recommendedQuizzesJsonArray.length() < 2 && subjectIdOfLastQuiz != -1L) {
                                    boolean addedSameQuiz = false;
                                    if (!jsonArrayContainsId(recommendedQuizzesJsonArray, lastQuizIdAttempted)) { 
                                        for (JSONObject q : availableQuizzesList) { // Loop for-each tradicional, tipo já é JSONObject
                                            if (q.getLong("id") == lastQuizIdAttempted) {
                                                recommendedQuizzesJsonArray.put(q);
                                                addedSameQuiz = true;
                                                recommendationMessage = "Que tal tentar este quiz novamente para reforçar os conceitos?";
                                                break;
                                            }
                                        }
                                    }
                                    if (recommendedQuizzesJsonArray.length() < 2 && !addedSameQuiz) { 
                                        for (JSONObject q : availableQuizzesList) { // Loop for-each tradicional
                                            if (!jsonArrayContainsId(recommendedQuizzesJsonArray, q.getLong("id")) &&
                                                q.optLong("subjectId", -2L) == subjectIdOfLastQuiz && q.getInt("difficulty") == 1) {
                                                recommendedQuizzesJsonArray.put(q);
                                                recommendationMessage = "Temos este outro quiz básico nesta matéria para você praticar.";
                                                break; 
                                            }
                                        }
                                    }
                                }
                            }
                            
                            if (recommendedQuizzesJsonArray.length() < 2) {
                                if (recommendedQuizzesJsonArray.length() == 0) { 
                                   recommendationMessage = "Explore outros quizzes disponíveis em nosso catálogo:";
                                }
                                Collections.shuffle(availableQuizzesList); 
                                for (JSONObject q : availableQuizzesList) { // Loop for-each tradicional
                                    if (q.getLong("id") != lastQuizIdAttempted && !jsonArrayContainsId(recommendedQuizzesJsonArray, q.getLong("id"))) {
                                        recommendedQuizzesJsonArray.put(q);
                                        if (recommendedQuizzesJsonArray.length() >= 2) break;
                                    }
                                }
                            }
                            
                            if(recommendedQuizzesJsonArray.length() == 0 && !availableQuizzesList.isEmpty()){
                                if(availableQuizzesList.size() == 1 && availableQuizzesList.get(0).getLong("id") == lastQuizIdAttempted) {
                                     recommendedQuizzesJsonArray.put(availableQuizzesList.get(0));
                                     recommendationMessage = "No momento, este é o único quiz relacionado. Que tal tentar novamente para fixar o conteúdo?";
                                } else { 
                                     for (JSONObject q : availableQuizzesList) { // Loop for-each tradicional
                                        if (q.getLong("id") != lastQuizIdAttempted) {
                                            recommendedQuizzesJsonArray.put(q);
                                            recommendationMessage = "Temos este quiz disponível para você.";
                                            break;
                                        }
                                    }
                                }
                            }
                             if(recommendedQuizzesJsonArray.length() == 0 && availableQuizzesList.isEmpty()){
                                recommendationMessage = "Parabéns, você concluiu todos os quizzes disponíveis ou não há outros para recomendar no momento!";
                            }

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
                            System.out.println("[" + getLocalName() + "] Recomendações (com dados reais e foco no subjectId) enviadas para " + sender.getLocalName() + ": " + fullReplyContent.toString());

                        } else {
                             System.out.println("[" + getLocalName() + "] Ação desconhecida ou não tratada: " + action + " (Performative: " + ACLMessage.getPerformative(msg.getPerformative()) + ") - Conteúdo: " + content);
                        }

                    } catch (JSONException e) {
                        System.err.println("[" + getLocalName() + "] Erro ao fazer parse do JSON ou criar resposta: " + content + " - " + e.getMessage());
                        ACLMessage errorReply = new ACLMessage(ACLMessage.FAILURE);
                        errorReply.addReceiver(sender);
                        errorReply.setLanguage("JSON");
                        errorReply.setOntology("recommendation-error");
                        errorReply.setConversationId(originalConversationId);
                        try { 
                            JSONObject errorPayload = new JSONObject();
                            errorPayload.put("action", "recommendation_error");
                            errorPayload.put("error", e.getMessage().replace("\"", "\\\""));
                            errorReply.setContent(errorPayload.toString());
                        } catch (JSONException je) {
                            errorReply.setContent("{\"action\":\"recommendation_error\", \"error\":\"Erro interno no RecommenderAgent ao processar JSON.\"}");
                        }
                        myAgent.send(errorReply);
                    }
                } else {
                    block();
                }
            }
        });
    }

    private boolean jsonArrayContainsId(JSONArray array, long id) {
        if (array == null) return false;
        for (int i = 0; i < array.length(); i++) {
            if (array.optJSONObject(i) != null && array.getJSONObject(i).optLong("id", -1) == id) {
                return true;
            }
        }
        return false;
    }

    @Override
    protected void takeDown() {
        System.out.println("Agente Recomendador " + getLocalName() + " finalizando.");
    }
}