package com.example.jadeapi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.jadeapi.model.Quiz;
import com.example.jadeapi.repository.QuizRepository;

@RestController
@RequestMapping("/api/quizzes")
public class QuizController {

    @Autowired
    private QuizRepository quizRepository;

    @GetMapping
    public Page<Quiz> getQuizzes(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size
    ) {
        return quizRepository.findAll(PageRequest.of(page, size));
    }
}
