package com.example.jadeapi.model;

import jakarta.persistence.*; // Importação para JPA annotations
import java.util.List;       // Importação para List

@Entity
@Table(name = "quizzes") // Garante que o nome da tabela é o mesmo do schema.sql
public class Quiz {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Usa a estratégia de identidade, compatível com BIGSERIAL do PostgreSQL
    private Long id;

    @Column(nullable = false) // Corresponde a VARCHAR(255) NOT NULL em schema.sql
    private String name;

    @Column(nullable = false) // Corresponde a VARCHAR(255) NOT NULL em schema.sql
    private String description;

    @Column(nullable = false) // Corresponde a INT NOT NULL em schema.sql
    private int difficulty;

    @ManyToOne // Relacionamento Muitos-para-Um com Subject
    @JoinColumn(name = "subject_id", nullable = false) // Mapeia a chave estrangeira subject_id
    private Subject subject;

    @ManyToMany // Relacionamento Muitos-para-Muitos com Question
    @JoinTable(
            name = "quiz_questions", // Nome da tabela de junção
            joinColumns = @JoinColumn(name = "quiz_id"),
            inverseJoinColumns = @JoinColumn(name = "question_id")
    )
    private List<Question> questions;

    // Construtor padrão exigido pelo JPA
    public Quiz() {
    }

    // Construtor com campos (você pode adicionar mais conforme necessário)
    public Quiz(String name, String description, int difficulty, Subject subject) {
        this.name = name;
        this.description = description;
        this.difficulty = difficulty;
        this.subject = subject;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(int difficulty) {
        this.difficulty = difficulty;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }
}
