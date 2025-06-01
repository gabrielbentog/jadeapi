package com.example.jadeapi;

import javax.annotation.PostConstruct; // Mantém esta importação
// import javax.annotation.PreDestroy; // Se você for adicionar o método PreDestroy

import org.springframework.stereotype.Service;

import jade.core.AID;
import jade.core.Profile;
import jade.core.ProfileImpl;
import jade.core.Runtime;
import jade.lang.acl.ACLMessage;
import jade.wrapper.AgentContainer;
import jade.wrapper.StaleProxyException; // Para o PreDestroy

@Service
public class JadeService {

    private AgentContainer container;
    private Runtime rt; // Guardar a instância do Runtime

    @PostConstruct
    public void startJade() {
        rt = Runtime.instance(); // Obtém a instância do JADE Runtime
        Profile profile = new ProfileImpl();
        // Adicione parâmetros ao perfil se necessário, por exemplo:
        // profile.setParameter(Profile.GUI, "true"); // Para iniciar a GUI do JADE (requer dependências e config adicionais)
        profile.setParameter(Profile.MAIN_HOST, "localhost");
        profile.setParameter(Profile.MAIN_PORT, "1099"); // Porta padrão do JADE
        profile.setParameter(Profile.PLATFORM_ID, "JadeApiPlatform");


        container = rt.createMainContainer(profile); // Cria o contêiner principal

        try {
            // Cria e inicia os novos agentes
            container.createNewAgent("tutor", TutorAgent.class.getName(), null).start();
            container.createNewAgent("evaluator", EvaluatorAgent.class.getName(), null).start();
            container.createNewAgent("recommender", RecommenderAgent.class.getName(), null).start();

            System.out.println("Contêiner JADE e agentes principais iniciados.");

        } catch (Exception e) {
            // Use um logger em um projeto real
            System.err.println("Erro crítico ao iniciar o contêiner JADE ou agentes: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Método para enviar mensagens permanece o mesmo
    public void enviarMensagem(String agenteDestinoNomeLocal, String conteudo) {
        ACLMessage msg = new ACLMessage(ACLMessage.INFORM); // Ou outro performative conforme necessário
        msg.setContent(conteudo);
        msg.addReceiver(new AID(agenteDestinoNomeLocal, AID.ISLOCALNAME));
        // Você pode querer definir a linguagem e ontologia aqui também:
        // msg.setLanguage("JSON");
        // msg.setOntology("jade-api-communication");

        try {
            // Cria um SenderAgent temporário para enviar a mensagem
            // O SenderAgent se auto-destrói após o envio
            container.createNewAgent("tempSender" + System.currentTimeMillis(), // Nome único para evitar conflitos
                                     SenderAgent.class.getName(),
                                     new Object[]{msg}).start();
        } catch (Exception e) {
            System.err.println("Erro ao criar tempSender para enviar mensagem: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Opcional: Adicionar um método para desligar o contêiner JADE quando a aplicação Spring for encerrada
    // @PreDestroy
    // public void stopJade() {
    //     if (container != null) {
    //         try {
    //             System.out.println("Desligando o contêiner JADE...");
    //             container.kill(); // Encerra o contêiner e todos os seus agentes
    //             // rt.shutDown(); // Desliga o JADE Runtime completamente
    //             System.out.println("Contêiner JADE desligado.");
    //         } catch (StaleProxyException e) {
    //             System.err.println("Erro ao desligar o contêiner JADE: " + e.getMessage());
    //             e.printStackTrace();
    //         }
    //     }
    // }
}