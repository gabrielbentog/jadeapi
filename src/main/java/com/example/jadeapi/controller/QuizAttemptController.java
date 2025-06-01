package com.example.jadeapi.controller;

import com.example.jadeapi.dto.QuizDisplayDTO;
import com.example.jadeapi.dto.StartQuizDTO;
import com.example.jadeapi.dto.StudentAnswerDTO;
import com.example.jadeapi.dto.AttemptResultDTO; // Importar DTO de resultado
import com.example.jadeapi.service.QuizAttemptService;
import jakarta.validation.Valid; // Para validação do corpo da requisição
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/attempts") // Endpoint base para tentativas
public class QuizAttemptController {

    private final QuizAttemptService quizAttemptService;
    // O JadeService será injetado aqui na Fase 4 para enviar mensagens aos agentes
    // private final JadeService jadeService;

    @Autowired
    public QuizAttemptController(QuizAttemptService quizAttemptService) {
        this.quizAttemptService = quizAttemptService;
        // this.jadeService = jadeService; // Para Fase 4
    }

    /**
     * Inicia uma nova tentativa de quiz.
     * Corresponde ao POST /start-quiz do diagrama.
     */
    @PostMapping("/start")
    public ResponseEntity<QuizDisplayDTO> startQuiz(@Valid @RequestBody StartQuizDTO startQuizDTO) {
        QuizDisplayDTO quizDisplay = quizAttemptService.startQuizAttempt(startQuizDTO);
        // Na Fase 4, após iniciar a tentativa, podemos notificar o TutorAgent:
        // String messageContent = "{\"action\":\"quiz_started\", \"attemptId\":" + quizDisplay.getAttemptId() + ", \"quizId\":" + startQuizDTO.getQuizId() + ", \"userId\":" + startQuizDTO.getUserId() + "}";
        // jadeService.enviarMensagem("tutor", messageContent);
        return ResponseEntity.status(HttpStatus.CREATED).body(quizDisplay);
    }

    /**
     * Submete uma resposta para uma questão de uma tentativa em andamento.
     * Corresponde ao PATCH /attempts/{id} do diagrama.
     * O {id} no diagrama corresponde ao attemptId aqui.
     */
    @PatchMapping("/{attemptId}/answer")
    public ResponseEntity<Void> submitAnswer(@PathVariable Long attemptId,
                                             @Valid @RequestBody StudentAnswerDTO studentAnswerDTO) {
        quizAttemptService.submitAnswer(attemptId, studentAnswerDTO);
        // Na Fase 4, após submeter a resposta, podemos notificar o EvaluatorAgent:
        // String messageContent = "{\"action\":\"answer_submitted\", \"attemptId\":" + attemptId + ", \"questionId\":" + studentAnswerDTO.getQuestionId() + ", \"selectedAlternativeId\":" + studentAnswerDTO.getSelectedAlternativeId() + "}";
        // jadeService.enviarMensagem("evaluator", messageContent);
        return ResponseEntity.accepted().build(); // 202 Accepted
    }

    /**
     * Finaliza uma tentativa de quiz.
     * Corresponde ao POST /attempts/{id}/completed do diagrama.
     */
    @PostMapping("/{attemptId}/complete")
    public ResponseEntity<AttemptResultDTO> completeQuiz(@PathVariable Long attemptId) {
        AttemptResultDTO result = quizAttemptService.completeQuizAttempt(attemptId);
        // Na Fase 4, após finalizar a tentativa, podemos notificar o EvaluatorAgent para avaliação final:
        // String messageContent = "{\"action\":\"attempt_completed\", \"attemptId\":" + attemptId + "}";
        // jadeService.enviarMensagem("evaluator", messageContent);
        return ResponseEntity.ok(result);
    }

    /**
     * Obtém o resultado/detalhes de uma tentativa de quiz.
     * Corresponde ao GET /attempts/{id} do diagrama.
     */
    @GetMapping("/{attemptId}/result")
    public ResponseEntity<AttemptResultDTO> getQuizAttemptResult(@PathVariable Long attemptId) {
        AttemptResultDTO result = quizAttemptService.getAttemptResult(attemptId);
        return ResponseEntity.ok(result);
    }
}