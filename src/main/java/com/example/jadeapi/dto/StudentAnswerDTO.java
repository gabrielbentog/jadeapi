package com.example.jadeapi.dto;

public class StudentAnswerDTO {

    private Long questionId;
    private Long selectedAlternativeId;
    // O attemptId será geralmente passado como um parâmetro de path na URL da API,
    // então não é estritamente necessário aqui no corpo da requisição,
    // mas pode ser incluído se o design da API preferir.

    // Construtor padrão
    public StudentAnswerDTO() {
    }

    // Construtor com todos os campos
    public StudentAnswerDTO(Long questionId, Long selectedAlternativeId) {
        this.questionId = questionId;
        this.selectedAlternativeId = selectedAlternativeId;
    }

    // Getters e Setters
    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    public Long getSelectedAlternativeId() {
        return selectedAlternativeId;
    }

    public void setSelectedAlternativeId(Long selectedAlternativeId) {
        this.selectedAlternativeId = selectedAlternativeId;
    }
}
