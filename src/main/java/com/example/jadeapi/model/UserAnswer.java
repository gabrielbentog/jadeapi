package com.example.jadeapi.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "user_answers")
public class UserAnswer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Compatível com BIGSERIAL
    private Long id;

    @ManyToOne
    @JoinColumn(name = "question_id", nullable = false) // Chave estrangeira para questions
    private Question question;

    @ManyToOne
    @JoinColumn(name = "alternative_id", nullable = false) // Chave estrangeira para alternatives
    private Alternative selectedAlternative;

    @ManyToOne
    @JoinColumn(name = "quiz_attempt_id", nullable = false) // Chave estrangeira para quiz_attempts
    private QuizAttempt quizAttempt;

    @Column(name = "answered_at")
    private LocalDateTime answeredAt;

    // Você pode adicionar um campo para armazenar se a resposta foi correta no momento da submissão,
    // embora isso também possa ser derivado comparando selectedAlternative.isCorrect()
    @Column(name = "is_correct_at_submission")
    private Boolean isCorrectAtSubmission;

    // Construtor padrão
    public UserAnswer() {
    }

    // Construtor com campos
    public UserAnswer(Question question, Alternative selectedAlternative, QuizAttempt quizAttempt) {
        this.question = question;
        this.selectedAlternative = selectedAlternative;
        this.quizAttempt = quizAttempt;
        this.answeredAt = LocalDateTime.now();
        if (selectedAlternative != null) {
            this.isCorrectAtSubmission = selectedAlternative.isCorrect();
        }
    }

    // Getters e Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public Alternative getSelectedAlternative() {
        return selectedAlternative;
    }

    public void setSelectedAlternative(Alternative selectedAlternative) {
        this.selectedAlternative = selectedAlternative;
        if (selectedAlternative != null) {
            this.isCorrectAtSubmission = selectedAlternative.isCorrect();
        }
    }

    public QuizAttempt getQuizAttempt() {
        return quizAttempt;
    }

    public void setQuizAttempt(QuizAttempt quizAttempt) {
        this.quizAttempt = quizAttempt;
    }

    public LocalDateTime getAnsweredAt() {
        return answeredAt;
    }

    public void setAnsweredAt(LocalDateTime answeredAt) {
        this.answeredAt = answeredAt;
    }

    public Boolean getCorrectAtSubmission() {
        return isCorrectAtSubmission;
    }

    public void setCorrectAtSubmission(Boolean correctAtSubmission) {
        isCorrectAtSubmission = correctAtSubmission;
    }
}
