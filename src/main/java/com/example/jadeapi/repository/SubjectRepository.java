package com.example.jadeapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.jadeapi.model.Subject;

@Repository // Opcional, mas boa prática para clareza
public interface SubjectRepository extends JpaRepository<Subject, Long> {
    // Você pode adicionar métodos de consulta personalizados aqui se necessário
    // Ex: Subject findByName(String name);
}
