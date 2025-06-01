package com.example.jadeapi.service;

import com.example.jadeapi.dto.QuizInfoDTO;
import com.example.jadeapi.model.Quiz;
import com.example.jadeapi.model.Subject; // Importar Subject
import com.example.jadeapi.repository.QuizRepository;
import jakarta.persistence.EntityNotFoundException; // Para o getQuizById exemplo
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

    @Transactional(readOnly = true)
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
        Long subjectId = null;
        String subjectName = null;
        if (quiz.getSubject() != null) {
            subjectId = quiz.getSubject().getId();
            subjectName = quiz.getSubject().getName();
        }
        return new QuizInfoDTO(
                quiz.getId(),
                quiz.getName(),
                quiz.getDescription(),
                quiz.getDifficulty(),
                subjectId,      // Passando subjectId
                subjectName     // Passando subjectName
        );
    }

    @Transactional(readOnly = true)
    public QuizInfoDTO getQuizInfoById(Long id) { // Renomeado para evitar conflito se houver getQuizById que retorna Entidade
        Quiz quiz = quizRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Quiz não encontrado com ID: " + id));
        return convertToQuizInfoDTO(quiz);
    }
    
    // Se você precisar da entidade Quiz completa em algum outro lugar:
    @Transactional(readOnly = true)
    public Quiz getQuizEntityById(Long id) {
        return quizRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Quiz (Entidade) não encontrado com ID: " + id));
    }
}