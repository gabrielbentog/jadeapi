package com.example.jadeapi;

import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;

public class ReplyListenerAgent extends Agent {
    private JadeService jadeService;

    @Override
    protected void setup() {
        System.out.println("Agente ReplyListener " + getLocalName() + " iniciado.");
        Object[] args = getArguments();
        if (args != null && args.length > 0 && args[0] instanceof JadeService) {
            this.jadeService = (JadeService) args[0];
        } else {
            System.err.println("ReplyListenerAgent: JadeService não fornecido nos argumentos!");
            doDelete(); // Se não puder funcionar, se remove
            return;
        }

        addBehaviour(new CyclicBehaviour(this) {
            @Override
            public void action() {
                ACLMessage msg = myAgent.receive();
                if (msg != null) {
                    // Verifica se é uma resposta que o JadeService está esperando
                    System.out.println("[" + getLocalName() + "] Mensagem recebida para JadeService: De " + msg.getSender().getName() + ", ConvID: " + msg.getConversationId() + ", Conteúdo: " + msg.getContent());
                    jadeService.completeReplyFuture(msg);
                } else {
                    block();
                }
            }
        });
    }
}