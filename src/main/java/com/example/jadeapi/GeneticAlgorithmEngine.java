// Arquivo: src/main/java/com/example/jadeapi/GeneticAlgorithmEngine.java
package com.example.jadeapi;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.json.JSONArray;
import org.json.JSONObject; // Para ordenar por fitness (elitismo)

public class GeneticAlgorithmEngine {

    private int populationSize;
    private int pathLength;
    private List<JSONObject> availableQuizzesInfo;
    private Random randomGenerator = new Random();
    private double mutationRate;
    private int tournamentSize;
    private int numberOfGenerations; // Novo: Quantas gerações o AG vai rodar
    private int elitismCount;      // Novo: Quantos melhores indivíduos passam diretamente

    /**
     * Construtor do Motor do Algoritmo Genético.
     */
    public GeneticAlgorithmEngine(int populationSize, int pathLength, JSONArray allQuizzesJSONArray,
            double mutationRate, int tournamentSize, int numberOfGenerations, int elitismCount) {
        this.populationSize = populationSize;
        this.pathLength = pathLength;
        this.availableQuizzesInfo = convertJSONArrayToList(allQuizzesJSONArray);
        this.mutationRate = mutationRate;
        this.tournamentSize = tournamentSize;
        this.numberOfGenerations = numberOfGenerations;
        this.elitismCount = elitismCount;

        if (this.availableQuizzesInfo.isEmpty()) {
            System.err.println("GeneticAlgorithmEngine: AVISO - Lista de quizzes disponíveis está vazia.");
        }
        // Garante que elitismCount não seja maior que o tamanho da população
        if (this.elitismCount >= this.populationSize) {
            System.err.println("GeneticAlgorithmEngine: AVISO - Elitism count é maior ou igual ao tamanho da população. Ajustando para populationSize / 10 ou 0.");
            this.elitismCount = Math.max(0, this.populationSize / 10);
        }
    }

    // ... (métodos: convertJSONArrayToList, initializePopulation, calculateFitness, getQuizInfoByIdFromAvailableList,
    //             selectParentByTournament, crossover, mutate - dos passos anteriores) ...
    private List<JSONObject> convertJSONArrayToList(JSONArray jsonArray) {
        List<JSONObject> list = new ArrayList<>();
        if (jsonArray != null) {
            for (int i = 0; i < jsonArray.length(); i++) {
                list.add(jsonArray.getJSONObject(i));
            }
        }
        return list;
    }

    public List<LearningPath> initializePopulation() {
        List<LearningPath> population = new ArrayList<>(this.populationSize);
        if (this.availableQuizzesInfo.isEmpty()) {
            System.err.println("GeneticAlgorithmEngine: Nenhum quiz disponível para inicializar a população.");
            for (int i = 0; i < this.populationSize; i++) {
                population.add(new LearningPath(this.pathLength));
            }
            return population;
        }
        for (int i = 0; i < this.populationSize; i++) {
            LearningPath newPath = new LearningPath(this.pathLength);
            List<JSONObject> shuffledQuizzes = new ArrayList<>(this.availableQuizzesInfo);
            Collections.shuffle(shuffledQuizzes, this.randomGenerator);
            for (int j = 0; j < this.pathLength; j++) {
                if (j < shuffledQuizzes.size()) {
                    Long quizId = shuffledQuizzes.get(j).getLong("id");
                    newPath.setQuiz(j, quizId);
                } else {
                    System.out.println("GeneticAlgorithmEngine: Aviso - Não há quizzes únicos suficientes para preencher toda a trilha " + i);
                    break;
                }
            }
            population.add(newPath);
        }
        return population;
    }

    public void calculateFitness(LearningPath learningPath, UserProfileForGA userProfile) {
        double currentFitnessScore = 0.0;
        List<Long> quizSequenceInPath = learningPath.getQuizSequence();

        if (quizSequenceInPath == null || quizSequenceInPath.isEmpty()) {
            learningPath.setFitness(0);
            return;
        }

        Set<Long> quizzesAlreadyInThisPath = new HashSet<>();
        double lastUserScore = userProfile.getLastQuizScore();
        int lastUserQuizDifficulty = userProfile.getDifficultyOfLastQuiz();
        Long lastUserQuizSubjectId = userProfile.getSubjectIdOfLastQuiz();
        Set<Long> userRecentlyCompleted = userProfile.getRecentlyCompletedQuizIds();
        int previousQuizDifficultyInPathLogic = lastUserQuizDifficulty;

        for (int i = 0; i < quizSequenceInPath.size(); i++) {
            Long currentQuizIdInPath = quizSequenceInPath.get(i);
            if (currentQuizIdInPath == null) {
                currentFitnessScore -= 50;
                continue;
            }
            JSONObject currentQuizJSONInfo = getQuizInfoByIdFromAvailableList(currentQuizIdInPath);
            if (currentQuizJSONInfo == null) {
                currentFitnessScore -= 50;
                continue;
            }
            int currentQuizDifficulty = currentQuizJSONInfo.optInt("difficulty", 3);
            Long currentQuizSubjectId = currentQuizJSONInfo.optLong("subjectId", -1L);

            if (quizzesAlreadyInThisPath.contains(currentQuizIdInPath)) {
                currentFitnessScore -= 25;
            } else {
                quizzesAlreadyInThisPath.add(currentQuizIdInPath);
            }
            if (userRecentlyCompleted.contains(currentQuizIdInPath)) {
                currentFitnessScore -= 20;
            } else {
                currentFitnessScore += 10;
            }
            int difficultyDifference = currentQuizDifficulty - previousQuizDifficultyInPathLogic;
            if (lastUserScore >= 70.0) {
                if (difficultyDifference == 1) {
                    currentFitnessScore += 15;
                } else if (difficultyDifference > 1) {
                    currentFitnessScore += 7;
                } else if (difficultyDifference == 0) {
                    currentFitnessScore += 5;
                } else {
                    currentFitnessScore -= 10;
                }
            } else {
                if (difficultyDifference == 0) {
                    currentFitnessScore += 15;
                } else if (difficultyDifference == -1) {
                    currentFitnessScore += 10;
                } else if (difficultyDifference < -1) {
                    currentFitnessScore += 5;
                } else {
                    currentFitnessScore -= 15;
                }
            }
            if (lastUserQuizSubjectId != null && lastUserQuizSubjectId.equals(currentQuizSubjectId)) {
                currentFitnessScore += 12;
            } else if (lastUserQuizSubjectId != null && !lastUserQuizSubjectId.equals(currentQuizSubjectId)) {
                currentFitnessScore += 6;
            } else {
                currentFitnessScore += 3;
            }
            previousQuizDifficultyInPathLogic = currentQuizDifficulty;
        }
        learningPath.setFitness(currentFitnessScore);
    }

    private JSONObject getQuizInfoByIdFromAvailableList(Long quizIdToFind) {
        if (quizIdToFind == null || this.availableQuizzesInfo == null) {
            return null;
        }
        for (JSONObject quizInfo : this.availableQuizzesInfo) {
            if (quizInfo.getLong("id") == quizIdToFind) {
                return quizInfo;
            }
        }
        return null;
    }

    private LearningPath selectParentByTournament(List<LearningPath> population) {
        LearningPath bestInTournament = null;
        int currentTournamentSize = Math.min(this.tournamentSize, population.size());

        if (currentTournamentSize <= 0) {
            if (!population.isEmpty()) {
                return population.get(0);
            }
            // Criar um LearningPath 'vazio' como fallback se a população estiver vazia e currentTournamentSize for 0
            LearningPath fallbackPath = new LearningPath(this.pathLength);
            fallbackPath.setFitness(Double.NEGATIVE_INFINITY); // Fitness muito baixo
            return fallbackPath;
        }

        for (int i = 0; i < currentTournamentSize; i++) {
            int randomIndex = this.randomGenerator.nextInt(population.size());
            LearningPath currentCompetitor = population.get(randomIndex);
            if (bestInTournament == null || currentCompetitor.getFitness() > bestInTournament.getFitness()) {
                bestInTournament = currentCompetitor;
            }
        }
        // Se bestInTournament ainda for null (só aconteceria se a população estivesse vazia e o fallback acima não funcionasse)
        if (bestInTournament == null && !population.isEmpty()) {
            bestInTournament = population.get(0); // Pega o primeiro como última instância
        } else if (bestInTournament == null && population.isEmpty()) {
            LearningPath fallbackPath = new LearningPath(this.pathLength);
            fallbackPath.setFitness(Double.NEGATIVE_INFINITY);
            return fallbackPath;
        }

        return bestInTournament;
    }

    public LearningPath crossover(LearningPath parent1, LearningPath parent2) {
        LearningPath child = new LearningPath(this.pathLength);
        List<Long> parent1Sequence = parent1.getQuizSequence();
        List<Long> parent2Sequence = parent2.getQuizSequence();

        int crossoverPoint = 1;
        if (this.pathLength > 1) {
            crossoverPoint = 1 + this.randomGenerator.nextInt(this.pathLength - 1);
        }

        Set<Long> childGenesSoFar = new HashSet<>();
        for (int i = 0; i < crossoverPoint; i++) {
            if (parent1Sequence.get(i) != null) {
                child.setQuiz(i, parent1Sequence.get(i));
                childGenesSoFar.add(parent1Sequence.get(i));
            }
        }
        int childIndex = crossoverPoint;
        for (int i = crossoverPoint; i < this.pathLength; i++) {
            if (childIndex >= this.pathLength) {
                break;
            }
            Long geneFromParent2 = parent2Sequence.get(i);
            if (geneFromParent2 != null) {
                if (!childGenesSoFar.contains(geneFromParent2)) {
                    child.setQuiz(childIndex, geneFromParent2);
                    childGenesSoFar.add(geneFromParent2);
                    childIndex++;
                }
            }
        }
        if (childIndex < this.pathLength && !this.availableQuizzesInfo.isEmpty()) {
            List<JSONObject> quizzesForRepair = new ArrayList<>(this.availableQuizzesInfo);
            Collections.shuffle(quizzesForRepair, this.randomGenerator);
            for (JSONObject quizInfo : quizzesForRepair) {
                if (childIndex >= this.pathLength) {
                    break;
                }
                Long potentialQuizId = quizInfo.getLong("id");
                if (!childGenesSoFar.contains(potentialQuizId)) {
                    if (child.getQuiz(childIndex) == null) {
                        child.setQuiz(childIndex, potentialQuizId);
                        childGenesSoFar.add(potentialQuizId);
                        childIndex++;
                    }
                }
            }
        }
        return child;
    }

    public void mutate(LearningPath individual) {
        if (this.availableQuizzesInfo.isEmpty()) {
            return;
        }
        for (int i = 0; i < individual.getLength(); i++) {
            if (this.randomGenerator.nextDouble() < this.mutationRate) {
                int randomIndex = this.randomGenerator.nextInt(this.availableQuizzesInfo.size());
                Long newQuizId = this.availableQuizzesInfo.get(randomIndex).getLong("id");
                individual.setQuiz(i, newQuizId);
            }
        }
    }

    // --- NOVO MÉTODO PARA O PASSO 5 ---
    /**
     * Executa o loop principal do algoritmo genético.
     *
     * @param userProfile O perfil do usuário para o qual as recomendações estão
     * sendo geradas.
     * @return O melhor LearningPath encontrado após todas as gerações.
     */
    public LearningPath runEvolution(UserProfileForGA userProfile) {
        // 1. Inicializa a população
        List<LearningPath> currentPopulation = initializePopulation();

        if (currentPopulation.isEmpty()) {
            System.err.println("GeneticAlgorithmEngine: População inicial vazia. Não é possível evoluir.");
            return new LearningPath(this.pathLength); // Retorna uma trilha vazia/default
        }

        // 2. Loop de Gerações
        for (int generation = 0; generation < this.numberOfGenerations; generation++) {
            // a. Avalia cada indivíduo na população atual
            for (LearningPath individual : currentPopulation) {
                calculateFitness(individual, userProfile);
            }

            // b. Cria a próxima geração
            List<LearningPath> nextGeneration = new ArrayList<>(this.populationSize);

            // c. Elitismo: Adiciona os melhores da geração atual à próxima
            // Ordena a população atual por fitness (decrescente)
            currentPopulation.sort(Comparator.comparingDouble(LearningPath::getFitness).reversed());

            for (int i = 0; i < this.elitismCount && i < currentPopulation.size(); i++) {
                // Adiciona uma cópia do indivíduo de elite para evitar problemas de referência
                // se o mesmo objeto for modificado posteriormente.
                nextGeneration.add(new LearningPath(currentPopulation.get(i).getQuizSequence()));
            }

            // d. Preenche o restante da nova geração com filhos
            while (nextGeneration.size() < this.populationSize) {
                LearningPath parent1 = selectParentByTournament(currentPopulation);
                LearningPath parent2 = selectParentByTournament(currentPopulation);

                // Garante que temos pais válidos (não null e com fitness não infinitamente negativo)
                // Isso é um fallback para casos extremos de populações muito pequenas ou problemáticas.
                if (parent1.getFitness() == Double.NEGATIVE_INFINITY || parent2.getFitness() == Double.NEGATIVE_INFINITY) {
                    // Se não conseguir selecionar pais adequados, pode adicionar um indivíduo aleatório
                    // ou simplesmente pular esta iteração. Adicionar um aleatório pode ajudar a sair de um "beco".
                    LearningPath randomPath = new LearningPath(this.pathLength);
                    // Preenche randomPath com quizzes aleatórios (simplificado aqui, idealmente chamaria uma sub-rotina de initializePopulation para um indivíduo)
                    if (!this.availableQuizzesInfo.isEmpty()) {
                        List<JSONObject> shuffled = new ArrayList<>(this.availableQuizzesInfo);
                        Collections.shuffle(shuffled, this.randomGenerator);
                        for (int k = 0; k < this.pathLength && k < shuffled.size(); k++) {
                            randomPath.setQuiz(k, shuffled.get(k).getLong("id"));
                        }
                    }
                    calculateFitness(randomPath, userProfile); // Calcula fitness do aleatório
                    nextGeneration.add(randomPath);
                    if (nextGeneration.size() >= this.populationSize) {
                        break; // Verifica o tamanho novamente

                    }
                    continue; // Pula para a próxima iteração do while
                }

                LearningPath child = crossover(parent1, parent2);
                mutate(child);
                nextGeneration.add(child);
            }
            // e. Substitui a população atual pela nova geração
            currentPopulation = nextGeneration;

            // (Opcional) Log da melhor aptidão da geração atual
            // calculateFitness para todos na nova 'currentPopulation' antes de pegar o melhor,
            // pois crossover/mutate não calculam fitness. Elite já tem.
            LearningPath bestThisGeneration = null;
            for (LearningPath individual : currentPopulation) {
                calculateFitness(individual, userProfile); // Recalcula/garante fitness dos novos filhos
                if (bestThisGeneration == null || individual.getFitness() > bestThisGeneration.getFitness()) {
                    bestThisGeneration = individual;
                }
            }
            if (bestThisGeneration != null) {
                System.out.println("Geração " + (generation + 1) + ": Melhor Fitness = " + String.format("%.2f", bestThisGeneration.getFitness()) + " | Trilha: " + bestThisGeneration.getQuizSequence());
            } else {
                System.out.println("Geração " + (generation + 1) + ": Não foi possível determinar o melhor indivíduo.");
            }
        }

        // 3. Retorna o melhor indivíduo da última geração
        // Certifique-se de que a aptidão da população final está calculada
        LearningPath bestOverall = null;
        for (LearningPath individual : currentPopulation) {
            calculateFitness(individual, userProfile); // Garante que todos estão avaliados
            if (bestOverall == null || individual.getFitness() > bestOverall.getFitness()) {
                bestOverall = individual;
            }
        }

        if (bestOverall == null && !currentPopulation.isEmpty()) { // Fallback se todos tiverem fitness muito ruim
            bestOverall = currentPopulation.get(0); // Retorna o primeiro como último recurso
        } else if (bestOverall == null && currentPopulation.isEmpty()) {
            System.err.println("GeneticAlgorithmEngine: População final vazia, retornando trilha vazia.");
            bestOverall = new LearningPath(this.pathLength); // Retorna uma trilha vazia
        }

        System.out.println("Evolução concluída. Melhor trilha final: " + bestOverall);
        return bestOverall;
    }
}
