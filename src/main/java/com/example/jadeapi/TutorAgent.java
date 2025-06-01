package com.example.jadeapi;

import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate; // Para filtrar mensagens no futuro

public class TutorAgent extends Agent {

    // No futuro, podemos injetar serviços Spring aqui se o agente precisar acessar o banco.
    // Isso requer uma configuração mais avançada para integrar o contexto Spring com JADE.
    // Por enquanto, o agente apenas reage a mensagens e pode delegar para outros agentes ou
    // esperar que os serviços Spring façam a persistência baseados nas mensagens enviadas a ele.

    @Override
    protected void setup() {
        System.out.println("Agente Tutor " + getLocalName() + " iniciado e pronto para receber mensagens.");

        addBehaviour(new CyclicBehaviour(this) {
            @Override
            public void action() {
                // Exemplo de como filtrar mensagens por um protocolo ou ontologia específica no futuro:
                // MessageTemplate mt = MessageTemplate.MatchPerformative(ACLMessage.REQUEST);
                // ACLMessage msg = myAgent.receive(mt);
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

                    // if ("quiz_started".equals(action)) {
                    //     System.out.println("[" + getLocalName() + "] Notificado sobre início de quiz: " + content);
                    //     // Poderia, por exemplo, registrar o início da tentativa para este usuário internamente.
                    // } else if ("get_recommendations".equals(action)) {
                    //     System.out.println("[" + getLocalName() + "] Recebeu pedido de recomendações: " + content);
                    //     // Aqui entraria a lógica adaptativa e o envio da resposta.
                    //     // Para responder:
                    //     // ACLMessage reply = msg.createReply();
                    //     // reply.setPerformative(ACLMessage.INFORM);
                    //     // reply.setContent("{\"recommendations\": [...]}"); // JSON com as recomendações
                    //     // myAgent.send(reply);
                    // } else if ("evaluation_complete".equals(action)) {
                    //     System.out.println("[" + getLocalName() + "] Recebeu resultado da avaliação: " + content);
                    //     // Processar o resultado da avaliação para a lógica adaptativa.
                    // }

                } else {
                    block(); // Espera por novas mensagens
                }
            }
        });
    }

    @Override
    protected void takeDown() {
        // Limpeza antes do agente terminar (se necessário)
        System.out.println("Agente Tutor " + getLocalName() + " finalizando.");
    }
}