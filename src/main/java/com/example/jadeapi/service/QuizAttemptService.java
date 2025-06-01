package com.example.jadeapi.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.jadeapi.JadeService;
import com.example.jadeapi.dto.AlternativeDTO; // Corrigido para o local correto se você não tem subpacote enums
import com.example.jadeapi.dto.AnswerFeedbackDTO;
import com.example.jadeapi.dto.AttemptResultDTO;
import com.example.jadeapi.dto.QuestionDTO;
import com.example.jadeapi.dto.QuizDisplayDTO;
import com.example.jadeapi.dto.StartQuizDTO;
import com.example.jadeapi.dto.StudentAnswerDTO;
import com.example.jadeapi.model.Alternative;
import com.example.jadeapi.model.Question;
import com.example.jadeapi.model.Quiz;
import com.example.jadeapi.model.QuizAttempt;
import com.example.jadeapi.model.User;
import com.example.jadeapi.model.UserAnswer;
import com.example.jadeapi.model.enums.AttemptStatus;
import com.example.jadeapi.repository.AlternativeRepository;
import com.example.jadeapi.repository.QuestionRepository;
import com.example.jadeapi.repository.QuizAttemptRepository;
import com.example.jadeapi.repository.QuizRepository;
import com.example.jadeapi.repository.UserAnswerRepository;
import com.example.jadeapi.repository.UserRepository;

import jakarta.persistence.EntityNotFoundException;

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

        if (!selectedAlternative.getQuestion().getId().equals(question.getId())) {
            throw new IllegalArgumentException("A alternativa selecionada não pertence à questão informada.");
        }

        UserAnswer userAnswer = userAnswerRepository.findByQuizAttemptAndQuestion(quizAttempt, question);
        if (userAnswer != null) {
            // Atualiza a resposta existente
            userAnswer.setSelectedAlternative(selectedAlternative); // O setter em UserAnswer deve atualizar isCorrectAtSubmission
            userAnswer.setAnsweredAt(LocalDateTime.now());
            userAnswerRepository.save(userAnswer);
            System.out.println("Resposta existente atualizada para Questão ID: " + question.getId() + " na Tentativa ID: " + attemptId);
            // NÃO crie uma nova UserAnswer aqui
        } else {
            // Cria uma nova resposta
            userAnswer = new UserAnswer(question, selectedAlternative, quizAttempt);
            userAnswerRepository.save(userAnswer);
            System.out.println("Nova resposta criada para Questão ID: " + question.getId() + " na Tentativa ID: " + attemptId);
        }

        String submitAnswerMessage = String.format(
                "{\"action\":\"answer_submitted\", \"attemptId\":%d, \"questionId\":%d, \"selectedAlternativeId\":%d}",
                attemptId,
                studentAnswerDTO.getQuestionId(),
                studentAnswerDTO.getSelectedAlternativeId()
        );
        jadeService.enviarMensagem("evaluator", submitAnswerMessage);
        System.out.println("Mensagem enviada ao evaluator: " + submitAnswerMessage);
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

        // --- LÓGICA DE SCORE CORRIGIDA ---
        List<Question> questionsInQuiz = quizAttempt.getQuiz().getQuestions();
        int totalQuestionsInQuiz = questionsInQuiz.size();
        double correctAnswersCount = 0;

        if (totalQuestionsInQuiz > 0) {
            for (Question question : questionsInQuiz) {
                UserAnswer userAnswer = userAnswerRepository.findByQuizAttemptAndQuestion(quizAttempt, question);
                if (userAnswer != null && userAnswer.getSelectedAlternative() != null && userAnswer.getSelectedAlternative().isCorrect()) {
                    correctAnswersCount++;
                }
            }
            quizAttempt.setScore((correctAnswersCount / totalQuestionsInQuiz) * 100.0);
        } else {
            quizAttempt.setScore(0.0);
        }
        // --- FIM DA LÓGICA DE SCORE CORRIGIDA ---

        quizAttemptRepository.save(quizAttempt);

        String completeAttemptMessage = String.format(Locale.US,
                "{\"action\":\"attempt_completed\", \"attemptId\":%d, \"userId\":%d, \"quizId\":%d, \"finalScore\":%.2f}",
                quizAttempt.getId(),
                quizAttempt.getUser().getId(),
                quizAttempt.getQuiz().getId(),
                quizAttempt.getScore()
        );
        jadeService.enviarMensagem("evaluator", completeAttemptMessage);
        System.out.println("Mensagem enviada ao evaluator: " + completeAttemptMessage);

        return getAttemptResult(attemptId);
    }

    public AttemptResultDTO getAttemptResult(Long attemptId) {
        QuizAttempt quizAttempt = quizAttemptRepository.findById(attemptId)
                .orElseThrow(() -> new EntityNotFoundException("Tentativa de Quiz não encontrada com ID: " + attemptId));

        // Para o feedback, precisamos da ÚLTIMA resposta para cada questão.
        // A lógica atual de getAttemptResult já faz isso buscando todas as userAnswers da tentativa
        // e depois, para cada questão do quiz, pegando a correspondente.
        // Como corrigimos submitAnswer para não criar duplicatas, userAnswers conterá uma por questão.
        List<UserAnswer> userAnswersForFeedback = userAnswerRepository.findByQuizAttempt(quizAttempt);
        List<AnswerFeedbackDTO> answerFeedbacks = new ArrayList<>();

        for (Question question : quizAttempt.getQuiz().getQuestions()) {
            // Encontra a resposta do usuário para esta questão específica na lista de respostas da tentativa
            UserAnswer userAnswer = userAnswersForFeedback.stream()
                    .filter(ua -> ua.getQuestion().getId().equals(question.getId()))
                    .findFirst() // Deve haver apenas uma devido à correção em submitAnswer
                    .orElse(null);

            Alternative correctAlternative = question.getAlternatives().stream()
                    .filter(Alternative::isCorrect)
                    .findFirst()
                    .orElseThrow(() -> new EntityNotFoundException("Alternativa correta não encontrada para a questão ID: " + question.getId()));

            boolean isActuallyCorrect = false; // Determina a correção para o DTO
            Long selectedAlternativeIdForDto = null;
            String selectedAlternativeBodyForDto = null;

            if (userAnswer != null && userAnswer.getSelectedAlternative() != null) {
                selectedAlternativeIdForDto = userAnswer.getSelectedAlternative().getId();
                selectedAlternativeBodyForDto = userAnswer.getSelectedAlternative().getBody();
                // A correção final é baseada na alternativa selecionada na UserAnswer
                isActuallyCorrect = userAnswer.getSelectedAlternative().isCorrect();
            }

            answerFeedbacks.add(new AnswerFeedbackDTO(
                    question.getId(),
                    question.getBody(),
                    selectedAlternativeIdForDto,
                    selectedAlternativeBodyForDto,
                    isActuallyCorrect, // Usa a correção da alternativa efetivamente selecionada
                    correctAlternative.getId(),
                    correctAlternative.getBody(),
                    correctAlternative.getJustification()
            ));
        }

        return new AttemptResultDTO(
                quizAttempt.getId(),
                quizAttempt.getQuiz().getId(),
                quizAttempt.getQuiz().getName(),
                quizAttempt.getUser().getId(),
                quizAttempt.getScore(), // Score calculado corretamente
                quizAttempt.getStartTime(),
                quizAttempt.getEndTime(),
                quizAttempt.getStatus().toString(),
                answerFeedbacks
        );
    }
}
