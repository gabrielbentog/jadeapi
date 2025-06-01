package com.example.jadeapi.controller;

import com.example.jadeapi.dto.QuizInfoDTO; // Importar o DTO
import com.example.jadeapi.service.QuizService; // Importar o novo serviço
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable; // Importar Pageable
import org.springframework.http.ResponseEntity; // Para retornar listas não paginadas
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List; // Para retornar List<QuizInfoDTO>

@RestController
@RequestMapping("/api/quizzes")
public class QuizController {

    private final QuizService quizService; // Usar o novo QuizService
    // Remover a injeção direta do QuizRepository se não for mais usada para outros fins.
    // @Autowired
    // private QuizRepository quizRepository; // REMOVIDO OU COMENTADO

    @Autowired
    public QuizController(QuizService quizService) { // Injetar QuizService
        this.quizService = quizService;
    }

    // Endpoint para buscar todos os quizzes (não paginado)
    @GetMapping("/all") // Novo endpoint para diferenciar do paginado
    public ResponseEntity<List<QuizInfoDTO>> getAllQuizzesList() {
        List<QuizInfoDTO> quizzes = quizService.getAllQuizzes();
        return ResponseEntity.ok(quizzes);
    }

    // Endpoint existente, agora retorna Page<QuizInfoDTO>
    @GetMapping
    public Page<QuizInfoDTO> getQuizzesPaginated(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size
    ) {
        Pageable pageable = PageRequest.of(page, size);
        return quizService.getAllQuizzesPaginated(pageable);
    }

    // Você pode adicionar mais endpoints aqui, como GET /api/quizzes/{id}
    // Exemplo:
    // @GetMapping("/{id}")
    // public ResponseEntity<QuizInfoDTO> getQuizById(@PathVariable Long id) {
    //     QuizInfoDTO quiz = quizService.getQuizById(id);
    //     return ResponseEntity.ok(quiz);
    // }
}