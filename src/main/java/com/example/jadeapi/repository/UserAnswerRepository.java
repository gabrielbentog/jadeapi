package com.example.jadeapi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository; // Import QuizAttempt
import org.springframework.stereotype.Repository;    // Import Question

import com.example.jadeapi.model.Question;
import com.example.jadeapi.model.QuizAttempt;
import com.example.jadeapi.model.UserAnswer; // Import List

@Repository // Opcional, mas boa prática
public interface UserAnswerRepository extends JpaRepository<UserAnswer, Long> {
    // Métodos de consulta personalizados podem ser adicionados aqui.
    // Por exemplo:

    // Encontrar todas as respostas de uma tentativa de quiz específica
    List<UserAnswer> findByQuizAttempt(QuizAttempt quizAttempt);

    // Encontrar todas as respostas para uma questão específica em todas as tentativas
    // (Pode ser útil para análises, mas use com cuidado se houver muitos dados)
    List<UserAnswer> findByQuestion(Question question);

    // Encontrar a resposta de um usuário para uma questão específica em uma tentativa específica
    // (Isso assume que um usuário só pode responder a uma questão uma vez por tentativa)
    UserAnswer findByQuizAttemptAndQuestion(QuizAttempt quizAttempt, Question question);
}
