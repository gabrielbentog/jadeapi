package com.example.jadeapi;

import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;
import jade.core.AID;
import org.json.JSONObject; // Importar a classe JSONObject
import org.json.JSONException; // Importar para tratar exceções de parsing

public class EvaluatorAgent extends Agent {

    @Override
    protected void setup() {
        System.out.println("Agente Avaliador " + getLocalName() + " iniciado e pronto para processar avaliações.");

        addBehaviour(new CyclicBehaviour(this) {
            @Override
            public void action() {
                ACLMessage msg = myAgent.receive();

                if (msg != null) {
                    System.out.println("[" + getLocalName() + "] Mensagem recebida de " + msg.getSender().getName() + ". Conteúdo: " + msg.getContent());
                    String content = msg.getContent();
                    
                    try {
                        JSONObject jsonContent = new JSONObject(content);
                        String action = jsonContent.optString("action", "unknown_action"); // Pega a ação, com um default

                        if ("answer_submitted".equals(action)) {
                            System.out.println("[" + getLocalName() + "] Processando submissão de resposta: " + content);
                            // long attemptId = jsonContent.optLong("attemptId", -1);
                            // long questionId = jsonContent.optLong("questionId", -1);
                            // long selectedAlternativeId = jsonContent.optLong("selectedAlternativeId", -1);
                            // System.out.println(String.format("[%s] Detalhes: attemptId=%d, questionId=%d, selectedAlternativeId=%d", 
                            //    getLocalName(), attemptId, questionId, selectedAlternativeId));
                            
                            // Por ora, apenas logamos, pois o score é calculado no service ao finalizar.
                            System.out.println("[" + getLocalName() + "] Resposta registrada pelo QuizAttemptService. Nenhuma ação adicional aqui por enquanto.");

                        } else if ("attempt_completed".equals(action)) {
                            System.out.println("[" + getLocalName() + "] Processando finalização de tentativa: " + content);
                            
                            long attemptId = jsonContent.optLong("attemptId", -1);
                            long userId = jsonContent.optLong("userId", -1);
                            long quizId = jsonContent.optLong("quizId", -1);
                            double finalScore = jsonContent.optDouble("finalScore", -1.0);
                        
                            if (attemptId != -1 && userId != -1 && quizId != -1 && finalScore != -1.0) {
                                System.out.println("[" + getLocalName() + "] Tentativa ID " + attemptId + " para Usuário ID " + userId + " no Quiz ID " + quizId + " finalizada com score: " + finalScore);

                                // Enviar resultado para o TutorAgent
                                ACLMessage resultToTutor = new ACLMessage(ACLMessage.INFORM);
                                resultToTutor.addReceiver(new AID("tutor", AID.ISLOCALNAME));
                                resultToTutor.setLanguage("JSON");
                                resultToTutor.setOntology("quiz-evaluation-result");

                                // Criar um novo JSONObject para a mensagem de resultado
                                JSONObject evaluationResultJson = new JSONObject();
                                evaluationResultJson.put("action", "evaluation_complete");
                                evaluationResultJson.put("attemptId", attemptId);
                                evaluationResultJson.put("userId", userId);
                                evaluationResultJson.put("quizId", quizId);
                                evaluationResultJson.put("score", finalScore);
                                
                                resultToTutor.setContent(evaluationResultJson.toString());
                                myAgent.send(resultToTutor);
                                System.out.println("[" + getLocalName() + "] Resultado da avaliação enviado para o TutorAgent: " + evaluationResultJson.toString());
                            } else {
                                System.err.println("[" + getLocalName() + "] Dados incompletos na mensagem 'attempt_completed': " + content);
                            }
                        } else {
                            System.out.println("[" + getLocalName() + "] Ação desconhecida: " + action + " - Conteúdo: " + content);
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

    // O método helper extractValue não é mais necessário, pode ser removido.

    @Override
    protected void takeDown() {
        System.out.println("Agente Avaliador " + getLocalName() + " finalizando.");
    }
}