package com.example.jadeapi.service;

import com.example.jadeapi.JadeService;
import com.example.jadeapi.dto.QuizInfoDTO;
import com.example.jadeapi.dto.RecommendationDTO;
import com.example.jadeapi.model.Quiz; // Para a lógica de placeholder
import com.example.jadeapi.repository.QuizAttemptRepository;
import com.example.jadeapi.repository.QuizRepository;
import com.example.jadeapi.repository.UserRepository;
import jakarta.persistence.EntityNotFoundException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class AdaptiveLearningService {

    private final JadeService jadeService;
    private final QuizRepository quizRepository; // Para a lógica de placeholder
    private final UserRepository userRepository;
    private final QuizAttemptRepository quizAttemptRepository; // Para futuras lógicas adaptativas

    @Autowired
    public AdaptiveLearningService(JadeService jadeService,
                                   QuizRepository quizRepository,
                                   UserRepository userRepository,
                                   QuizAttemptRepository quizAttemptRepository) {
        this.jadeService = jadeService;
        this.quizRepository = quizRepository;
        this.userRepository = userRepository;
        this.quizAttemptRepository = quizAttemptRepository;
    }

    /**
     * Obtém recomendações de quizzes para um usuário.
     * Tenta obter recomendações do sistema de agentes JADE.
     * Se falhar ou ocorrer timeout, usa uma lógica de placeholder.
     *
     * @param userId O ID do usuário para o qual obter recomendações.
     * @return Um RecommendationDTO contendo os quizzes recomendados.
     */
    public RecommendationDTO getRecommendations(Long userId) {
        userRepository.findById(userId)
                .orElseThrow(() -> new EntityNotFoundException("Usuário não encontrado com ID: " + userId));

        String getRecommendationsMessage = String.format(
            "{\"action\":\"get_recommendations\", \"userId\":%d}",
            userId
        );
        
        System.out.println("AdaptiveLearningService: Solicitando recomendações ao TutorAgent para userId: " + userId);
        String agentResponseJson = jadeService.enviarMensagemComResposta(
            "tutor", // Agente de destino
            getRecommendationsMessage, // Conteúdo da mensagem
            "recommendation-request-to-tutor", // Ontologia da requisição
            5000 // Timeout em milissegundos (5 segundos)
        );
        System.out.println("AdaptiveLearningService: Resposta do TutorAgent (via JadeService): " + agentResponseJson);

        if (agentResponseJson != null && !agentResponseJson.toLowerCase().contains("\"error\"") && !agentResponseJson.toLowerCase().contains("timeout")) {
            try {
                JSONObject responseJson = new JSONObject(agentResponseJson);
                // A resposta esperada do TutorAgent (após processar a resposta do RecommenderAgent)
                // deve ser algo como: {"userId":X, "recommendedQuizzes":[...], "message":"..."}
                
                List<QuizInfoDTO> recommendedQuizInfos = new ArrayList<>();
                JSONArray quizzesArray = responseJson.optJSONArray("recommendedQuizzes");
                if (quizzesArray != null) {
                    for (int i = 0; i < quizzesArray.length(); i++) {
                        JSONObject quizJson = quizzesArray.getJSONObject(i);
                        recommendedQuizInfos.add(new QuizInfoDTO(
                                quizJson.getLong("id"),
                                quizJson.getString("name"),
                                quizJson.optString("description"), // optString para campos que podem não vir
                                quizJson.optInt("difficulty")      // optInt para campos que podem não vir
                        ));
                    }
                }
                return new RecommendationDTO(
                        responseJson.optLong("userId", userId), // Pega o userId da resposta, ou usa o original como fallback
                        recommendedQuizInfos,
                        responseJson.optString("message", "Recomendações recebidas do sistema de agentes.")
                );
            } catch (JSONException e) {
                System.err.println("AdaptiveLearningService: Erro ao fazer parse da resposta do TutorAgent: " + e.getMessage() + ". Resposta: " + agentResponseJson);
                // Fallback em caso de erro de parse
                return getPlaceholderRecommendations(userId, "Erro ao processar recomendações dos agentes.");
            }
        } else {
            // Se houve erro na comunicação com o agente (timeout, erro retornado pelo agente, etc.)
            System.err.println("AdaptiveLearningService: Não foi possível obter recomendações do TutorAgent ou houve erro/timeout. Resposta bruta: " + agentResponseJson);
            return getPlaceholderRecommendations(userId, "Falha ao obter recomendações dos agentes, usando sugestões padrão.");
        }
    }

    /**
     * Gera recomendações de placeholder caso a comunicação com os agentes falhe.
     */
    private RecommendationDTO getPlaceholderRecommendations(Long userId, String message) {
        List<Quiz> allQuizzes = quizRepository.findAll();
        List<QuizInfoDTO> placeholderQuizInfos;

        if (allQuizzes.isEmpty()) {
            placeholderQuizInfos = Collections.emptyList();
        } else {
            placeholderQuizInfos = allQuizzes.stream()
                    .limit(2) // Pega os 2 primeiros como exemplo de placeholder
                    .map(quiz -> new QuizInfoDTO(quiz.getId(), quiz.getName(), quiz.getDescription(), quiz.getDifficulty()))
                    .collect(Collectors.toList());
        }
        
        String finalMessage = placeholderQuizInfos.isEmpty() ?
                "Não há quizzes disponíveis no momento." : message;

        return new RecommendationDTO(userId, placeholderQuizInfos, finalMessage);
    }
}