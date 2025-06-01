package com.example.jadeapi.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.time.LocalDateTime;
import java.util.List;
import com.example.jadeapi.model.enums.AttemptStatus;

@Entity
@Table(name = "quiz_attempts") // Corresponde à tabela 'quiz_attempts' em schema.sql
public class QuizAttempt {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Compatível com BIGSERIAL
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false) // Chave estrangeira para users
    private User user;

    @ManyToOne
    @JoinColumn(name = "quiz_id", nullable = false) // Chave estrangeira para quizzes
    private Quiz quiz;

    @Column(nullable = false) // Corresponde a DOUBLE PRECISION NOT NULL em schema.sql
    private double score;

    @Column(name = "start_time")
    private LocalDateTime startTime; // Usaremos LocalDateTime para melhor manipulação de data e hora

    @Column(name = "end_time")
    private LocalDateTime endTime;

    @Enumerated(EnumType.STRING) // Para armazenar o status como String no banco
    @Column(length = 20) // Define um tamanho para a coluna do Enum
    private AttemptStatus status;

    @OneToMany(mappedBy = "quizAttempt", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<UserAnswer> userAnswers;

    // Construtor padrão
    public QuizAttempt() {
    }

    // Construtor com campos essenciais
    public QuizAttempt(User user, Quiz quiz) {
        this.user = user;
        this.quiz = quiz;
        this.score = 0.0; // Score inicial
        this.startTime = LocalDateTime.now(); // Marca o início da tentativa
        this.status = AttemptStatus.IN_PROGRESS; // Status inicial
    }

    // Getters e Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Quiz getQuiz() {
        return quiz;
    }

    public void setQuiz(Quiz quiz) {
        this.quiz = quiz;
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

    public AttemptStatus getStatus() {
        return status;
    }

    public void setStatus(AttemptStatus status) {
        this.status = status;
    }

    public List<UserAnswer> getUserAnswers() {
        return userAnswers;
    }

    public void setUserAnswers(List<UserAnswer> userAnswers) {
        this.userAnswers = userAnswers;
    }
}
