// Arquivo: src/main/java/com/example/jadeapi/LearningPath.java
package com.example.jadeapi; // Pacote principal

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class LearningPath { // "Trilha de Aprendizado"

    // 1. Lista para guardar os IDs dos quizzes que compõem esta trilha
    private List<Long> quizSequence; // "quizSequence" = Sequência de Quizzes

    // 2. Variável para guardar a pontuação de "qualidade" desta trilha
    private double fitness = 0.0;    // "fitness" = Aptidão

    /**
     * Construtor: Cria uma nova trilha de aprendizado com um tamanho
     * específico. Por exemplo, se pathLength for 3, esta trilha terá espaço
     * para 3 IDs de quizzes.
     */
    public LearningPath(int pathLength) {
        // Inicializa a lista de quizzes.
        // Collections.nCopies cria uma lista com 'pathLength' elementos, todos 'null' inicialmente.
        this.quizSequence = new ArrayList<>(Collections.nCopies(pathLength, null));
    }

    /**
     * Construtor (alternativo): Cria uma trilha a partir de uma lista de
     * quizzes já existente. Útil para fazer cópias de trilhas.
     */
    public LearningPath(List<Long> initialSequence) {
        this.quizSequence = new ArrayList<>(initialSequence);
    }

    // --- Métodos para interagir com a trilha ---
    public List<Long> getQuizSequence() {
        return quizSequence;
    }

    public void setQuizSequence(List<Long> quizSequence) {
        this.quizSequence = quizSequence;
    }

    public double getFitness() {
        return fitness;
    }

    public void setFitness(double fitness) {
        this.fitness = fitness;
    }

    /**
     * Define um quiz específico em uma posição (índice) da trilha.
     */
    public void setQuiz(int index, Long quizId) {
        if (index >= 0 && index < this.quizSequence.size()) {
            this.quizSequence.set(index, quizId);
        }
    }

    /**
     * Obtém o ID do quiz de uma posição (índice) específica da trilha.
     */
    public Long getQuiz(int index) {
        if (index >= 0 && index < this.quizSequence.size()) {
            return this.quizSequence.get(index);
        }
        return null;
    }

    /**
     * Retorna o número de quizzes que esta trilha pode conter (seu tamanho).
     */
    public int getLength() { // Renomeado de getTamanho para getLength
        return this.quizSequence.size();
    }

    @Override
    public String toString() {
        // Método para facilitar a visualização da trilha (para debug, por exemplo)
        return "Path: " + (quizSequence != null ? quizSequence.toString() : "[]")
                + " | Fitness: " + String.format("%.2f", fitness);
    }
}
