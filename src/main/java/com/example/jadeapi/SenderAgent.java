package com.example.jadeapi;

import jade.core.Agent;
import jade.lang.acl.ACLMessage;

public class SenderAgent extends Agent {

    protected void setup() {
        Object[] args = getArguments();
        if (args != null && args.length > 0 && args[0] instanceof ACLMessage) {
            ACLMessage msg = (ACLMessage) args[0];
            send(msg);
        }
        doDelete();
    }
}
