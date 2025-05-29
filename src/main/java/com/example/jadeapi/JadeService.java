package com.example.jadeapi;

import jade.core.AID;
import jade.core.Agent;
import jade.core.Profile;
import jade.core.ProfileImpl;
import jade.core.Runtime;
import jade.lang.acl.ACLMessage;
import jade.wrapper.AgentContainer;

import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;

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
            e.printStackTrace();
        }
    }

    public void enviarMensagem(String agente, String conteudo) {
        ACLMessage msg = new ACLMessage(ACLMessage.INFORM);
        msg.setContent(conteudo);
        msg.addReceiver(new AID(agente, AID.ISLOCALNAME));

        try {
            container.createNewAgent("tempSender", SenderAgent.class.getName(), new Object[]{msg}).start();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
