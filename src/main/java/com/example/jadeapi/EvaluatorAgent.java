package com.example.jadeapi;

import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate; // Para filtrar mensagens no futuro
import jade.core.AID; // Para enviar mensagens para outros agentes

public class EvaluatorAgent extends Agent {

    @Override
    protected void setup() {
        System.out.println("Agente Avaliador " + getLocalName() + " iniciado e pronto para receber mensagens.");

        addBehaviour(new CyclicBehaviour(this) {
            @Override
            public void action() {
                ACLMessage msg = myAgent.receive();

                if (msg != null) {
                    System.out.println("[" + getLocalName() + "] Mensagem recebida de " + msg.getSender().getName() + ": ");
                    System.out.println("  Conteúdo: " + msg.getContent());
                    System.out.println("  Performative: " + ACLMessage.getPerformative(msg.getPerformative()));
                    System.out.println("  Ontology: " + msg.getOntology());
                    System.out.println("  Language: " + msg.getLanguage());

                    // Lógica de processamento de mensagens virá aqui
                    // Exemplo:
                    // String content = msg.getContent();
                    // JSONObject json = new JSONObject(content); // Se estiver usando JSON
                    // String action = json.optString("action");

                    // if ("answer_submitted".equals(action)) {
                    //     System.out.println("[" + getLocalName() + "] Recebeu submissão de resposta: " + content);
                    //     // Lógica para verificar a resposta (pode precisar acessar o DB)
                    //     // Atualizar score parcial, etc.
                    //
                    // } else if ("attempt_completed".equals(action)) {
                    //     System.out.println("[" + getLocalName() + "] Recebeu finalização de tentativa: " + content);
                    //     // Lógica para calcular score final.
                    //     // Enviar resultado para o TutorAgent:
                    //     // ACLMessage resultToTutor = new ACLMessage(ACLMessage.INFORM);
                    //     // resultToTutor.addReceiver(new AID("tutor", AID.ISLOCALNAME)); // Assumindo que o nome do TutorAgent é "tutor"
                    //     // resultToTutor.setLanguage("JSON"); // Ou qualquer linguagem que você definir
                    //     // resultToTutor.setOntology("quiz-evaluation"); // Definir uma ontologia para a comunicação
                    //     // resultToTutor.setContent("{\"action\":\"evaluation_complete\", \"attemptId\": 123, \"score\": 85.0, \"userId\": 1 }");
                    //     // myAgent.send(resultToTutor);
                    // }

                } else {
                    block(); // Espera por novas mensagens
                }
            }
        });
    }

    @Override
    protected void takeDown() {
        System.out.println("Agente Avaliador " + getLocalName() + " finalizando.");
    }
}