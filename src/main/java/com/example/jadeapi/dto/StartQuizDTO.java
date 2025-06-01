package com.example.jadeapi.dto;

public class StartQuizDTO {

    private Long quizId;
    private Long userId; // Para identificar quem está iniciando o quiz

    // Construtor padrão
    public StartQuizDTO() {
    }

    // Construtor com todos os campos
    public StartQuizDTO(Long quizId, Long userId) {
        this.quizId = quizId;
        this.userId = userId;
    }

    // Getters e Setters
    public Long getQuizId() {
        return quizId;
    }

    public void setQuizId(Long quizId) {
        this.quizId = quizId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
