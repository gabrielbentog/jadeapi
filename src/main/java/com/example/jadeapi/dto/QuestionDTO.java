package com.example.jadeapi.dto;

import java.util.List;

public class QuestionDTO {

    private Long id;
    private String body;
    private int difficulty;
    private List<AlternativeDTO> alternatives; // Usando o AlternativeDTO que criamos

    // Construtor padrão
    public QuestionDTO() {
    }

    // Construtor com todos os campos
    public QuestionDTO(Long id, String body, int difficulty, List<AlternativeDTO> alternatives) {
        this.id = id;
        this.body = body;
        this.difficulty = difficulty;
        this.alternatives = alternatives;
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

    public List<AlternativeDTO> getAlternatives() {
        return alternatives;
    }

    public void setAlternatives(List<AlternativeDTO> alternatives) {
        this.alternatives = alternatives;
    }
}
