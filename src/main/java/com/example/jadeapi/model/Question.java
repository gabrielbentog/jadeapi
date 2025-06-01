package com.example.jadeapi.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.util.List;

@Entity
@Table(name = "questions") // Corresponde à tabela 'questions' em schema.sql
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Compatível com BIGSERIAL
    private Long id;

    @Column(nullable = false, columnDefinition = "TEXT") // Corresponde a TEXT NOT NULL em schema.sql
    private String body;

    @Column(nullable = false) // Corresponde a INT NOT NULL em schema.sql
    private int difficulty;

    @OneToMany(mappedBy = "question", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Alternative> alternatives;

    @ManyToMany(mappedBy = "questions") // Mapeado pelo campo 'questions' na entidade Quiz
    private List<Quiz> quizzes;

    // Construtor padrão
    public Question() {
    }

    // Construtor com campos essenciais
    public Question(String body, int difficulty) {
        this.body = body;
        this.difficulty = difficulty;
    }

    // Getters e Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public int getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(int difficulty) {
        this.difficulty = difficulty;
    }

    public List<Alternative> getAlternatives() {
        return alternatives;
    }

    public void setAlternatives(List<Alternative> alternatives) {
        this.alternatives = alternatives;
    }

    public List<Quiz> getQuizzes() {
        return quizzes;
    }

    public void setQuizzes(List<Quiz> quizzes) {
        this.quizzes = quizzes;
    }
}
