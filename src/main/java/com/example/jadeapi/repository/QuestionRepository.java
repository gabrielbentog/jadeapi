package com.example.jadeapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.jadeapi.model.Question;
// import java.util.List; // Exemplo de importação se for adicionar método customizado

@Repository // Opcional, mas boa prática
public interface QuestionRepository extends JpaRepository<Question, Long> {
    // Métodos de consulta personalizados podem ser adicionados aqui.
    // Por exemplo, para encontrar questões por dificuldade:
    // List<Question> findByDifficulty(int difficulty);

    // Ou para encontrar questões que pertencem a um determinado quiz (mais complexo devido ao ManyToMany):
    // Isso geralmente seria feito consultando o Quiz e pegando suas questões,
    // mas se precisar de uma consulta direta, poderia ser algo como:
    // @Query("SELECT q FROM Question q JOIN q.quizzes quiz WHERE quiz.id = :quizId")
    // List<Question> findQuestionsByQuizId(@Param("quizId") Long quizId);
}
