CREATE TABLE IF NOT EXISTS users (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS subject (
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS quizzes (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    difficulty INT NOT NULL,
    subject_id BIGINT NOT NULL,
    CONSTRAINT fk_quizzes_subject FOREIGN KEY (subject_id) REFERENCES subject(id)
);

CREATE TABLE IF NOT EXISTS questions (
    id BIGSERIAL PRIMARY KEY,
    body TEXT NOT NULL,
    difficulty INT NOT NULL
);

CREATE TABLE IF NOT EXISTS alternatives (
    id BIGSERIAL PRIMARY KEY,
    question_id BIGINT NOT NULL,
    position INT NOT NULL,
    body TEXT NOT NULL,
    is_correct BOOLEAN NOT NULL,
    justification TEXT NOT NULL,
    CONSTRAINT fk_alternatives_question FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE IF NOT EXISTS quiz_questions (
    id BIGSERIAL PRIMARY KEY,
    quiz_id BIGINT NOT NULL,
    question_id BIGINT NOT NULL,
    CONSTRAINT fk_qq_quiz FOREIGN KEY (quiz_id) REFERENCES quizzes(id),
    CONSTRAINT fk_qq_question FOREIGN KEY (question_id) REFERENCES questions(id),
    CONSTRAINT uq_quiz_question UNIQUE (quiz_id, question_id)
);

CREATE TABLE IF NOT EXISTS quiz_attempts (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    quiz_id BIGINT NOT NULL,
    status VARCHAR(50) NOT NULL,
    end_time TIMESTAMP,
    start_time TIMESTAMP NOT NULL,
    score DOUBLE PRECISION NOT NULL,
    CONSTRAINT fk_attempts_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_attempts_quiz FOREIGN KEY (quiz_id) REFERENCES quizzes(id)
);

CREATE TABLE IF NOT EXISTS user_answers (
    id BIGSERIAL PRIMARY KEY,
    question_id BIGINT NOT NULL,
    alternative_id BIGINT NOT NULL,
    quiz_attempt_id BIGINT NOT NULL,
    answered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_correct_at_submission BOOLEAN NOT NULL,
    CONSTRAINT fk_ua_question FOREIGN KEY (question_id) REFERENCES questions(id),
    CONSTRAINT fk_ua_alternative FOREIGN KEY (alternative_id) REFERENCES alternatives(id),
    CONSTRAINT fk_ua_attempt FOREIGN KEY (quiz_attempt_id) REFERENCES quiz_attempts(id)
);
