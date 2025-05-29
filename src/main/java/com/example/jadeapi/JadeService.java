package com.example.jadeapi;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;

import jade.core.AID;
import jade.core.Profile;
import jade.core.ProfileImpl;
import jade.core.Runtime;
import jade.lang.acl.ACLMessage;
import jade.wrapper.AgentContainer;

@Service
public class JadeService {

    private AgentContainer container;

    @PostConstruct
    public void startJade() {
        Runtime rt = Runtime.instance();
        Profile profile = new ProfileImpl();
        container = rt.createMainContainer(profile);

        try {
            container.createNewAgent("eco", EcoAgent.class.getName(), null).start();
        } catch (Exception e) {
            // Use a logger instead of printStackTrace
            System.err.println("Error creating agent: " + e.getMessage());
        }
    }

    public void enviarMensagem(String agente, String conteudo) {
        ACLMessage msg = new ACLMessage(ACLMessage.INFORM);
        msg.setContent(conteudo);
        msg.addReceiver(new AID(agente, AID.ISLOCALNAME));

        try {
            container.createNewAgent("tempSender", SenderAgent.class.getName(), new Object[]{msg}).start();
        } catch (Exception e) {
            // Use a logger instead of printStackTrace
            System.err.println("Error sending message: " + e.getMessage());
        }
    }
}
