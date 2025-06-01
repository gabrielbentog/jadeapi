package com.example.jadeapi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository; // Import User
import org.springframework.stereotype.Repository;  // Import Quiz

import com.example.jadeapi.model.Quiz;
import com.example.jadeapi.model.QuizAttempt;
import com.example.jadeapi.model.User; // Import List
import com.example.jadeapi.model.enums.AttemptStatus; 
@Repository // Opcional, mas boa prática
public interface QuizAttemptRepository extends JpaRepository<QuizAttempt, Long> {
    // Métodos de consulta personalizados podem ser adicionados aqui.
    // Por exemplo:

    // Encontrar todas as tentativas de um usuário específico
    List<QuizAttempt> findByUser(User user);

    // Encontrar todas as tentativas para um quiz específico
    List<QuizAttempt> findByQuiz(Quiz quiz);

    // Encontrar todas as tentativas de um usuário para um quiz específico
    List<QuizAttempt> findByUserAndQuiz(User user, Quiz quiz);

    // Encontrar todas as tentativas com um status específico
    List<QuizAttempt> findByStatus(AttemptStatus status);

    // Encontrar todas as tentativas de um usuário com um status específico
    List<QuizAttempt> findByUserAndStatus(User user, AttemptStatus status);
}
