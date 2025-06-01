package com.example.jadeapi.service;

import com.example.jadeapi.dto.QuizInfoDTO;
import com.example.jadeapi.dto.RecommendationDTO;
import com.example.jadeapi.model.Quiz;
import com.example.jadeapi.repository.QuizRepository; // Para a lógica de placeholder inicial
import com.example.jadeapi.repository.UserRepository;
import com.example.jadeapi.repository.QuizAttemptRepository; // Para futuras lógicas adaptativas
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
import com.example.jadeapi.JadeService;

@Service
public class AdaptiveLearningService {

    // Para a integração com JADE (será injetado depois)
    // private final JadeService jadeService;

    // Repositórios para lógica de placeholder ou futura lógica adaptativa mais complexa
    private final JadeService jadeService;
    private final QuizRepository quizRepository;
    private final UserRepository userRepository;
    private final QuizAttemptRepository quizAttemptRepository;


    @Autowired
    public AdaptiveLearningService(JadeService jadeService, // ADICIONAR JADESERVICE AO CONSTRUTOR
                                   QuizRepository quizRepository,
                                   UserRepository userRepository,
                                   QuizAttemptRepository quizAttemptRepository) {
        this.jadeService = jadeService; // ATRIBUIR JADESERVICE
        this.quizRepository = quizRepository;
        this.userRepository = userRepository;
        this.quizAttemptRepository = quizAttemptRepository;
    }

    /**
     * Obtém recomendações de quizzes para um usuário.
     * Nesta versão inicial, pode retornar uma lista fixa ou quizzes aleatórios.
     * A lógica de interação com o TutorAgent será adicionada posteriormente.
     *
     * @param userId O ID do usuário para o qual obter recomendações.
     * @return Um RecommendationDTO contendo os quizzes recomendados.
     */
    public RecommendationDTO getRecommendations(Long userId) {
        // Verifica se o usuário existe
        userRepository.findById(userId)
                .orElseThrow(() -> new EntityNotFoundException("Usuário não encontrado com ID: " + userId));

        // Notificar o TutorAgent (ou RecommenderAgent) para obter recomendações
        String getRecommendationsMessage = String.format(
            "{\"action\":\"get_recommendations\", \"userId\":%d}",
            userId
        );
        // Se você decidir que o TutorAgent gerencia e depois delega ao Recommender:
        jadeService.enviarMensagem("tutor", getRecommendationsMessage);
        // Ou se o RecommenderAgent é chamado diretamente:
        // jadeService.enviarMensagem("recommender", getRecommendationsMessage);
        System.out.println("Mensagem enviada para obter recomendações: " + getRecommendationsMessage); // Log para debug

        // Lógica de Placeholder (MANTENHA POR ENQUANTO COMO FALLBACK, ATÉ A RESPOSTA DO AGENTE SER IMPLEMENTADA)
        List<Quiz> allQuizzes = quizRepository.findAll();
        List<QuizInfoDTO> recommendedQuizInfos;

        if (allQuizzes.isEmpty()) {
            recommendedQuizInfos = Collections.emptyList();
        } else {
            recommendedQuizInfos = allQuizzes.stream()
                    .limit(3)
                    .map(quiz -> new QuizInfoDTO(quiz.getId(), quiz.getName(), quiz.getDescription(), quiz.getDifficulty()))
                    .collect(Collectors.toList());
        }

        String message = recommendedQuizInfos.isEmpty() ?
                "Não há quizzes recomendados no momento." :
                "Aqui estão alguns quizzes que podem te interessar!";
        
        return new RecommendationDTO(userId, recommendedQuizInfos, message);

        // Fluxo futuro com JADE (a ser implementado na Fase 4):
        // 1. Construir uma mensagem para o TutorAgent (ex: JSON com action="get_recommendations", userId=userId)
        // String jsonMessage = "{\"action\":\"get_recommendations\", \"userId\":" + userId + "}";
        // jadeService.enviarMensagem("tutor", jsonMessage);
        //
        // 2. Esperar/Obter a resposta do TutorAgent.
        //    Isso é complexo e pode envolver:
        //    a) Uma chamada bloqueante no JadeService que espera uma ACLMessage de resposta.
        //    b) O TutorAgent escreve as recomendações em uma tabela e este serviço lê.
        //    c) O TutorAgent faz uma chamada HTTP de volta para um endpoint específico.
        //
        // 3. Converter a resposta do agente para RecommendationDTO.
        // return new RecommendationDTO(...resposta do agente...);
    }
}