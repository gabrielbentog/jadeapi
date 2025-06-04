// Arquivo: src/main/java/com/example/jadeapi/UserProfileForGA.java
package com.example.jadeapi;

import java.util.HashSet; // Usaremos Set para IDs de quizzes recentes para evitar duplicatas e ter busca rápida
import java.util.Set; // Implementação comum de Set

public class UserProfileForGA {

    private long userId;
    private double lastQuizScore;           // Pontuação do último quiz feito pelo usuário
    private int difficultyOfLastQuiz;       // Dificuldade do último quiz feito
    private Long subjectIdOfLastQuiz;       // ID da matéria do último quiz feito (pode ser null)
    private Set<Long> recentlyCompletedQuizIds; // IDs de quizzes que o usuário completou recentemente

    // Construtor
    public UserProfileForGA(long userId, double lastQuizScore, int difficultyOfLastQuiz,
            Long subjectIdOfLastQuiz, Set<Long> recentlyCompletedQuizIds) {
        this.userId = userId;
        this.lastQuizScore = lastQuizScore;
        this.difficultyOfLastQuiz = difficultyOfLastQuiz;
        this.subjectIdOfLastQuiz = subjectIdOfLastQuiz;
        // É uma boa prática criar uma nova cópia do Set para evitar modificações externas inesperadas
        this.recentlyCompletedQuizIds = recentlyCompletedQuizIds != null ? new HashSet<>(recentlyCompletedQuizIds) : new HashSet<>();
    }

    // Métodos Getters para acessar os dados
    public long getUserId() {
        return userId;
    }

    public double getLastQuizScore() {
        return lastQuizScore;
    }

    public int getDifficultyOfLastQuiz() {
        return difficultyOfLastQuiz;
    }

    public Long getSubjectIdOfLastQuiz() {
        return subjectIdOfLastQuiz;
    }

    public Set<Long> getRecentlyCompletedQuizIds() {
        return recentlyCompletedQuizIds;
    }
}
