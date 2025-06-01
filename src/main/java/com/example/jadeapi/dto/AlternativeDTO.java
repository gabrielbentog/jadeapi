package com.example.jadeapi.dto;

public class AlternativeDTO {

    private Long id;
    private String body;
    private int position; // Para manter a ordem A, B, C, D...

    // Construtor padrão
    public AlternativeDTO() {
    }

    // Construtor com todos os campos
    public AlternativeDTO(Long id, String body, int position) {
        this.id = id;
        this.body = body;
        this.position = position;
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

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }
}
