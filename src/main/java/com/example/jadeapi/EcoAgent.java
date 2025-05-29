package com.example.jadeapi;

import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;

public class EcoAgent extends Agent {

    @Override
    protected void setup() {
        System.out.println("Agente " + getLocalName() + " pronto.");

        addBehaviour(new CyclicBehaviour(this) {
            @Override
            public void action() {
                ACLMessage msg = receive();
                if (msg != null) {
                    System.out.println("[" + getLocalName() + "] recebeu: " + msg.getContent());
                } else {
                    block();
                }
            }
        });
    }
}
