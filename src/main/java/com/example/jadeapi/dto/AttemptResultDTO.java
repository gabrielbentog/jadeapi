package com.example.jadeapi.dto;

import java.time.LocalDateTime;
import java.util.List;

public class AttemptResultDTO {

    private Long attemptId;
    private Long quizId;
    private String quizName;
    private Long userId;
    private double score;
    private LocalDateTime startTime;
    private LocalDateTime endTime;
    private String status; // Ex: "COMPLETED", "IN_PROGRESS"
    private List<AnswerFeedbackDTO> answerFeedbacks; // Lista de feedback para cada resposta

    // Construtor padrão
    public AttemptResultDTO() {
    }

    // Construtor com todos os campos
    public AttemptResultDTO(Long attemptId, Long quizId, String quizName, Long userId, double score,
            LocalDateTime startTime, LocalDateTime endTime, String status,
            List<AnswerFeedbackDTO> answerFeedbacks) {
        this.attemptId = attemptId;
        this.quizId = quizId;
        this.quizName = quizName;
        this.userId = userId;
        this.score = score;
        this.startTime = startTime;
        this.endTime = endTime;
        this.status = status;
        this.answerFeedbacks = answerFeedbacks;
    }

    // Getters e Setters
    public Long getAttemptId() {
        return attemptId;
    }

    public void setAttemptId(Long attemptId) {
        this.attemptId = attemptId;
    }

    public Long getQuizId() {
        return quizId;
    }

    public void setQuizId(Long quizId) {
        this.quizId = quizId;
    }

    public String getQuizName() {
        return quizName;
    }

    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public LocalDateTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalDateTime startTime) {
        this.startTime = startTime;
    }

    public LocalDateTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalDateTime endTime) {
        this.endTime = endTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<AnswerFeedbackDTO> getAnswerFeedbacks() {
        return answerFeedbacks;
    }

    public void setAnswerFeedbacks(List<AnswerFeedbackDTO> answerFeedbacks) {
        this.answerFeedbacks = answerFeedbacks;
    }
}
