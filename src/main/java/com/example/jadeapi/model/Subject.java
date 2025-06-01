package com.example.jadeapi.model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "subject") // Corresponde à tabela 'subject' em schema.sql
public class Subject {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Compatível com BIGSERIAL
    private Long id;

    @Column(nullable = false, columnDefinition = "TEXT") // Corresponde a TEXT NOT NULL em schema.sql
    private String name;

    // Se você quiser navegar de Subject para Quizzes (relacionamento bidirecional)
    @OneToMany(mappedBy = "subject")
    private List<Quiz> quizzes;

    // Construtor padrão
    public Subject() {
    }

    // Construtor com nome
    public Subject(String name) {
        this.name = name;
    }

    // Getters e Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Quiz> getQuizzes() {
        return quizzes;
    }

    public void setQuizzes(List<Quiz> quizzes) {
        this.quizzes = quizzes;
    }
}
