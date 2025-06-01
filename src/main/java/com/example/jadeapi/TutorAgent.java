package com.example.jadeapi;

import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;
import jade.core.AID;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;
import jade.util.leap.Iterator;
import jade.util.leap.List; 

import com.example.jadeapi.model.Quiz;
import com.example.jadeapi.repository.QuizRepository;
import com.example.jadeapi.service.QuizService;
import com.example.jadeapi.dto.QuizInfoDTO;
// import java.util.List; // Evitar conflito, usar nome completo se necessário para java.util.List

public class TutorAgent extends Agent {

    private JSONObject lastReceivedRecommendations = null;

    private QuizRepository quizRepository;
    private QuizService quizService;
    private JadeService jadeServiceAgentAccess; 

    @Override
    protected void setup() {
        System.out.println("Agente Tutor " + getLocalName() + " iniciando setup...");

        Object[] args = getArguments();
        if (args != null && args.length >= 2) { 
            if (args[0] instanceof QuizRepository) {
                this.quizRepository = (QuizRepository) args[0];
            }
            if (args[1] instanceof QuizService) {
                this.quizService = (QuizService) args[1];
            }
            if (args.length > 2 && args[2] instanceof JadeService) { 
                 this.jadeServiceAgentAccess = (JadeService) args[2];
            }
        }

        if (this.quizRepository == null || this.quizService == null) {
            System.err.println("[" + getLocalName() + "] ERRO: Dependências (QuizRepository ou QuizService) não foram injetadas corretamente!");
        } else {
            System.out.println("[" + getLocalName() + "] Dependências QuizRepository e QuizService injetadas.");
        }
        if (this.jadeServiceAgentAccess != null) {
            System.out.println("[" + getLocalName() + "] Dependência JadeService (para acesso de agente) injetada.");
        }

        System.out.println("Agente Tutor " + getLocalName() + " iniciado e pronto.");

        addBehaviour(new CyclicBehaviour(this) {
            @Override
            public void action() {
                ACLMessage msg = myAgent.receive();

                if (msg != null) {
                    System.out.println("[" + getLocalName() + "] Mensagem recebida de " + msg.getSender().getName() + ". Conteúdo: " + msg.getContent() + ". ConvID: " + msg.getConversationId());
                    String content = msg.getContent();
                    String conversationId = msg.getConversationId(); 

                    try {
                        JSONObject jsonContent = new JSONObject(content);
                        String action = jsonContent.optString("action", "unknown_action");

                        // BLOCO REINTRODUZIDO/CORRIGIDO:
                        if ("quiz_started".equals(action)) {
                            System.out.println("[" + getLocalName() + "] Notificado sobre início de quiz: " + content);
                            // Lógica futura: O TutorAgent poderia, por exemplo, registrar internamente 
                            // que este usuário começou este quiz, para uso em lógicas adaptativas futuras
                            // que não dependam apenas da última avaliação.
                            // Por ora, apenas logar é suficiente para esta notificação.

                        } else if ("evaluation_complete".equals(action) && msg.getSender().getLocalName().equals("evaluator")) {
                            System.out.println("[" + getLocalName() + "] Recebeu resultado da avaliação do EvaluatorAgent: " + content);
                            long userId = jsonContent.optLong("userId", -1);
                            double score = jsonContent.optDouble("score", -1.0);
                            long attemptId = jsonContent.optLong("attemptId", -1);
                            long lastQuizId = jsonContent.optLong("quizId", -1);

                            if (userId != -1 && quizRepository != null && quizService != null) {
                                Quiz lastQuizAttemptedEntity = quizRepository.findById(lastQuizId).orElse(null);
                                int difficultyOfLastQuiz = -1;
                                Long subjectIdOfLastQuiz = -1L; 

                                if (lastQuizAttemptedEntity != null) {
                                    difficultyOfLastQuiz = lastQuizAttemptedEntity.getDifficulty();
                                    if (lastQuizAttemptedEntity.getSubject() != null) {
                                        subjectIdOfLastQuiz = lastQuizAttemptedEntity.getSubject().getId();
                                    }
                                } else {
                                    System.err.println("[" + getLocalName() + "] Não foi possível encontrar o quiz com ID: " + lastQuizId);
                                }

                                java.util.List<QuizInfoDTO> allAvailableQuizzesDTO = quizService.getAllQuizzes();
                                JSONArray allAvailableQuizzesJson = new JSONArray();
                                for (QuizInfoDTO quizDTO : allAvailableQuizzesDTO) {
                                    JSONObject quizJson = new JSONObject();
                                    quizJson.put("id", quizDTO.getId());
                                    quizJson.put("name", quizDTO.getName());
                                    quizJson.put("description", quizDTO.getDescription());
                                    quizJson.put("difficulty", quizDTO.getDifficulty());
                                    if (quizDTO.getSubjectId() != null) { 
                                        quizJson.put("subjectId", quizDTO.getSubjectId());
                                    }
                                    allAvailableQuizzesJson.put(quizJson);
                                }

                                ACLMessage requestToRecommender = new ACLMessage(ACLMessage.REQUEST);
                                requestToRecommender.addReceiver(new AID("recommender", AID.ISLOCALNAME));
                                requestToRecommender.setLanguage("JSON");
                                requestToRecommender.setOntology("recommendation-generation");
                                String recConvId = "rec-" + System.currentTimeMillis() + "-" + userId; 
                                requestToRecommender.setConversationId(recConvId);

                                JSONObject recommenderPayload = new JSONObject();
                                recommenderPayload.put("action", "generate_recommendations_for_user");
                                recommenderPayload.put("userId", userId);
                                recommenderPayload.put("lastAttemptId", attemptId);
                                recommenderPayload.put("lastQuizId", lastQuizId);
                                recommenderPayload.put("lastScore", score);
                                recommenderPayload.put("difficultyOfLastQuiz", difficultyOfLastQuiz);
                                if (subjectIdOfLastQuiz != -1L) { 
                                    recommenderPayload.put("subjectIdOfLastQuiz", subjectIdOfLastQuiz);
                                }
                                recommenderPayload.put("allAvailableQuizzes", allAvailableQuizzesJson);

                                requestToRecommender.setContent(recommenderPayload.toString());
                                myAgent.send(requestToRecommender);
                                System.out.println("[" + getLocalName() + "] Pedido de recomendação (com dados reais) enviado para RecommenderAgent: " + recommenderPayload.toString() + " (ConvID: " + recConvId + ")");
                            } else {
                                 System.err.println("[" + getLocalName() + "] Não foi possível processar evaluation_complete. userId inválido ou dependências (quizRepository/quizService) não injetadas.");
                            }

                        } else if ("get_recommendations".equals(action) && msg.getPerformative() == ACLMessage.REQUEST) {
                            System.out.println("[" + getLocalName() + "] Recebeu pedido de recomendações do sistema: " + content + " (ConvID: " + conversationId + ")");
                            long userId = jsonContent.optLong("userId", -1);
                            
                            AID replyToAidFromMsg = null;
                            Object replyToFieldInMsg = msg.getAllReplyTo(); 
                            Iterator itReplyTo = null;

                            if (replyToFieldInMsg instanceof List) { 
                                itReplyTo = ((List) replyToFieldInMsg).iterator();
                            } else if (replyToFieldInMsg instanceof Iterator) { 
                                itReplyTo = (Iterator) replyToFieldInMsg;
                            }

                            if (itReplyTo != null && itReplyTo.hasNext()) {
                                Object aidObj = itReplyTo.next();
                                if (aidObj instanceof AID) {
                                    replyToAidFromMsg = (AID) aidObj;
                                }
                            }

                            if (replyToAidFromMsg == null) {
                                System.err.println("[" + getLocalName() + "] Campo 'replyTo' não definido ou inválido na mensagem de get_recommendations. Não posso responder.");
                            } else if (lastReceivedRecommendations != null && 
                                       lastReceivedRecommendations.optLong("userId", -2) == userId && 
                                       lastReceivedRecommendations.has("recommendations")) { 
                                
                                System.out.println("[" + getLocalName() + "] Recomendações já disponíveis para userId " + userId + ". Respondendo para " + replyToAidFromMsg.getLocalName());
                                
                                ACLMessage replyToService = new ACLMessage(ACLMessage.INFORM);
                                replyToService.addReceiver(replyToAidFromMsg);
                                replyToService.setLanguage("JSON");
                                replyToService.setOntology("recommendation-service-response");
                                replyToService.setConversationId(conversationId); 

                                JSONObject serviceReplyPayload = new JSONObject();
                                serviceReplyPayload.put("userId", lastReceivedRecommendations.optLong("userId", userId));
                                JSONObject recommendationsPart = lastReceivedRecommendations.optJSONObject("recommendations");
                                if (recommendationsPart != null) {
                                    serviceReplyPayload.put("recommendedQuizzes", recommendationsPart.optJSONArray("recommendedQuizzes"));
                                    serviceReplyPayload.put("message", recommendationsPart.optString("message"));
                                } else { 
                                    serviceReplyPayload.put("recommendedQuizzes", new org.json.JSONArray());
                                    serviceReplyPayload.put("message", "Erro ao extrair recomendações detalhadas.");
                                }
                                
                                replyToService.setContent(serviceReplyPayload.toString());
                                myAgent.send(replyToService);
                                System.out.println("[" + getLocalName() + "] Resposta com recomendações enviada para " + replyToAidFromMsg.getLocalName() + ": " + serviceReplyPayload.toString());
                                
                            } else {
                                 System.out.println("[" + getLocalName() + "] Recomendações (lastReceivedRecommendations) não disponíveis/adequadas para userId " + userId + " para responder ao serviço.");
                                 ACLMessage busyReply = new ACLMessage(ACLMessage.INFORM); 
                                 busyReply.addReceiver(replyToAidFromMsg);
                                 busyReply.setLanguage("JSON");
                                 busyReply.setOntology("recommendation-service-response");
                                 busyReply.setConversationId(conversationId);
                                 
                                 JSONObject emptyResponse = new JSONObject();
                                 emptyResponse.put("userId", userId);
                                 emptyResponse.put("recommendedQuizzes", new org.json.JSONArray());
                                 emptyResponse.put("message", "Recomendações ainda não disponíveis ou sendo processadas. Tente novamente mais tarde.");
                                 busyReply.setContent(emptyResponse.toString());
                                 myAgent.send(busyReply);
                            }
                        } else if ("recommendation_result".equals(action) && msg.getSender().getLocalName().equals("recommender")) {
                            System.out.println("[" + getLocalName() + "] Recebeu recomendações do RecommenderAgent: " + content + " (ConvID Resposta Recommender: " + msg.getConversationId() + ")");
                            lastReceivedRecommendations = jsonContent; 
                            if (lastReceivedRecommendations != null) {
                                System.out.println("[" + getLocalName() + "] Recomendações do Recommender armazenadas temporariamente: " + lastReceivedRecommendations.toString());
                            }
                        } else { // Este 'else' agora só pega ações realmente não tratadas.
                            System.out.println("[" + getLocalName() + "] Ação desconhecida ou não tratada: " + action + " - Conteúdo: " + content);
                        }

                    } catch (JSONException e) {
                        System.err.println("[" + getLocalName() + "] Erro ao fazer parse do JSON: " + content + " - " + e.getMessage());
                    }
                } else {
                    block();
                }
            }
        });
    }

    @Override
    protected void takeDown() {
        System.out.println("Agente Tutor " + getLocalName() + " finalizando.");
    }
}
