package com.example.jadeapi;

import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;
import jade.core.AID; // Para responder ao TutorAgent

public class RecommenderAgent extends Agent {

    @Override
    protected void setup() {
        System.out.println("Agente Recomendador " + getLocalName() + " iniciado e pronto para receber mensagens.");

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

                    // if ("generate_recommendations".equals(action)) {
                    //     System.out.println("[" + getLocalName() + "] Recebeu pedido para gerar recomendações: " + content);
                    //     // Extrair userId, score, etc. do 'content'
                    //     // Aplicar lógica de recomendação (consultar histórico, regras, etc.)
                    //     //
                    //     // Exemplo de como responder ao TutorAgent (que fez a solicitação):
                    //     // ACLMessage reply = msg.createReply();
                    //     // reply.setPerformative(ACLMessage.INFORM);
                    //     // reply.setLanguage("JSON");
                    //     // reply.setOntology("recommendation-response");
                    //     // reply.setContent("{\"userId\": " + json.optLong("userId") + ", \"recommendedQuizzes\": [{\"id\":1, \"name\":\"Quiz A\"}]}");
                    //     // myAgent.send(reply);
                    // }

                } else {
                    block(); // Espera por novas mensagens
                }
            }
        });
    }

    @Override
    protected void takeDown() {
        System.out.println("Agente Recomendador " + getLocalName() + " finalizando.");
    }
}