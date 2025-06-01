package com.example.jadeapi.controller;

import com.example.jadeapi.dto.RecommendationDTO; // Importar RecommendationDTO
import com.example.jadeapi.model.User;
import com.example.jadeapi.repository.UserRepository;
import com.example.jadeapi.service.AdaptiveLearningService; // Importar AdaptiveLearningService
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping; // Importar GetMapping
import org.springframework.web.bind.annotation.PathVariable; // Importar PathVariable
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/users")
public class UserController {

    private final UserRepository userRepository; // Mantém o UserRepository para o createUser
    private final AdaptiveLearningService adaptiveLearningService; // Adicionar AdaptiveLearningService
    // O JadeService será injetado aqui na Fase 4 para o endpoint de recomendações, se necessário diretamente no controller.
    // private final JadeService jadeService;

    @Autowired
    public UserController(UserRepository userRepository, AdaptiveLearningService adaptiveLearningService) {
        this.userRepository = userRepository;
        this.adaptiveLearningService = adaptiveLearningService;
        // this.jadeService = jadeService; // Para Fase 4
    }

    @PostMapping
    public User createUser(@RequestBody User user) {
        // Validação simples para garantir que o nome não seja nulo ou vazio
        if (user.getName() == null || user.getName().trim().isEmpty()) {
            // Em um cenário real, você lançaria uma exceção mais específica
            // ou usaria anotações de validação (@Valid, @NotBlank) no DTO do User.
            throw new IllegalArgumentException("O nome do usuário não pode ser vazio.");
        }
        // Cria um novo usuário apenas com o nome, o ID será gerado pelo banco.
        return userRepository.save(new User(user.getName()));
    }

    /**
     * Obtém recomendações de quizzes para um usuário específico.
     */
    @GetMapping("/{userId}/recommendations")
    public ResponseEntity<RecommendationDTO> getUserRecommendations(@PathVariable Long userId) {
        RecommendationDTO recommendations = adaptiveLearningService.getRecommendations(userId);
        // Na Fase 4, a chamada ao adaptiveLearningService.getRecommendations(userId)
        // internamente poderá se comunicar com o TutorAgent (ou RecommenderAgent)
        // para obter as recomendações.
        // Exemplo de como o serviço poderia interagir com o agente (dentro do AdaptiveLearningService):
        // String messageContent = "{\"action\":\"get_recommendations\", \"userId\":" + userId + "}";
        // String agentResponseJson = jadeService.enviarMensagemComResposta("tutor", messageContent, 5000); // Exemplo de chamada síncrona
        // Converter agentResponseJson para RecommendationDTO
        return ResponseEntity.ok(recommendations);
    }
}