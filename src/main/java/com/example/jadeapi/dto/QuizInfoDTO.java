package com.example.jadeapi.dto;

public class QuizInfoDTO {

    private Long id;
    private String name;
    private String description;
    private int difficulty;
    // Poderíamos adicionar o nome do Subject aqui também, se útil para a listagem
    // private String subjectName;

    // Construtor padrão
    public QuizInfoDTO() {
    }

    // Construtor com todos os campos
    public QuizInfoDTO(Long id, String name, String description, int difficulty) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.difficulty = difficulty;
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

    // Getter e Setter para subjectName se adicionado
    // public String getSubjectName() {
    //     return subjectName;
    // }
    // public void setSubjectName(String subjectName) {
    //     this.subjectName = subjectName;
    // }
}
