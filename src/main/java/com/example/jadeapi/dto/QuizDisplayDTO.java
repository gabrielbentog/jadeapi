package com.example.jadeapi.dto;

import java.util.List;

public class QuizDisplayDTO {

    private Long attemptId; // ID da tentativa de quiz (QuizAttempt)
    private String quizName;
    private List<QuestionDTO> questions; // Lista de questões para o quiz

    // Construtor padrão
    public QuizDisplayDTO() {
    }

    // Construtor com todos os campos
    public QuizDisplayDTO(Long attemptId, String quizName, List<QuestionDTO> questions) {
        this.attemptId = attemptId;
        this.quizName = quizName;
        this.questions = questions;
    }

    // Getters e Setters
    public Long getAttemptId() {
        return attemptId;
    }

    public void setAttemptId(Long attemptId) {
        this.attemptId = attemptId;
    }

    public String getQuizName() {
        return quizName;
    }

    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }

    public List<QuestionDTO> getQuestions() {
        return questions;
    }

    public void setQuestions(List<QuestionDTO> questions) {
        this.questions = questions;
    }
}
