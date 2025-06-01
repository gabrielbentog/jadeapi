package com.example.jadeapi.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "alternatives") // Corresponde à tabela 'alternatives' em schema.sql
public class Alternative {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Compatível com BIGSERIAL
    private Long id;

    @ManyToOne
    @JoinColumn(name = "question_id", nullable = false) // Chave estrangeira para questions
    private Question question;

    @Column(nullable = false) // Corresponde a INT NOT NULL em schema.sql
    private int position; // Para ordenar as alternativas A, B, C, D...

    @Column(nullable = false, columnDefinition = "TEXT") // Corresponde a TEXT NOT NULL em schema.sql
    private String body;

    @Column(name = "is_correct", nullable = false) // Corresponde a BOOLEAN NOT NULL em schema.sql
    private boolean isCorrect;

    @Column(nullable = false, columnDefinition = "TEXT") // Corresponde a TEXT NOT NULL em schema.sql
    private String justification;

    // Construtor padrão
    public Alternative() {
    }

    // Construtor com campos
    public Alternative(Question question, int position, String body, boolean isCorrect, String justification) {
        this.question = question;
        this.position = position;
        this.body = body;
        this.isCorrect = isCorrect;
        this.justification = justification;
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

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public boolean isCorrect() {
        return isCorrect;
    }

    public void setCorrect(boolean correct) {
        isCorrect = correct;
    }

    public String getJustification() {
        return justification;
    }

    public void setJustification(String justification) {
        this.justification = justification;
    }
}
