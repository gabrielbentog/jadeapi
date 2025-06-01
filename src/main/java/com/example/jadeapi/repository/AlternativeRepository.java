package com.example.jadeapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.jadeapi.model.Alternative;
// import java.util.List; // Exemplo de importação se for adicionar método customizado

@Repository // Opcional, mas boa prática
public interface AlternativeRepository extends JpaRepository<Alternative, Long> {
    // Métodos de consulta personalizados podem ser adicionados aqui.
    // Por exemplo, para encontrar todas as alternativas de uma determinada questão:
    // List<Alternative> findByQuestionId(Long questionId);
}
