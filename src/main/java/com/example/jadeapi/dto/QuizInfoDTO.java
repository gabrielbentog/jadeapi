package com.example.jadeapi.dto;

public class QuizInfoDTO {
    private Long id;
    private String name;
    private String description;
    private int difficulty;
    private Long subjectId; // NOVO CAMPO
    private String subjectName; // Opcional: para exibir o nome da matéria

    // Construtor padrão
    public QuizInfoDTO() {
    }

    // Construtor atualizado
    public QuizInfoDTO(Long id, String name, String description, int difficulty, Long subjectId, String subjectName) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.difficulty = difficulty;
        this.subjectId = subjectId;
        this.subjectName = subjectName;
    }
    
    // Construtor antigo (pode manter para compatibilidade ou remover se não for mais usado)
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

    public Long getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Long subjectId) {
        this.subjectId = subjectId;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }
}