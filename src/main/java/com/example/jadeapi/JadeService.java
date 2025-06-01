package com.example.jadeapi;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import com.example.jadeapi.repository.QuizRepository; // Importar QuizRepository
import com.example.jadeapi.service.QuizService;       // Importar QuizService
import org.springframework.beans.factory.annotation.Autowired; // Importar Autowired
import org.springframework.stereotype.Service;

import jade.core.AID;
import jade.core.Profile;
import jade.core.ProfileImpl;
import jade.core.Runtime;
import jade.lang.acl.ACLMessage;
import jade.wrapper.AgentContainer;
import jade.wrapper.StaleProxyException;

import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;


@Service
public class JadeService {

    private AgentContainer container;
    private Runtime rt;
    private final Map<String, CompletableFuture<ACLMessage>> pendingReplies = new ConcurrentHashMap<>();

    private final QuizRepository quizRepository; // Campo para QuizRepository
    private final QuizService quizService;       // Campo para QuizService

    @Autowired // Construtor para injetar as dependências
    public JadeService(QuizRepository quizRepository, QuizService quizService) {
        this.quizRepository = quizRepository;
        this.quizService = quizService;
    }

    @PostConstruct
    public void startJade() {
        rt = Runtime.instance();
        Profile profile = new ProfileImpl();
        profile.setParameter(Profile.MAIN_HOST, "localhost");
        profile.setParameter(Profile.MAIN_PORT, "1099"); 
        profile.setParameter(Profile.PLATFORM_ID, "JadeApiPlatform");

        container = rt.createMainContainer(profile);

        try {
            // Passar quizRepository e quizService como argumentos para o TutorAgent
            Object[] tutorArgs = new Object[]{this.quizRepository, this.quizService, this}; // Adicionado 'this' (JadeService)
            container.createNewAgent("tutor", TutorAgent.class.getName(), tutorArgs).start();

            container.createNewAgent("evaluator", EvaluatorAgent.class.getName(), null).start();
            container.createNewAgent("recommender", RecommenderAgent.class.getName(), null).start();
            
            Object[] replyListenerArgs = new Object[]{this}; // Passa a instância do JadeService
            container.createNewAgent("replyListenerAgent", ReplyListenerAgent.class.getName(), replyListenerArgs).start();
            
            System.out.println("Contêiner JADE e agentes principais (tutor, evaluator, recommender, replyListenerAgent) iniciados.");

        } catch (Exception e) {
            System.err.println("Erro crítico ao iniciar o contêiner JADE ou agentes: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void registerReplyFuture(String conversationId, CompletableFuture<ACLMessage> future) {
        pendingReplies.put(conversationId, future);
    }

    public void completeReplyFuture(ACLMessage reply) {
        String conversationId = reply.getConversationId();
        if (conversationId != null && pendingReplies.containsKey(conversationId)) {
            CompletableFuture<ACLMessage> future = pendingReplies.remove(conversationId); 
            if (future != null && !future.isDone()) { 
                future.complete(reply);
                System.out.println("JadeService: ReplyFuture completado para ConvID: " + conversationId);
            } else if (future == null) {
                 System.err.println("JadeService: ReplyFuture não encontrado para ConvID (já removido?): " + conversationId);
            } else { 
                 System.out.println("JadeService: ReplyFuture para ConvID " + conversationId + " já estava completado (possivelmente por timeout).");
            }
        } else {
            System.err.println("JadeService: Recebeu resposta para ConvID não esperado, já processado ou sem ConvID: " + conversationId + ". Conteúdo: " + reply.getContent());
        }
    }

    public String enviarMensagemComResposta(String agenteDestinoNomeLocal, String conteudoJson, String ontologia, long timeoutMillis) {
        ACLMessage msg = new ACLMessage(ACLMessage.REQUEST);
        msg.setContent(conteudoJson);
        msg.addReceiver(new AID(agenteDestinoNomeLocal, AID.ISLOCALNAME));
        msg.setLanguage("JSON");
        msg.setOntology(ontologia);
        
        String conversationId = "conv-" + System.currentTimeMillis() + "-" + agenteDestinoNomeLocal + "-" + Math.random();
        msg.setConversationId(conversationId);
        
        // Corrigido: use apenas addReplyTo() para adicionar um único AID
        AID listenerAID = new AID("replyListenerAgent", AID.ISLOCALNAME);
        msg.addReplyTo(listenerAID);

        CompletableFuture<ACLMessage> replyFuture = new CompletableFuture<>();
        registerReplyFuture(conversationId, replyFuture);

        String replyToNameForLogging = "UNKNOWN_REPLY_TO";
        jade.util.leap.Iterator it = msg.getAllReplyTo(); // Usando getAllReplyTo()

        if (it != null && it.hasNext()) {
            Object aidObj = it.next();
            if (aidObj instanceof AID) {
                replyToNameForLogging = ((AID) aidObj).getLocalName();
            }
        }

        System.out.println("JadeService: Enviando mensagem REQUEST com ConvID " + conversationId + " para " + agenteDestinoNomeLocal + 
                           ". Esperando resposta para " + replyToNameForLogging);
        enviarMensagemACL(msg);

        try {
            ACLMessage reply = replyFuture.get(timeoutMillis, TimeUnit.MILLISECONDS);
            System.out.println("JadeService: Resposta recebida para ConvID " + conversationId + ". Performative: " + 
                               ACLMessage.getPerformative(reply.getPerformative()) + ". Conteúdo: " + reply.getContent());
            
            if (reply.getPerformative() == ACLMessage.INFORM || reply.getPerformative() == ACLMessage.CONFIRM) {
                return reply.getContent();
            } else {
                String errorMsg = "Resposta inesperada do agente: " + ACLMessage.getPerformative(reply.getPerformative());
                System.err.println("JadeService: " + errorMsg + " para ConvID " + conversationId);
                return "{\"error\":\"" + errorMsg + "\", \"originalContent\":\"" + escapeJson(reply.getContent()) + "\"}";
            }
        } catch (Exception e) {
            System.err.println("JadeService: Timeout ou erro esperando resposta para ConvID " + conversationId + " - " + e.getClass().getSimpleName() + ": " + e.getMessage());
            pendingReplies.remove(conversationId);
            return "{\"error\":\"Timeout ("+timeoutMillis+"ms) ou erro (" + e.getClass().getSimpleName() + ") esperando resposta do agente: " + escapeJson(e.getMessage()) + "\"}";
        }
    }
    
    private String escapeJson(String s) {
        if (s == null) return null;
        return s.replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\b", "\\b")
                .replace("\f", "\\f")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("\t", "\\t");
    }

    private void enviarMensagemACL(ACLMessage msg) {
         try {
            String senderName = "tempSenderACL" + System.nanoTime();
            container.createNewAgent(senderName,
                                     SenderAgent.class.getName(),
                                     new Object[]{msg}).start();
        } catch (Exception e) {
            System.err.println("Erro ao criar tempSender para enviar ACL mensagem: " + e.getMessage());
            e.printStackTrace(); 
        }
    }

    public void enviarMensagem(String agenteDestinoNomeLocal, String conteudo) {
        ACLMessage msg = new ACLMessage(ACLMessage.INFORM);
        msg.setContent(conteudo);
        msg.addReceiver(new AID(agenteDestinoNomeLocal, AID.ISLOCALNAME));
        msg.setLanguage("JSON");
        enviarMensagemACL(msg);
    }

    @PreDestroy
    public void stopJade() {
        if (container != null) {
            try {
                System.out.println("Desligando o contêiner JADE...");
                container.kill(); 
                System.out.println("Contêiner JADE principal e seus agentes foram encerrados.");
            } catch (StaleProxyException e) {
                System.err.println("Erro ao tentar desligar o contêiner JADE: " + e.getMessage());
                e.printStackTrace();
            }
        }
    }
}