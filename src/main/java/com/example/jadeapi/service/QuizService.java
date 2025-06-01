package com.example.jadeapi.service;

import com.example.jadeapi.dto.QuizInfoDTO;
import com.example.jadeapi.model.Quiz;
import com.example.jadeapi.repository.QuizRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class QuizService {

    private final QuizRepository quizRepository;

    @Autowired
    public QuizService(QuizRepository quizRepository) {
        this.quizRepository = quizRepository;
    }

    @Transactional(readOnly = true) // Boa prática para métodos de leitura
    public List<QuizInfoDTO> getAllQuizzes() {
        return quizRepository.findAll().stream()
                .map(this::convertToQuizInfoDTO)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public Page<QuizInfoDTO> getAllQuizzesPaginated(Pageable pageable) {
        return quizRepository.findAll(pageable)
                .map(this::convertToQuizInfoDTO);
    }

    private QuizInfoDTO convertToQuizInfoDTO(Quiz quiz) {
        return new QuizInfoDTO(
                quiz.getId(),
                quiz.getName(),
                quiz.getDescription(),
                quiz.getDifficulty()
                // Se você adicionou subjectName ao QuizInfoDTO, mapeie-o aqui:
                // quiz.getSubject() != null ? quiz.getSubject().getName() : null
        );
    }

    // Você pode adicionar outros métodos aqui, como criar, atualizar, deletar quizzes,
    // buscar por ID, etc., conforme a necessidade do seu sistema.
    // Exemplo:
    // @Transactional(readOnly = true)
    // public QuizInfoDTO getQuizById(Long id) {
    //     Quiz quiz = quizRepository.findById(id)
    //             .orElseThrow(() -> new EntityNotFoundException("Quiz não encontrado com ID: " + id));
    //     return convertToQuizInfoDTO(quiz);
    // }
}