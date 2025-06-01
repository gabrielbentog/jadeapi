package com.example.jadeapi.dto;

public class AnswerFeedbackDTO {

    private Long questionId;
    private String questionBody;
    private Long selectedAlternativeId;
    private String selectedAlternativeBody;
    private boolean isCorrect;
    private Long correctAlternativeId; // Opcional, mas útil para mostrar a resposta correta
    private String correctAlternativeBody; // Opcional
    private String justification; // Justificativa da alternativa correta

    // Construtor padrão
    public AnswerFeedbackDTO() {
    }

    // Construtor com campos
    public AnswerFeedbackDTO(Long questionId, String questionBody, Long selectedAlternativeId,
            String selectedAlternativeBody, boolean isCorrect,
            Long correctAlternativeId, String correctAlternativeBody, String justification) {
        this.questionId = questionId;
        this.questionBody = questionBody;
        this.selectedAlternativeId = selectedAlternativeId;
        this.selectedAlternativeBody = selectedAlternativeBody;
        this.isCorrect = isCorrect;
        this.correctAlternativeId = correctAlternativeId;
        this.correctAlternativeBody = correctAlternativeBody;
        this.justification = justification;
    }

    // Getters e Setters
    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    public String getQuestionBody() {
        return questionBody;
    }

    public void setQuestionBody(String questionBody) {
        this.questionBody = questionBody;
    }

    public Long getSelectedAlternativeId() {
        return selectedAlternativeId;
    }

    public void setSelectedAlternativeId(Long selectedAlternativeId) {
        this.selectedAlternativeId = selectedAlternativeId;
    }

    public String getSelectedAlternativeBody() {
        return selectedAlternativeBody;
    }

    public void setSelectedAlternativeBody(String selectedAlternativeBody) {
        this.selectedAlternativeBody = selectedAlternativeBody;
    }

    public boolean isCorrect() {
        return isCorrect;
    }

    public void setCorrect(boolean correct) {
        isCorrect = correct;
    }

    public Long getCorrectAlternativeId() {
        return correctAlternativeId;
    }

    public void setCorrectAlternativeId(Long correctAlternativeId) {
        this.correctAlternativeId = correctAlternativeId;
    }

    public String getCorrectAlternativeBody() {
        return correctAlternativeBody;
    }

    public void setCorrectAlternativeBody(String correctAlternativeBody) {
        this.correctAlternativeBody = correctAlternativeBody;
    }

    public String getJustification() {
        return justification;
    }

    public void setJustification(String justification) {
        this.justification = justification;
    }
}
