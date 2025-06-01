package com.example.jadeapi.service;

import com.example.jadeapi.dto.AlternativeDTO;
import com.example.jadeapi.dto.QuestionDTO;
import com.example.jadeapi.dto.QuizDisplayDTO;
import com.example.jadeapi.dto.StartQuizDTO;
import com.example.jadeapi.dto.StudentAnswerDTO;
import com.example.jadeapi.dto.AttemptResultDTO;
import com.example.jadeapi.dto.AnswerFeedbackDTO;
import com.example.jadeapi.model.*; // Importa todas as entidades do model
import com.example.jadeapi.repository.*; // Importa todos os repositórios
import com.example.jadeapi.model.enums.AttemptStatus; 
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import com.example.jadeapi.JadeService;
import java.util.Locale;

@Service
public class QuizAttemptService {

    private final QuizAttemptRepository quizAttemptRepository;
    private final UserRepository userRepository;
    private final QuizRepository quizRepository;
    private final UserAnswerRepository userAnswerRepository;
    private final QuestionRepository questionRepository;
    private final AlternativeRepository alternativeRepository;
    private final JadeService jadeService;

   @Autowired
    public QuizAttemptService(QuizAttemptRepository quizAttemptRepository,
                              UserRepository userRepository,
                              QuizRepository quizRepository,
                              UserAnswerRepository userAnswerRepository,
                              QuestionRepository questionRepository,
                              AlternativeRepository alternativeRepository,
                              JadeService jadeService) {
        this.quizAttemptRepository = quizAttemptRepository;
        this.userRepository = userRepository;
        this.quizRepository = quizRepository;
        this.userAnswerRepository = userAnswerRepository;
        this.questionRepository = questionRepository;
        this.alternativeRepository = alternativeRepository;
        this.jadeService = jadeService;
    }

    @Transactional
    public QuizDisplayDTO startQuizAttempt(StartQuizDTO startQuizDTO) {
        User user = userRepository.findById(startQuizDTO.getUserId())
                .orElseThrow(() -> new EntityNotFoundException("Usuário não encontrado com ID: " + startQuizDTO.getUserId()));
        Quiz quiz = quizRepository.findById(startQuizDTO.getQuizId())
                .orElseThrow(() -> new EntityNotFoundException("Quiz não encontrado com ID: " + startQuizDTO.getQuizId()));

        QuizAttempt quizAttempt = new QuizAttempt(user, quiz);
        quizAttempt = quizAttemptRepository.save(quizAttempt);

        // Notificar o TutorAgent sobre o início do quiz
        String startQuizMessage = String.format(
            "{\"action\":\"quiz_started\", \"attemptId\":%d, \"quizId\":%d, \"userId\":%d, \"quizName\":\"%s\"}",
            quizAttempt.getId(),
            quiz.getId(),
            user.getId(),
            quiz.getName()
        );
        jadeService.enviarMensagem("tutor", startQuizMessage);
        System.out.println("Mensagem enviada ao tutor: " + startQuizMessage);

        List<QuestionDTO> questionDTOs = quiz.getQuestions().stream()
                .map(this::convertToQuestionDTO)
                .collect(Collectors.toList());

        return new QuizDisplayDTO(quizAttempt.getId(), quiz.getName(), questionDTOs);
    }

    private QuestionDTO convertToQuestionDTO(Question question) {
        List<AlternativeDTO> alternativeDTOs = question.getAlternatives().stream()
                .map(alt -> new AlternativeDTO(alt.getId(), alt.getBody(), alt.getPosition()))
                .collect(Collectors.toList());
        return new QuestionDTO(question.getId(), question.getBody(), question.getDifficulty(), alternativeDTOs);
    }

    @Transactional
    public void submitAnswer(Long attemptId, StudentAnswerDTO studentAnswerDTO) {
        QuizAttempt quizAttempt = quizAttemptRepository.findById(attemptId)
                .orElseThrow(() -> new EntityNotFoundException("Tentativa de Quiz não encontrada com ID: " + attemptId));

        if (quizAttempt.getStatus() != AttemptStatus.IN_PROGRESS) {
            throw new IllegalStateException("Esta tentativa de quiz não está mais em progresso.");
        }

        Question question = questionRepository.findById(studentAnswerDTO.getQuestionId())
                .orElseThrow(() -> new EntityNotFoundException("Questão não encontrada com ID: " + studentAnswerDTO.getQuestionId()));
        Alternative selectedAlternative = alternativeRepository.findById(studentAnswerDTO.getSelectedAlternativeId())
                .orElseThrow(() -> new EntityNotFoundException("Alternativa não encontrada com ID: " + studentAnswerDTO.getSelectedAlternativeId()));

        // Verifica se a alternativa pertence à questão
        if (!selectedAlternative.getQuestion().getId().equals(question.getId())) {
            throw new IllegalArgumentException("A alternativa selecionada não pertence à questão informada.");
        }

        // Verifica se já existe uma resposta para esta questão nesta tentativa
        UserAnswer existingAnswer = userAnswerRepository.findByQuizAttemptAndQuestion(quizAttempt, question);
        if (existingAnswer != null) {
            // Atualiza a resposta existente
            existingAnswer.setSelectedAlternative(selectedAlternative);
            existingAnswer.setAnsweredAt(LocalDateTime.now());
            userAnswerRepository.save(existingAnswer);

            UserAnswer userAnswer = new UserAnswer(question, selectedAlternative, quizAttempt);
            userAnswerRepository.save(userAnswer);
        } else {
            // Cria uma nova resposta
            UserAnswer userAnswer = new UserAnswer(question, selectedAlternative, quizAttempt);
            userAnswerRepository.save(userAnswer);
        }

        String submitAnswerMessage = String.format(
            "{\"action\":\"answer_submitted\", \"attemptId\":%d, \"questionId\":%d, \"selectedAlternativeId\":%d}",
            attemptId,
            studentAnswerDTO.getQuestionId(),
            studentAnswerDTO.getSelectedAlternativeId()
        );
        jadeService.enviarMensagem("evaluator", submitAnswerMessage);
        System.out.println("Mensagem enviada ao evaluator: " + submitAnswerMessage); // Log para debug
    }

    @Transactional
    public AttemptResultDTO completeQuizAttempt(Long attemptId) {
        QuizAttempt quizAttempt = quizAttemptRepository.findById(attemptId)
                .orElseThrow(() -> new EntityNotFoundException("Tentativa de Quiz não encontrada com ID: " + attemptId));

        if (quizAttempt.getStatus() != AttemptStatus.IN_PROGRESS) {
            throw new IllegalStateException("Esta tentativa de quiz não pode ser finalizada pois não está em progresso.");
        }

        quizAttempt.setEndTime(LocalDateTime.now());
        quizAttempt.setStatus(AttemptStatus.COMPLETED);

        // Calcular Score
        List<UserAnswer> userAnswers = userAnswerRepository.findByQuizAttempt(quizAttempt);
        double correctAnswers = 0;
        for (UserAnswer userAnswer : userAnswers) {
            if (userAnswer.getSelectedAlternative().isCorrect()) {
                correctAnswers++;
            }
        }

        int totalQuestionsInQuiz = quizAttempt.getQuiz().getQuestions().size();
        if (totalQuestionsInQuiz > 0) {
            quizAttempt.setScore((correctAnswers / totalQuestionsInQuiz) * 100.0);
        } else {
            quizAttempt.setScore(0.0);
        }

        quizAttemptRepository.save(quizAttempt);
        // Notificar o EvaluatorAgent sobre a finalização da tentativa
        String completeAttemptMessage = String.format(Locale.US, // Adiciona Locale.US aqui
            "{\"action\":\"attempt_completed\", \"attemptId\":%d, \"userId\":%d, \"quizId\":%d, \"finalScore\":%.2f}",
            quizAttempt.getId(),
            quizAttempt.getUser().getId(),
            quizAttempt.getQuiz().getId(),
            quizAttempt.getScore()
        );
        jadeService.enviarMensagem("evaluator", completeAttemptMessage);
        System.out.println("Mensagem enviada ao evaluator: " + completeAttemptMessage); // Log para debug
        return getAttemptResult(attemptId); // Retorna o resultado detalhado
    }

    public AttemptResultDTO getAttemptResult(Long attemptId) {
        QuizAttempt quizAttempt = quizAttemptRepository.findById(attemptId)
                .orElseThrow(() -> new EntityNotFoundException("Tentativa de Quiz não encontrada com ID: " + attemptId));

        List<UserAnswer> userAnswers = userAnswerRepository.findByQuizAttempt(quizAttempt);
        List<AnswerFeedbackDTO> answerFeedbacks = new ArrayList<>();

        for (Question question : quizAttempt.getQuiz().getQuestions()) {
            UserAnswer userAnswer = userAnswers.stream()
                    .filter(ua -> ua.getQuestion().getId().equals(question.getId()))
                    .findFirst()
                    .orElse(null); // Encontra a resposta do usuário para esta questão

            Alternative correctAlternative = question.getAlternatives().stream()
                    .filter(Alternative::isCorrect)
                    .findFirst()
                    .orElseThrow(() -> new EntityNotFoundException("Alternativa correta não encontrada para a questão ID: " + question.getId()));

            if (userAnswer != null) {
                answerFeedbacks.add(new AnswerFeedbackDTO(
                        question.getId(),
                        question.getBody(),
                        userAnswer.getSelectedAlternative().getId(),
                        userAnswer.getSelectedAlternative().getBody(),
                        userAnswer.getSelectedAlternative().isCorrect(),
                        correctAlternative.getId(),
                        correctAlternative.getBody(),
                        correctAlternative.getJustification()
                ));
            } else {
                // Caso a questão não tenha sido respondida
                answerFeedbacks.add(new AnswerFeedbackDTO(
                        question.getId(),
                        question.getBody(),
                        null, // Nenhuma alternativa selecionada
                        null,
                        false, // Não está correta pois não foi respondida
                        correctAlternative.getId(),
                        correctAlternative.getBody(),
                        correctAlternative.getJustification()
                ));
            }
        }

        return new AttemptResultDTO(
                quizAttempt.getId(),
                quizAttempt.getQuiz().getId(),
                quizAttempt.getQuiz().getName(),
                quizAttempt.getUser().getId(),
                quizAttempt.getScore(),
                quizAttempt.getStartTime(),
                quizAttempt.getEndTime(),
                quizAttempt.getStatus().toString(),
                answerFeedbacks
        );
    }
}
