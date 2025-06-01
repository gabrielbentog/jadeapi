package com.example.jadeapi.dto;

import java.util.List;

public class RecommendationDTO {

    private Long userId; // Opcional: para quem são estas recomendações
    private List<QuizInfoDTO> recommendedQuizzes;
    private String message; // Opcional: uma mensagem para o usuário, ex: "Baseado no seu desempenho..."

    // Construtor padrão
    public RecommendationDTO() {
    }

    // Construtor com campos
    public RecommendationDTO(Long userId, List<QuizInfoDTO> recommendedQuizzes, String message) {
        this.userId = userId;
        this.recommendedQuizzes = recommendedQuizzes;
        this.message = message;
    }

    // Construtor apenas com quizzes (mais comum)
    public RecommendationDTO(List<QuizInfoDTO> recommendedQuizzes) {
        this.recommendedQuizzes = recommendedQuizzes;
    }

    // Getters e Setters
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public List<QuizInfoDTO> getRecommendedQuizzes() {
        return recommendedQuizzes;
    }

    public void setRecommendedQuizzes(List<QuizInfoDTO> recommendedQuizzes) {
        this.recommendedQuizzes = recommendedQuizzes;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
