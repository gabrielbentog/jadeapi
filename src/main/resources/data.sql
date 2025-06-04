INSERT INTO subject (id, name) VALUES (1, 'Matemática') ON CONFLICT (id) DO NOTHING;
INSERT INTO subject (id, name) VALUES (2, 'Português') ON CONFLICT (id) DO NOTHING;
INSERT INTO subject (id, name) VALUES (3, 'Biologia') ON CONFLICT (id) DO NOTHING;
INSERT INTO subject (id, name) VALUES (4, 'Química') ON CONFLICT (id) DO NOTHING;

-- Quiz 1 - Quiz de Matemática #1
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (1, 'Quiz de Matemática #1', 'Questões introdutórias de matemática.', 2, 1) ON CONFLICT (id) DO NOTHING;

-- Questão 1
INSERT INTO questions (id, body, difficulty) VALUES (1, 'Qual é o valor de 7 + 5?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (1, 1, 1, '10', FALSE, '7 + 5 = 12') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (2, 1, 2, '12', TRUE, '7 + 5 = 12') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (3, 1, 3, '13', FALSE, '7 + 5 = 12') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (4, 1, 4, '15', FALSE, '7 + 5 = 12') ON CONFLICT (id) DO NOTHING;

-- Questão 2
INSERT INTO questions (id, body, difficulty) VALUES (2, 'Qual é o resultado da multiplicação 6 × 8?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (5, 2, 1, '42', FALSE, '6 × 8 = 48') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (6, 2, 2, '48', TRUE, '6 × 8 = 48') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (7, 2, 3, '54', FALSE, '6 × 8 = 48') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (8, 2, 4, '36', FALSE, '6 × 8 = 48') ON CONFLICT (id) DO NOTHING;

-- Questão 3
INSERT INTO questions (id, body, difficulty) VALUES (3, 'Qual é a raiz quadrada de 81?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (9, 3, 1, '7', FALSE, '√81 = 9') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (10, 3, 2, '8', FALSE, '√81 = 9') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (11, 3, 3, '10', FALSE, '√81 = 9') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (12, 3, 4, '9', TRUE, '√81 = 9') ON CONFLICT (id) DO NOTHING;

-- Questão 4
INSERT INTO questions (id, body, difficulty) VALUES (4, 'Se um triângulo tem lados de 3 cm, 4 cm e 5 cm, qual é o seu tipo?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (13, 4, 1, 'Retângulo', TRUE, '3² + 4² = 5², logo é um triângulo retângulo') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (14, 4, 2, 'Equilátero', FALSE, 'Os lados não são iguais') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (15, 4, 3, 'Isósceles', FALSE, 'Apenas dois lados iguais') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (16, 4, 4, 'Obtusângulo', FALSE, 'O ângulo maior é reto, não obtuso') ON CONFLICT (id) DO NOTHING;

-- Questão 5
INSERT INTO questions (id, body, difficulty) VALUES (5, 'Qual é o valor de π (pi) arredondado para duas casas decimais?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (17, 5, 1, '3,12', FALSE, 'π ≈ 3,14') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (18, 5, 2, '3,15', FALSE, 'π ≈ 3,14') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (19, 5, 3, '3,14', TRUE, 'π ≈ 3,14') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (20, 5, 4, '3,16', FALSE, 'π ≈ 3,14') ON CONFLICT (id) DO NOTHING;

-- Associando questões ao quiz 1
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (1, 1) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (1, 2) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (1, 3) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (1, 4) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (1, 5) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 2 - Quiz de Matemática #2
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (2, 'Quiz de Matemática #2', 'Questões intermediárias de matemática.', 3, 1) ON CONFLICT (id) DO NOTHING;

-- Questão 6
INSERT INTO questions (id, body, difficulty) VALUES (6, 'Qual é o valor de 15 × 3?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (21, 6, 1, '45', TRUE, '15 × 3 = 45') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (22, 6, 2, '35', FALSE, '15 × 3 = 45') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (23, 6, 3, '40', FALSE, '15 × 3 = 45') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (24, 6, 4, '50', FALSE, '15 × 3 = 45') ON CONFLICT (id) DO NOTHING;

-- Questão 7
INSERT INTO questions (id, body, difficulty) VALUES (7, 'Qual é o resultado da expressão 2² + 3²?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (25, 7, 1, '13', TRUE, '2² = 4, 3² = 9, 4 + 9 = 13') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (26, 7, 2, '12', FALSE, '2² + 3² = 13') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (27, 7, 3, '15', FALSE, '2² + 3² = 13') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (28, 7, 4, '11', FALSE, '2² + 3² = 13') ON CONFLICT (id) DO NOTHING;

-- Questão 8
INSERT INTO questions (id, body, difficulty) VALUES (8, 'Qual é a fração equivalente a 0,75?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (29, 8, 1, '1/2', FALSE, '0,75 = 3/4') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (30, 8, 2, '2/3', FALSE, '0,75 = 3/4') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (31, 8, 3, '3/4', TRUE, '0,75 = 3/4') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (32, 8, 4, '4/5', FALSE, '0,75 = 3/4') ON CONFLICT (id) DO NOTHING;

-- Questão 9
INSERT INTO questions (id, body, difficulty) VALUES (9, 'Qual é o próximo número da sequência: 2, 4, 8, 16, ...?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (33, 9, 1, '18', FALSE, 'A sequência dobra: 16 × 2 = 32') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (34, 9, 2, '24', FALSE, 'A sequência dobra: 16 × 2 = 32') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (35, 9, 3, '20', FALSE, 'A sequência dobra: 16 × 2 = 32') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (36, 9, 4, '32', TRUE, 'A sequência dobra: 16 × 2 = 32') ON CONFLICT (id) DO NOTHING;

-- Questão 10
INSERT INTO questions (id, body, difficulty) VALUES (10, 'Qual é o valor de 100 dividido por 4?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (37, 10, 1, '20', FALSE, '100 ÷ 4 = 25') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (38, 10, 2, '30', FALSE, '100 ÷ 4 = 25') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (39, 10, 3, '25', TRUE, '100 ÷ 4 = 25') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (40, 10, 4, '40', FALSE, '100 ÷ 4 = 25') ON CONFLICT (id) DO NOTHING;

-- Associando questões ao quiz 2
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (2, 6) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (2, 7) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (2, 8) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (2, 9) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (2, 10) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 3 - Quiz de Matemática #3
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (3, 'Quiz de Matemática #3', 'Questões introdutórias de matemática.', 2, 1) ON CONFLICT (id) DO NOTHING;

-- Questão 11
INSERT INTO questions (id, body, difficulty) VALUES (11, 'Qual é o resultado de 9 × 7?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (41, 11, 1, '63', TRUE, '9 × 7 = 63') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (42, 11, 2, '56', FALSE, '9 × 7 = 63') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (43, 11, 3, '72', FALSE, '9 × 7 = 63') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (44, 11, 4, '81', FALSE, '9 × 7 = 63') ON CONFLICT (id) DO NOTHING;

-- Questão 12
INSERT INTO questions (id, body, difficulty) VALUES (12, 'Qual é o valor de 5²?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (45, 12, 1, '10', FALSE, '5² = 25') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (46, 12, 2, '15', FALSE, '5² = 25') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (47, 12, 3, '20', FALSE, '5² = 25') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (48, 12, 4, '25', TRUE, '5² = 25') ON CONFLICT (id) DO NOTHING;

-- Questão 13
INSERT INTO questions (id, body, difficulty) VALUES (13, 'Qual é a fração equivalente a 0,5?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (49, 13, 1, '1/2', TRUE, '0,5 = 1/2') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (50, 13, 2, '1/3', FALSE, '0,5 = 1/2') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (51, 13, 3, '2/3', FALSE, '0,5 = 1/2') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (52, 13, 4, '3/4', FALSE, '0,5 = 1/2') ON CONFLICT (id) DO NOTHING;

-- Questão 14
INSERT INTO questions (id, body, difficulty) VALUES (14, 'Qual é o menor número primo maior que 10?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (53, 14, 1, '11', TRUE, '11 é o menor primo maior que 10') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (54, 14, 2, '12', FALSE, '12 não é primo') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (55, 14, 3, '13', FALSE, '13 é primo, mas não é o menor maior que 10') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (56, 14, 4, '14', FALSE, '14 não é primo') ON CONFLICT (id) DO NOTHING;

-- Questão 15
INSERT INTO questions (id, body, difficulty) VALUES (15, 'Qual é o resultado de 100 ÷ 5?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (57, 15, 1, '15', FALSE, '100 ÷ 5 = 20') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (58, 15, 2, '18', FALSE, '100 ÷ 5 = 20') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (59, 15, 3, '25', FALSE, '100 ÷ 5 = 20') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (60, 15, 4, '20', TRUE, '100 ÷ 5 = 20') ON CONFLICT (id) DO NOTHING;

-- Associando questões ao quiz 3
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (3, 11) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (3, 12) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (3, 13) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (3, 14) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (3, 15) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 4 - Quiz de Matemática #4
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (4, 'Quiz de Matemática #4', 'Questões introdutórias de matemática.', 3, 1) ON CONFLICT (id) DO NOTHING;

-- Questão 16
INSERT INTO questions (id, body, difficulty) VALUES (16, 'Qual é o valor de 2³ + 4²?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (61, 16, 1, '12', FALSE, '2³ = 8, 4² = 16, 8 + 16 = 24') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (62, 16, 2, '20', FALSE, '2³ = 8, 4² = 16, 8 + 16 = 24') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (63, 16, 3, '24', TRUE, '2³ = 8, 4² = 16, 8 + 16 = 24') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (64, 16, 4, '22', FALSE, '2³ = 8, 4² = 16, 8 + 16 = 24') ON CONFLICT (id) DO NOTHING;

-- Questão 17
INSERT INTO questions (id, body, difficulty) VALUES (17, 'Qual é o resultado da expressão 5 × (6 + 2)?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (65, 17, 1, '30', FALSE, '6 + 2 = 8, 5 × 8 = 40') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (66, 17, 2, '35', FALSE, '6 + 2 = 8, 5 × 8 = 40') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (67, 17, 3, '48', FALSE, '6 + 2 = 8, 5 × 8 = 40') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (68, 17, 4, '40', TRUE, '6 + 2 = 8, 5 × 8 = 40') ON CONFLICT (id) DO NOTHING;

-- Questão 18
INSERT INTO questions (id, body, difficulty) VALUES (18, 'Qual é a fração equivalente a 0,2?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (69, 18, 1, '1/5', TRUE, '0,2 = 1/5') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (70, 18, 2, '1/4', FALSE, '1/4 = 0,25') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (71, 18, 3, '1/2', FALSE, '1/2 = 0,5') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (72, 18, 4, '2/5', FALSE, '2/5 = 0,4') ON CONFLICT (id) DO NOTHING;

-- Questão 19
INSERT INTO questions (id, body, difficulty) VALUES (19, 'Qual é o próximo número da sequência: 3, 6, 12, 24, ...?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (73, 19, 1, '36', FALSE, 'A sequência dobra: 24 × 2 = 48') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (74, 19, 2, '48', TRUE, 'A sequência dobra: 24 × 2 = 48') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (75, 19, 3, '30', FALSE, 'A sequência dobra: 24 × 2 = 48') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (76, 19, 4, '60', FALSE, 'A sequência dobra: 24 × 2 = 48') ON CONFLICT (id) DO NOTHING;

-- Questão 20
INSERT INTO questions (id, body, difficulty) VALUES (20, 'Qual é o valor de 81 dividido por 9?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (77, 20, 1, '8', FALSE, '81 ÷ 9 = 9') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (78, 20, 2, '7', FALSE, '81 ÷ 9 = 9') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (79, 20, 3, '9', TRUE, '81 ÷ 9 = 9') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (80, 20, 4, '6', FALSE, '81 ÷ 9 = 9') ON CONFLICT (id) DO NOTHING;

-- Associando questões ao quiz 4
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (4, 16) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (4, 17) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (4, 18) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (4, 19) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (4, 20) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 5 - Quiz de Matemática #5
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (5, 'Quiz de Matemática #5', 'Questões introdutórias de matemática.', 1, 1) ON CONFLICT (id) DO NOTHING;

-- Questão 21
INSERT INTO questions (id, body, difficulty) VALUES (21, 'Qual é o resultado de 3 × 7?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (81, 21, 1, '20', FALSE, '3 × 7 = 21') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (82, 21, 2, '21', TRUE, '3 × 7 = 21') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (83, 21, 3, '24', FALSE, '3 × 7 = 21') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (84, 21, 4, '18', FALSE, '3 × 7 = 21') ON CONFLICT (id) DO NOTHING;

-- Questão 22
INSERT INTO questions (id, body, difficulty) VALUES (22, 'Qual é o valor de 5² + 2²?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (85, 22, 1, '27', FALSE, '5² = 25, 2² = 4, 25 + 4 = 29') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (86, 22, 2, '24', FALSE, '5² + 2² = 29') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (87, 22, 3, '30', FALSE, '5² + 2² = 29') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (88, 22, 4, '29', TRUE, '5² = 25, 2² = 4, 25 + 4 = 29') ON CONFLICT (id) DO NOTHING;

-- Questão 23
INSERT INTO questions (id, body, difficulty) VALUES (23, 'Qual é a raiz quadrada de 49?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (89, 23, 1, '6', FALSE, '√49 = 7') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (90, 23, 2, '8', FALSE, '√49 = 7') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (91, 23, 3, '7', TRUE, '√49 = 7') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (92, 23, 4, '9', FALSE, '√49 = 7') ON CONFLICT (id) DO NOTHING;

-- Questão 24
INSERT INTO questions (id, body, difficulty) VALUES (24, 'Qual é o valor de 100 dividido por 5?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (93, 24, 1, '15', FALSE, '100 ÷ 5 = 20') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (94, 24, 2, '18', FALSE, '100 ÷ 5 = 20') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (95, 24, 3, '25', FALSE, '100 ÷ 5 = 20') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (96, 24, 4, '20', TRUE, '100 ÷ 5 = 20') ON CONFLICT (id) DO NOTHING;

-- Questão 25
INSERT INTO questions (id, body, difficulty) VALUES (25, 'Qual é a fração equivalente a 0,4?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (97, 25, 1, '1/2', FALSE, '0,4 = 2/5') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (98, 25, 2, '1/4', FALSE, '0,4 = 2/5') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (99, 25, 3, '3/5', FALSE, '0,4 = 2/5') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (100, 25, 4, '2/5', TRUE, '0,4 = 2/5') ON CONFLICT (id) DO NOTHING;

-- Associando questões ao quiz 5
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (5, 21) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (5, 22) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (5, 23) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (5, 24) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (5, 25) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 6 - Quiz de Matemática #6
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (6, 'Quiz de Matemática #6', 'Questões introdutórias de matemática.', 2, 1) ON CONFLICT (id) DO NOTHING;

-- Questão 26
INSERT INTO questions (id, body, difficulty) VALUES (26, 'Qual é o valor de 9 × 6?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (101, 26, 1, '54', TRUE, '9 × 6 = 54') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (102, 26, 2, '45', FALSE, '9 × 6 = 54') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (103, 26, 3, '63', FALSE, '9 × 6 = 54') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (104, 26, 4, '56', FALSE, '9 × 6 = 54') ON CONFLICT (id) DO NOTHING;

-- Questão 27
INSERT INTO questions (id, body, difficulty) VALUES (27, 'Qual é a raiz quadrada de 144?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (105, 27, 1, '10', FALSE, '√144 = 12') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (106, 27, 2, '12', TRUE, '√144 = 12') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (107, 27, 3, '14', FALSE, '√144 = 12') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (108, 27, 4, '16', FALSE, '√144 = 12') ON CONFLICT (id) DO NOTHING;

-- Questão 28
INSERT INTO questions (id, body, difficulty) VALUES (28, 'Qual é o resultado da expressão 5 × (3 + 4)?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (109, 28, 1, '35', FALSE, '3 + 4 = 7, 5 × 7 = 35') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (110, 28, 2, '32', FALSE, '3 + 4 = 7, 5 × 7 = 35') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (111, 28, 3, '35', TRUE, '3 + 4 = 7, 5 × 7 = 35') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (112, 28, 4, '28', FALSE, '3 + 4 = 7, 5 × 7 = 35') ON CONFLICT (id) DO NOTHING;

-- Questão 29
INSERT INTO questions (id, body, difficulty) VALUES (29, 'Qual é a fração equivalente a 0,6?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (113, 29, 1, '1/2', FALSE, '0,6 = 3/5') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (114, 29, 2, '2/3', FALSE, '0,6 = 3/5') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (115, 29, 3, '3/5', FALSE, '0,6 = 3/5') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (116, 29, 4, '3/5', TRUE, '0,6 = 3/5') ON CONFLICT (id) DO NOTHING;

-- Questão 30
INSERT INTO questions (id, body, difficulty) VALUES (30, 'Qual é o valor de 11 × 11?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (117, 30, 1, '121', TRUE, '11 × 11 = 121') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (118, 30, 2, '111', FALSE, '11 × 11 = 121') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (119, 30, 3, '101', FALSE, '11 × 11 = 121') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (120, 30, 4, '131', FALSE, '11 × 11 = 121') ON CONFLICT (id) DO NOTHING;

-- Associando questões ao quiz 6
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (6, 26) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (6, 27) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (6, 28) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (6, 29) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (6, 30) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 7 - Quiz de Matemática #7
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (7, 'Quiz de Matemática #7', 'Questões introdutórias de matemática.', 1, 1) ON CONFLICT (id) DO NOTHING;

-- Questão 31
INSERT INTO questions (id, body, difficulty) VALUES (31, 'Qual é o resultado de 8 + 7?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (121, 31, 1, '14', FALSE, '8 + 7 = 15') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (122, 31, 2, '13', FALSE, '8 + 7 = 15') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (123, 31, 3, '16', FALSE, '8 + 7 = 15') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (124, 31, 4, '15', TRUE, '8 + 7 = 15') ON CONFLICT (id) DO NOTHING;

-- Questão 32
INSERT INTO questions (id, body, difficulty) VALUES (32, 'Qual é o valor de 9 × 3?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (125, 32, 1, '18', FALSE, '9 × 3 = 27') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (126, 32, 2, '21', FALSE, '9 × 3 = 27') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (127, 32, 3, '27', TRUE, '9 × 3 = 27') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (128, 32, 4, '24', FALSE, '9 × 3 = 27') ON CONFLICT (id) DO NOTHING;

-- Questão 33
INSERT INTO questions (id, body, difficulty) VALUES (33, 'Qual é a raiz quadrada de 64?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (129, 33, 1, '6', FALSE, '√64 = 8') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (130, 33, 2, '7', FALSE, '√64 = 8') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (131, 33, 3, '8', TRUE, '√64 = 8') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (132, 33, 4, '9', FALSE, '√64 = 8') ON CONFLICT (id) DO NOTHING;

-- Questão 34
INSERT INTO questions (id, body, difficulty) VALUES (34, 'Qual é o próximo número da sequência: 5, 10, 20, 40, ...?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (133, 34, 1, '45', FALSE, 'A sequência dobra: 40 × 2 = 80') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (134, 34, 2, '60', FALSE, 'A sequência dobra: 40 × 2 = 80') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (135, 34, 3, '80', TRUE, 'A sequência dobra: 40 × 2 = 80') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (136, 34, 4, '70', FALSE, 'A sequência dobra: 40 × 2 = 80') ON CONFLICT (id) DO NOTHING;

-- Questão 35
INSERT INTO questions (id, body, difficulty) VALUES (35, 'Qual é o valor de 100 dividido por 2?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (137, 35, 1, '40', FALSE, '100 ÷ 2 = 50') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (138, 35, 2, '60', FALSE, '100 ÷ 2 = 50') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (139, 35, 3, '30', FALSE, '100 ÷ 2 = 50') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (140, 35, 4, '50', TRUE, '100 ÷ 2 = 50') ON CONFLICT (id) DO NOTHING;

-- Associando questões ao quiz 7
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (7, 31) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (7, 32) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (7, 33) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (7, 34) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (7, 35) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 8 - Quiz de Matemática #8
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (8, 'Quiz de Matemática #8', 'Questões introdutórias de matemática.', 2, 1) ON CONFLICT (id) DO NOTHING;

-- Questão 36
INSERT INTO questions (id, body, difficulty) VALUES (36, 'Qual é o valor de 8 × 8?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (141, 36, 1, '56', FALSE, '8 × 8 = 64') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (142, 36, 2, '64', TRUE, '8 × 8 = 64') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (143, 36, 3, '72', FALSE, '8 × 8 = 64') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (144, 36, 4, '48', FALSE, '8 × 8 = 64') ON CONFLICT (id) DO NOTHING;

-- Questão 37
INSERT INTO questions (id, body, difficulty) VALUES (37, 'Qual é o resultado da expressão 3² + 4²?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (145, 37, 1, '21', FALSE, '3² = 9, 4² = 16, 9 + 16 = 25') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (146, 37, 2, '25', TRUE, '3² = 9, 4² = 16, 9 + 16 = 25') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (147, 37, 3, '20', FALSE, '3² + 4² = 25') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (148, 37, 4, '24', FALSE, '3² + 4² = 25') ON CONFLICT (id) DO NOTHING;

-- Questão 38
INSERT INTO questions (id, body, difficulty) VALUES (38, 'Qual é a raiz quadrada de 49?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (149, 38, 1, '7', TRUE, '√49 = 7') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (150, 38, 2, '8', FALSE, '√49 = 7') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (151, 38, 3, '6', FALSE, '√49 = 7') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (152, 38, 4, '9', FALSE, '√49 = 7') ON CONFLICT (id) DO NOTHING;

-- Questão 39
INSERT INTO questions (id, body, difficulty) VALUES (39, 'Qual é o próximo número da sequência: 10, 20, 40, 80, ...?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (153, 39, 1, '100', FALSE, 'A sequência dobra: 80 × 2 = 160') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (154, 39, 2, '160', TRUE, 'A sequência dobra: 80 × 2 = 160') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (155, 39, 3, '120', FALSE, 'A sequência dobra: 80 × 2 = 160') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (156, 39, 4, '140', FALSE, 'A sequência dobra: 80 × 2 = 160') ON CONFLICT (id) DO NOTHING;

-- Questão 40
INSERT INTO questions (id, body, difficulty) VALUES (40, 'Qual é o valor de 144 dividido por 12?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (157, 40, 1, '10', FALSE, '144 ÷ 12 = 12') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (158, 40, 2, '14', FALSE, '144 ÷ 12 = 12') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (159, 40, 3, '12', TRUE, '144 ÷ 12 = 12') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (160, 40, 4, '16', FALSE, '144 ÷ 12 = 12') ON CONFLICT (id) DO NOTHING;

-- Associando questões ao quiz 8
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (8, 36) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (8, 37) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (8, 38) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (8, 39) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (8, 40) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 9 - Quiz de Matemática #9
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (9, 'Quiz de Matemática #9', 'Questões introdutórias de matemática.', 3, 1) ON CONFLICT (id) DO NOTHING;

-- Questão 41
INSERT INTO questions (id, body, difficulty) VALUES (41, 'Qual é o valor de 8 × 5?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (161, 41, 1, '35', FALSE, '8 × 5 = 40') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (162, 41, 2, '30', FALSE, '8 × 5 = 40') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (163, 41, 3, '40', TRUE, '8 × 5 = 40') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (164, 41, 4, '45', FALSE, '8 × 5 = 40') ON CONFLICT (id) DO NOTHING;

-- Questão 42
INSERT INTO questions (id, body, difficulty) VALUES (42, 'Qual é a raiz quadrada de 36?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (165, 42, 1, '5', FALSE, '√36 = 6') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (166, 42, 2, '7', FALSE, '√36 = 6') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (167, 42, 3, '6', TRUE, '√36 = 6') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (168, 42, 4, '8', FALSE, '√36 = 6') ON CONFLICT (id) DO NOTHING;

-- Questão 43
INSERT INTO questions (id, body, difficulty) VALUES (43, 'Qual é o resultado da expressão 4² + 2²?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (169, 43, 1, '18', FALSE, '4² = 16, 2² = 4, 16 + 4 = 20') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (170, 43, 2, '20', TRUE, '4² = 16, 2² = 4, 16 + 4 = 20') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (171, 43, 3, '22', FALSE, '4² + 2² = 20') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (172, 43, 4, '24', FALSE, '4² + 2² = 20') ON CONFLICT (id) DO NOTHING;

-- Questão 44
INSERT INTO questions (id, body, difficulty) VALUES (44, 'Qual é o próximo número da sequência: 1, 3, 6, 10, ...?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (173, 44, 1, '12', FALSE, 'A sequência soma +2, +3, +4... 10+5=15') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (174, 44, 2, '14', FALSE, 'A sequência soma +2, +3, +4... 10+5=15') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (175, 44, 3, '15', TRUE, 'A sequência soma +2, +3, +4... 10+5=15') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (176, 44, 4, '16', FALSE, 'A sequência soma +2, +3, +4... 10+5=15') ON CONFLICT (id) DO NOTHING;

-- Questão 45
INSERT INTO questions (id, body, difficulty) VALUES (45, 'Qual é o valor de 81 dividido por 3?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (177, 45, 1, '24', FALSE, '81 ÷ 3 = 27') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (178, 45, 2, '27', TRUE, '81 ÷ 3 = 27') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (179, 45, 3, '30', FALSE, '81 ÷ 3 = 27') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (180, 45, 4, '21', FALSE, '81 ÷ 3 = 27') ON CONFLICT (id) DO NOTHING;

-- Associando questões ao quiz 9
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (9, 41) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (9, 42) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (9, 43) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (9, 44) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (9, 45) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 10 - Quiz de Matemática #10
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (10, 'Quiz de Matemática #10', 'Questões introdutórias de matemática.', 2, 1) ON CONFLICT (id) DO NOTHING;

-- Questão 46
INSERT INTO questions (id, body, difficulty) VALUES (46, 'Qual é o valor de 2 × 9?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (181, 46, 1, '18', TRUE, '2 × 9 = 18') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (182, 46, 2, '16', FALSE, '2 × 9 = 18') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (183, 46, 3, '20', FALSE, '2 × 9 = 18') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (184, 46, 4, '12', FALSE, '2 × 9 = 18') ON CONFLICT (id) DO NOTHING;

-- Questão 47
INSERT INTO questions (id, body, difficulty) VALUES (47, 'Qual é a raiz quadrada de 121?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (185, 47, 1, '10', FALSE, '√121 = 11') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (186, 47, 2, '12', FALSE, '√121 = 11') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (187, 47, 3, '13', FALSE, '√121 = 11') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (188, 47, 4, '11', TRUE, '√121 = 11') ON CONFLICT (id) DO NOTHING;

-- Questão 48
INSERT INTO questions (id, body, difficulty) VALUES (48, 'Qual é o resultado da expressão 7 + 8?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (189, 48, 1, '14', FALSE, '7 + 8 = 15') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (190, 48, 2, '13', FALSE, '7 + 8 = 15') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (191, 48, 3, '15', TRUE, '7 + 8 = 15') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (192, 48, 4, '16', FALSE, '7 + 8 = 15') ON CONFLICT (id) DO NOTHING;

-- Questão 49
INSERT INTO questions (id, body, difficulty) VALUES (49, 'Qual é o próximo número da sequência: 1, 2, 4, 8, ...?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (193, 49, 1, '10', FALSE, 'A sequência dobra: 8 × 2 = 16') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (194, 49, 2, '16', TRUE, 'A sequência dobra: 8 × 2 = 16') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (195, 49, 3, '12', FALSE, 'A sequência dobra: 8 × 2 = 16') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (196, 49, 4, '14', FALSE, 'A sequência dobra: 8 × 2 = 16') ON CONFLICT (id) DO NOTHING;

-- Questão 50
INSERT INTO questions (id, body, difficulty) VALUES (50, 'Qual é a fração equivalente a 0,8?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (197, 50, 1, '3/4', FALSE, '0,8 = 4/5') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (198, 50, 2, '4/5', TRUE, '0,8 = 4/5') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (199, 50, 3, '2/3', FALSE, '0,8 = 4/5') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (200, 50, 4, '1/2', FALSE, '0,8 = 4/5') ON CONFLICT (id) DO NOTHING;

-- Associando questões ao quiz 10
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (10, 46) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (10, 47) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (10, 48) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (10, 49) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (10, 50) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 11 - Quiz de Português #1
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (11, 'Quiz de Português #1', 'Questões introdutórias de português.', 3, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (51, 'Qual é o sujeito da frase: "O cachorro latiu durante a noite"?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (201, 51, 1, 'A noite', FALSE, 'A noite é o adjunto adverbial de tempo.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (202, 51, 2, 'Latiu', FALSE, 'Latiu é o verbo da frase.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (203, 51, 3, 'O cachorro', TRUE, 'O cachorro é quem pratica a ação, portanto é o sujeito.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (204, 51, 4, 'Durante', FALSE, 'Durante é uma preposição.') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (52, 'Qual alternativa apresenta apenas palavras oxítonas?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (205, 52, 1, 'Café, você, sofá', FALSE, 'Você é paroxítona.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (206, 52, 2, 'Fácil, lápis, ônibus', FALSE, 'Todas são paroxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (207, 52, 3, 'Sofá, café, cipó', TRUE, 'Todas são oxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (208, 52, 4, 'Árvore, lápis, você', FALSE, 'Nenhuma é oxítona.') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (53, 'Em qual alternativa todas as palavras estão corretamente acentuadas?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (209, 53, 1, 'Pôde, hífen, país', FALSE, 'Hífen não é mais acentuado após o novo acordo ortográfico.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (210, 53, 2, 'Pôde, saúde, país', TRUE, 'Todas estão corretas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (211, 53, 3, 'Pude, saúde, país', FALSE, 'Pude não tem acento.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (212, 53, 4, 'Pôde, saude, país', FALSE, 'Saude está sem acento.') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (54, 'Qual frase está correta quanto ao uso da crase?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (213, 54, 1, 'Fui à escola ontem.', TRUE, 'O uso da crase está correto antes de palavra feminina.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (214, 54, 2, 'Vou à o médico.', FALSE, 'Não se usa crase antes de artigo masculino.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (215, 54, 3, 'Cheguei à tarde na festa.', FALSE, 'Não se usa crase antes de palavras masculinas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (216, 54, 4, 'Entreguei o presente à ele.', FALSE, 'Não se usa crase antes de pronomes pessoais.') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (55, 'Qual das frases apresenta um verbo transitivo direto?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (217, 55, 1, 'Gosto de música.', FALSE, 'Gosto é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (218, 55, 2, 'Preciso de ajuda.', FALSE, 'Preciso é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (219, 55, 3, 'Comprei um carro.', TRUE, 'Comprei é verbo transitivo direto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (220, 55, 4, 'Assisti ao filme.', FALSE, 'Assistir, no sentido de ver, é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;

-- Associando questões ao quiz 11
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (11, 51) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (11, 52) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (11, 53) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (11, 54) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (11, 55) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 12 - Quiz de Português #2
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (12, 'Quiz de Português #2', 'Questões introdutórias de português.', 2, 2) ON CONFLICT (id) DO NOTHING;

-- Questão 56
INSERT INTO questions (id, body, difficulty) VALUES (56, 'Qual das frases está correta quanto ao uso da vírgula?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (221, 56, 1, 'Maria foi ao mercado e comprou pão leite e frutas.', FALSE, 'Faltam vírgulas para separar os itens da lista.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (222, 56, 2, 'João, saiu cedo, para trabalhar.', FALSE, 'Não se usa vírgula entre sujeito e verbo.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (223, 56, 3, 'Depois do almoço, fomos ao parque.', TRUE, 'A vírgula separa o adjunto adverbial deslocado.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (224, 56, 4, 'Ela gosta de estudar mas, não gosta de provas.', FALSE, 'A vírgula está no lugar errado.') ON CONFLICT (id) DO NOTHING;

-- Questão 57
INSERT INTO questions (id, body, difficulty) VALUES (57, 'Em qual alternativa todas as palavras são paroxítonas?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (225, 57, 1, 'Árvore, lápis, fácil', TRUE, 'Todas são paroxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (226, 57, 2, 'Sofá, café, cipó', FALSE, 'Todas são oxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (227, 57, 3, 'Você, sofá, cipó', FALSE, 'Você é paroxítona, as outras são oxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (228, 57, 4, 'Papel, sofá, café', FALSE, 'Papel é paroxítona, as outras são oxítonas.') ON CONFLICT (id) DO NOTHING;

-- Questão 58
INSERT INTO questions (id, body, difficulty) VALUES (58, 'Qual frase está correta quanto ao uso do porquê?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (229, 58, 1, 'Não fui à festa porque estava cansado.', TRUE, 'Porque (junto e sem acento) é usado em respostas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (230, 58, 2, 'Por que você não veio?', FALSE, 'Correto, mas a questão pede a correta quanto ao uso do porquê em respostas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (231, 58, 3, 'Não sei por quê.', FALSE, 'Aqui deveria ser "por quê" separado e com acento, mas a frase correta para resposta é a alternativa 1.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (232, 58, 4, 'O por que de tudo isso.', FALSE, 'Aqui deveria ser "porquê" junto e com acento.') ON CONFLICT (id) DO NOTHING;

-- Questão 59
INSERT INTO questions (id, body, difficulty) VALUES (59, 'Qual alternativa apresenta apenas pronomes pessoais?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (233, 59, 1, 'Eu, tu, ele', TRUE, 'Todos são pronomes pessoais do caso reto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (234, 59, 2, 'Meu, teu, seu', FALSE, 'São pronomes possessivos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (235, 59, 3, 'Este, essa, aquele', FALSE, 'São pronomes demonstrativos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (236, 59, 4, 'Quem, qual, quanto', FALSE, 'São pronomes interrogativos.') ON CONFLICT (id) DO NOTHING;

-- Questão 60
INSERT INTO questions (id, body, difficulty) VALUES (60, 'Qual das frases apresenta um verbo transitivo indireto?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (237, 60, 1, 'Assisti ao filme.', FALSE, 'Assistir, no sentido de ver, é transitivo indireto, mas a frase correta é "Assisti ao filme".') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (238, 60, 2, 'Gosto de música.', FALSE, 'Gosto é transitivo indireto, mas a frase correta é "Gosto de música".') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (239, 60, 3, 'Preciso de ajuda.', TRUE, 'Preciso é verbo transitivo indireto, exige preposição.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (240, 60, 4, 'Comprei um carro.', FALSE, 'Comprei é verbo transitivo direto.') ON CONFLICT (id) DO NOTHING;

-- Associando questões ao quiz 12
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (12, 56) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (12, 57) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (12, 58) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (12, 59) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (12, 60) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 13 - Quiz de Português #3
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (13, 'Quiz de Português #3', 'Questões introdutórias de português.', 1, 2) ON CONFLICT (id) DO NOTHING;

-- Questão 61
INSERT INTO questions (id, body, difficulty) VALUES (61, 'Qual é o plural correto da palavra "cidadão"?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (241, 61, 1, 'Cidadãos', TRUE, 'O plural de cidadão é cidadãos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (242, 61, 2, 'Cidadães', FALSE, 'Cidadães está incorreto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (243, 61, 3, 'Cidadões', FALSE, 'Cidadões está incorreto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (244, 61, 4, 'Cidadães', FALSE, 'Cidadães está incorreto.') ON CONFLICT (id) DO NOTHING;

-- Questão 62
INSERT INTO questions (id, body, difficulty) VALUES (62, 'Qual frase está correta quanto ao uso da vírgula?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (245, 62, 1, 'João foi ao mercado, e comprou pão.', FALSE, 'Não se usa vírgula antes de "e" em frases simples.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (246, 62, 2, 'Maria, gosta de estudar.', FALSE, 'Não se separa sujeito do verbo com vírgula.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (247, 62, 3, 'Depois do almoço, fomos ao parque.', TRUE, 'A vírgula separa o adjunto adverbial deslocado.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (248, 62, 4, 'Ele gosta de estudar mas, não gosta de provas.', FALSE, 'A vírgula está no lugar errado.') ON CONFLICT (id) DO NOTHING;

-- Questão 63
INSERT INTO questions (id, body, difficulty) VALUES (63, 'Em qual alternativa todas as palavras são paroxítonas?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (249, 63, 1, 'Árvore, lápis, fácil', TRUE, 'Todas são paroxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (250, 63, 2, 'Sofá, café, cipó', FALSE, 'Todas são oxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (251, 63, 3, 'Você, sofá, cipó', FALSE, 'Você é paroxítona, as outras são oxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (252, 63, 4, 'Papel, sofá, café', FALSE, 'Papel é paroxítona, as outras são oxítonas.') ON CONFLICT (id) DO NOTHING;

-- Questão 64
INSERT INTO questions (id, body, difficulty) VALUES (64, 'Qual alternativa apresenta apenas pronomes pessoais?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (253, 64, 1, 'Eu, tu, ele', TRUE, 'Todos são pronomes pessoais do caso reto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (254, 64, 2, 'Meu, teu, seu', FALSE, 'São pronomes possessivos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (255, 64, 3, 'Este, essa, aquele', FALSE, 'São pronomes demonstrativos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (256, 64, 4, 'Quem, qual, quanto', FALSE, 'São pronomes interrogativos.') ON CONFLICT (id) DO NOTHING;

-- Questão 65
INSERT INTO questions (id, body, difficulty) VALUES (65, 'Qual das frases apresenta um verbo transitivo indireto?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (257, 65, 1, 'Assisti ao filme.', TRUE, 'Assistir, no sentido de ver, é transitivo indireto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (258, 65, 2, 'Comprei um carro.', FALSE, 'Comprei é verbo transitivo direto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (259, 65, 3, 'Gosto de música.', FALSE, 'Gosto é transitivo indireto, mas a frase correta é "Gosto de música".') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (260, 65, 4, 'Preciso de ajuda.', FALSE, 'Preciso é verbo transitivo indireto, mas a frase correta é "Preciso de ajuda".') ON CONFLICT (id) DO NOTHING;

-- Associando questões ao quiz 13
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (13, 61) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (13, 62) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (13, 63) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (13, 64) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (13, 65) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 14 - Quiz de Português #4
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (14, 'Quiz de Português #4', 'Questões introdutórias de português.', 2, 2) ON CONFLICT (id) DO NOTHING;

-- Questão 66
INSERT INTO questions (id, body, difficulty) VALUES (66, 'Qual das frases está correta quanto ao uso do "mas"?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (261, 66, 1, 'Quero ir, mas estou cansado.', TRUE, 'O "mas" é uma conjunção adversativa e está corretamente empregado.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (262, 66, 2, 'Quero ir mas, estou cansado.', FALSE, 'Não se usa vírgula após o "mas".') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (263, 66, 3, 'Quero ir mas estou, cansado.', FALSE, 'A vírgula está no lugar errado.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (264, 66, 4, 'Quero ir mas estou cansado.', FALSE, 'Falta a vírgula antes do "mas".') ON CONFLICT (id) DO NOTHING;

-- Questão 67
INSERT INTO questions (id, body, difficulty) VALUES (67, 'Em qual alternativa todas as palavras são substantivos?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (265, 67, 1, 'Casa, livro, felicidade', TRUE, 'Todas são substantivos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (266, 67, 2, 'Correr, livro, azul', FALSE, 'Correr é verbo e azul é adjetivo.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (267, 67, 3, 'Casa, correr, azul', FALSE, 'Correr é verbo e azul é adjetivo.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (268, 67, 4, 'Felicidade, azul, livro', FALSE, 'Azul é adjetivo.') ON CONFLICT (id) DO NOTHING;

-- Questão 68
INSERT INTO questions (id, body, difficulty) VALUES (68, 'Qual alternativa apresenta apenas verbos no infinitivo?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (269, 68, 1, 'Correr, comer, dormir', TRUE, 'Todos estão no infinitivo.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (270, 68, 2, 'Corro, como, durmo', FALSE, 'Estão no presente do indicativo.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (271, 68, 3, 'Correndo, comendo, dormindo', FALSE, 'Estão no gerúndio.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (272, 68, 4, 'Corri, comi, dormi', FALSE, 'Estão no pretérito perfeito.') ON CONFLICT (id) DO NOTHING;

-- Questão 69
INSERT INTO questions (id, body, difficulty) VALUES (69, 'Qual frase está correta quanto ao uso da vírgula?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (273, 69, 1, 'Depois do almoço, fomos ao parque.', TRUE, 'A vírgula separa o adjunto adverbial deslocado.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (274, 69, 2, 'Fomos ao parque depois do almoço.', FALSE, 'Não há necessidade de vírgula.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (275, 69, 3, 'Depois do almoço fomos ao parque.', FALSE, 'Falta a vírgula após o adjunto adverbial deslocado.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (276, 69, 4, 'Fomos, ao parque depois do almoço.', FALSE, 'A vírgula está no lugar errado.') ON CONFLICT (id) DO NOTHING;

-- Questão 70
INSERT INTO questions (id, body, difficulty) VALUES (70, 'Qual alternativa apresenta apenas pronomes demonstrativos?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (277, 70, 1, 'Este, essa, aquele', TRUE, 'Todos são pronomes demonstrativos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (278, 70, 2, 'Eu, tu, ele', FALSE, 'São pronomes pessoais.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (279, 70, 3, 'Meu, teu, seu', FALSE, 'São pronomes possessivos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (280, 70, 4, 'Quem, qual, quanto', FALSE, 'São pronomes interrogativos.') ON CONFLICT (id) DO NOTHING;

-- Associação das questões ao quiz 14
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (14, 66) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (14, 67) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (14, 68) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (14, 69) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (14, 70) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 15 - Quiz de Português #5
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (15, 'Quiz de Português #5', 'Questões introdutórias de português.', 3, 2) ON CONFLICT (id) DO NOTHING;

-- Questão 71
INSERT INTO questions (id, body, difficulty) VALUES (71, 'Qual é o antônimo da palavra "feliz"?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (281, 71, 1, 'Alegre', FALSE, 'Alegre é sinônimo de feliz.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (282, 71, 2, 'Triste', TRUE, 'Triste é o oposto de feliz.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (283, 71, 3, 'Contente', FALSE, 'Contente é sinônimo de feliz.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (284, 71, 4, 'Satisfeito', FALSE, 'Satisfeito é sinônimo de feliz.') ON CONFLICT (id) DO NOTHING;

-- Questão 72
INSERT INTO questions (id, body, difficulty) VALUES (72, 'Qual frase está correta quanto ao uso do "mal" e "mau"?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (285, 72, 1, 'Ele é um mal menino.', FALSE, 'O correto seria "mau menino".') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (286, 72, 2, 'Ele acordou de mau humor.', TRUE, '"Mau" é o oposto de bom, correto na frase.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (287, 72, 3, 'O remédio fez mau à saúde.', FALSE, 'O correto seria "mal à saúde".') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (288, 72, 4, 'Ele saiu de mal com todos.', FALSE, 'O correto seria "mal com todos".') ON CONFLICT (id) DO NOTHING;

-- Questão 73
INSERT INTO questions (id, body, difficulty) VALUES (73, 'Qual alternativa apresenta apenas substantivos?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (289, 73, 1, 'Casa, correr, azul', FALSE, 'Correr é verbo e azul é adjetivo.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (290, 73, 2, 'Felicidade, livro, mesa', TRUE, 'Todas são substantivos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (291, 73, 3, 'Bonito, casa, correr', FALSE, 'Bonito é adjetivo e correr é verbo.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (292, 73, 4, 'Mesa, azul, felicidade', FALSE, 'Azul é adjetivo.') ON CONFLICT (id) DO NOTHING;

-- Questão 74
INSERT INTO questions (id, body, difficulty) VALUES (74, 'Qual alternativa apresenta apenas palavras paroxítonas?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (293, 74, 1, 'Lápis, árvore, fácil', TRUE, 'Todas são paroxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (294, 74, 2, 'Café, sofá, cipó', FALSE, 'Todas são oxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (295, 74, 3, 'Você, sofá, café', FALSE, 'Você é paroxítona, as outras são oxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (296, 74, 4, 'Papel, sofá, café', FALSE, 'Papel é paroxítona, as outras são oxítonas.') ON CONFLICT (id) DO NOTHING;

-- Questão 75
INSERT INTO questions (id, body, difficulty) VALUES (75, 'Qual das frases apresenta um verbo transitivo direto?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (297, 75, 1, 'Gosto de música.', FALSE, 'Gosto é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (298, 75, 2, 'Comprei um carro.', TRUE, 'Comprei é verbo transitivo direto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (299, 75, 3, 'Preciso de ajuda.', FALSE, 'Preciso é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (300, 75, 4, 'Assisti ao filme.', FALSE, 'Assistir, no sentido de ver, é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;

-- Associação das questões ao quiz 15
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (15, 71) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (15, 72) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (15, 73) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (15, 74) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (15, 75) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 16 - Quiz de Português #6
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (16, 'Quiz de Português #6', 'Questões introdutórias de português.', 2, 2) ON CONFLICT (id) DO NOTHING;

-- Questão 76
INSERT INTO questions (id, body, difficulty) VALUES (76, 'Qual é o plural correto da palavra "pão"?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (301, 76, 1, 'Pães', TRUE, 'O plural de pão é pães.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (302, 76, 2, 'Pãos', FALSE, 'Pãos está incorreto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (303, 76, 3, 'Pãoses', FALSE, 'Pãoses está incorreto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (304, 76, 4, 'Pãons', FALSE, 'Pãons está incorreto.') ON CONFLICT (id) DO NOTHING;

-- Questão 77
INSERT INTO questions (id, body, difficulty) VALUES (77, 'Qual frase está correta quanto ao uso do "por que"?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (305, 77, 1, 'Não sei porque.', FALSE, 'Aqui o correto seria "por quê".') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (306, 77, 2, 'Por que você saiu cedo?', TRUE, 'Usa-se "por que" separado em perguntas diretas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (307, 77, 3, 'Ele saiu porquê estava cansado.', FALSE, 'Aqui o correto seria "porque".') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (308, 77, 4, 'O por que de tudo isso.', FALSE, 'Aqui o correto seria "porquê".') ON CONFLICT (id) DO NOTHING;

-- Questão 78
INSERT INTO questions (id, body, difficulty) VALUES (78, 'Qual alternativa apresenta apenas pronomes possessivos?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (309, 78, 1, 'Eu, tu, ele', FALSE, 'São pronomes pessoais.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (310, 78, 2, 'Meu, teu, seu', TRUE, 'Todos são pronomes possessivos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (311, 78, 3, 'Este, essa, aquele', FALSE, 'São pronomes demonstrativos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (312, 78, 4, 'Quem, qual, quanto', FALSE, 'São pronomes interrogativos.') ON CONFLICT (id) DO NOTHING;

-- Questão 79
INSERT INTO questions (id, body, difficulty) VALUES (79, 'Qual das frases apresenta um verbo transitivo direto?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (313, 79, 1, 'Gosto de música.', FALSE, 'Gosto é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (314, 79, 2, 'Comprei um livro.', TRUE, 'Comprei é verbo transitivo direto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (315, 79, 3, 'Preciso de ajuda.', FALSE, 'Preciso é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (316, 79, 4, 'Assisti ao filme.', FALSE, 'Assistir, no sentido de ver, é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;

-- Questão 80
INSERT INTO questions (id, body, difficulty) VALUES (80, 'Qual alternativa apresenta apenas palavras oxítonas?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (317, 80, 1, 'Sofá, café, cipó', TRUE, 'Todas são oxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (318, 80, 2, 'Árvore, lápis, fácil', FALSE, 'Todas são paroxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (319, 80, 3, 'Você, sofá, café', FALSE, 'Você é paroxítona, as outras são oxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (320, 80, 4, 'Papel, sofá, café', FALSE, 'Papel é paroxítona, as outras são oxítonas.') ON CONFLICT (id) DO NOTHING;

-- Associação das questões ao quiz 16
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (16, 76) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (16, 77) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (16, 78) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (16, 79) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (16, 80) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 17 - Quiz de Português #7
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (17, 'Quiz de Português #7', 'Questões introdutórias de português.', 2, 2) ON CONFLICT (id) DO NOTHING;

-- Questão 81
INSERT INTO questions (id, body, difficulty) VALUES (81, 'Qual é o plural correto da palavra "pão"?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (321, 81, 1, 'Pães', TRUE, 'O plural de pão é pães.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (322, 81, 2, 'Pãos', FALSE, 'Pãos está incorreto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (323, 81, 3, 'Pãoses', FALSE, 'Pãoses está incorreto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (324, 81, 4, 'Pãons', FALSE, 'Pãons está incorreto.') ON CONFLICT (id) DO NOTHING;

-- Questão 82
INSERT INTO questions (id, body, difficulty) VALUES (82, 'Qual frase está correta quanto ao uso do "por que"?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (325, 82, 1, 'Não sei porque.', FALSE, 'Aqui o correto seria "por quê".') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (326, 82, 2, 'Por que você saiu cedo?', TRUE, 'Usa-se "por que" separado em perguntas diretas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (327, 82, 3, 'Ele saiu porquê estava cansado.', FALSE, 'Aqui o correto seria "porque".') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (328, 82, 4, 'O por que de tudo isso.', FALSE, 'Aqui o correto seria "porquê".') ON CONFLICT (id) DO NOTHING;

-- Questão 83
INSERT INTO questions (id, body, difficulty) VALUES (83, 'Qual alternativa apresenta apenas pronomes possessivos?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (329, 83, 1, 'Eu, tu, ele', FALSE, 'São pronomes pessoais.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (330, 83, 2, 'Meu, teu, seu', TRUE, 'Todos são pronomes possessivos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (331, 83, 3, 'Este, essa, aquele', FALSE, 'São pronomes demonstrativos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (332, 83, 4, 'Quem, qual, quanto', FALSE, 'São pronomes interrogativos.') ON CONFLICT (id) DO NOTHING;

-- Questão 84
INSERT INTO questions (id, body, difficulty) VALUES (84, 'Qual das frases apresenta um verbo transitivo direto?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (333, 84, 1, 'Gosto de música.', FALSE, 'Gosto é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (334, 84, 2, 'Comprei um livro.', TRUE, 'Comprei é verbo transitivo direto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (335, 84, 3, 'Preciso de ajuda.', FALSE, 'Preciso é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (336, 84, 4, 'Assisti ao filme.', FALSE, 'Assistir, no sentido de ver, é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;

-- Questão 85
INSERT INTO questions (id, body, difficulty) VALUES (85, 'Qual alternativa apresenta apenas palavras oxítonas?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (337, 85, 1, 'Sofá, café, cipó', TRUE, 'Todas são oxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (338, 85, 2, 'Árvore, lápis, fácil', FALSE, 'Todas são paroxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (339, 85, 3, 'Você, sofá, café', FALSE, 'Você é paroxítona, as outras são oxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (340, 85, 4, 'Papel, sofá, café', FALSE, 'Papel é paroxítona, as outras são oxítonas.') ON CONFLICT (id) DO NOTHING;

-- Associação das questões ao quiz 17
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (17, 81) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (17, 82) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (17, 83) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (17, 84) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (17, 85) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 18 - Quiz de Português #8
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (18, 'Quiz de Português #8', 'Questões introdutórias de português.', 2, 2) ON CONFLICT (id) DO NOTHING;

-- Questão 86
INSERT INTO questions (id, body, difficulty) VALUES (86, 'Qual é o plural correto da palavra "pão"?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (341, 86, 1, 'Pães', TRUE, 'O plural de pão é pães.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (342, 86, 2, 'Pãos', FALSE, 'Pãos está incorreto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (343, 86, 3, 'Pãoses', FALSE, 'Pãoses está incorreto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (344, 86, 4, 'Pãons', FALSE, 'Pãons está incorreto.') ON CONFLICT (id) DO NOTHING;

-- Questão 87
INSERT INTO questions (id, body, difficulty) VALUES (87, 'Qual frase está correta quanto ao uso do "por que"?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (345, 87, 1, 'Não sei porque.', FALSE, 'Aqui o correto seria "por quê".') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (346, 87, 2, 'Por que você saiu cedo?', TRUE, 'Usa-se "por que" separado em perguntas diretas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (347, 87, 3, 'Ele saiu porquê estava cansado.', FALSE, 'Aqui o correto seria "porque".') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (348, 87, 4, 'O por que de tudo isso.', FALSE, 'Aqui o correto seria "porquê".') ON CONFLICT (id) DO NOTHING;

-- Questão 88
INSERT INTO questions (id, body, difficulty) VALUES (88, 'Qual alternativa apresenta apenas pronomes possessivos?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (349, 88, 1, 'Eu, tu, ele', FALSE, 'São pronomes pessoais.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (350, 88, 2, 'Meu, teu, seu', TRUE, 'Todos são pronomes possessivos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (351, 88, 3, 'Este, essa, aquele', FALSE, 'São pronomes demonstrativos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (352, 88, 4, 'Quem, qual, quanto', FALSE, 'São pronomes interrogativos.') ON CONFLICT (id) DO NOTHING;

-- Questão 89
INSERT INTO questions (id, body, difficulty) VALUES (89, 'Qual das frases apresenta um verbo transitivo direto?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (353, 89, 1, 'Gosto de música.', FALSE, 'Gosto é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (354, 89, 2, 'Comprei um livro.', TRUE, 'Comprei é verbo transitivo direto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (355, 89, 3, 'Preciso de ajuda.', FALSE, 'Preciso é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (356, 89, 4, 'Assisti ao filme.', FALSE, 'Assistir, no sentido de ver, é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;

-- Questão 90
INSERT INTO questions (id, body, difficulty) VALUES (90, 'Qual alternativa apresenta apenas palavras oxítonas?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (357, 90, 1, 'Sofá, café, cipó', TRUE, 'Todas são oxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (358, 90, 2, 'Árvore, lápis, fácil', FALSE, 'Todas são paroxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (359, 90, 3, 'Você, sofá, café', FALSE, 'Você é paroxítona, as outras são oxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (360, 90, 4, 'Papel, sofá, café', FALSE, 'Papel é paroxítona, as outras são oxítonas.') ON CONFLICT (id) DO NOTHING;

-- Associação das questões ao quiz 18
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (18, 86) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (18, 87) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (18, 88) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (18, 89) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (18, 90) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 19 - Quiz de Português #9
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (19, 'Quiz de Português #9', 'Questões introdutórias de português.', 3, 2) ON CONFLICT (id) DO NOTHING;

-- Questão 91
INSERT INTO questions (id, body, difficulty) VALUES (91, 'Qual é o plural correto da palavra "mão"?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (361, 91, 1, 'Mãos', TRUE, 'O plural de "mão" é "mãos".') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (362, 91, 2, 'Mãons', FALSE, 'Mãons não existe.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (363, 91, 3, 'Mãoses', FALSE, 'Mãoses não existe.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (364, 91, 4, 'Mããos', FALSE, 'Mããos não existe.') ON CONFLICT (id) DO NOTHING;

-- Questão 92
INSERT INTO questions (id, body, difficulty) VALUES (92, 'Qual frase está correta quanto ao uso do "por que"?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (365, 92, 1, 'Não sei porque.', FALSE, 'Aqui o correto seria "por quê".') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (366, 92, 2, 'Por que você saiu cedo?', TRUE, 'Usa-se "por que" separado em perguntas diretas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (367, 92, 3, 'Ele saiu porquê estava cansado.', FALSE, 'Aqui o correto seria "porque".') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (368, 92, 4, 'O por que de tudo isso.', FALSE, 'Aqui o correto seria "porquê".') ON CONFLICT (id) DO NOTHING;

-- Questão 93
INSERT INTO questions (id, body, difficulty) VALUES (93, 'Qual alternativa apresenta apenas pronomes possessivos?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (369, 93, 1, 'Eu, tu, ele', FALSE, 'São pronomes pessoais.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (370, 93, 2, 'Meu, teu, seu', TRUE, 'Todos são pronomes possessivos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (371, 93, 3, 'Este, essa, aquele', FALSE, 'São pronomes demonstrativos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (372, 93, 4, 'Quem, qual, quanto', FALSE, 'São pronomes interrogativos.') ON CONFLICT (id) DO NOTHING;

-- Questão 94
INSERT INTO questions (id, body, difficulty) VALUES (94, 'Qual das frases apresenta um verbo transitivo direto?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (373, 94, 1, 'Gosto de música.', FALSE, 'Gosto é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (374, 94, 2, 'Preciso de ajuda.', FALSE, 'Preciso é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (375, 94, 3, 'Comprei um livro.', TRUE, 'Comprei é verbo transitivo direto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (376, 94, 4, 'Assisti ao filme.', FALSE, 'Assistir, no sentido de ver, é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;

-- Questão 95
INSERT INTO questions (id, body, difficulty) VALUES (95, 'Qual alternativa apresenta apenas palavras oxítonas?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (377, 95, 1, 'Árvore, lápis, fácil', FALSE, 'Todas são paroxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (378, 95, 2, 'Sofá, café, cipó', TRUE, 'Todas são oxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (379, 95, 3, 'Você, sofá, café', FALSE, 'Você é paroxítona, as outras são oxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (380, 95, 4, 'Papel, sofá, café', FALSE, 'Papel é paroxítona, as outras são oxítonas.') ON CONFLICT (id) DO NOTHING;

-- Associação das questões ao quiz 19
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (19, 91) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (19, 92) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (19, 93) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (19, 94) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (19, 95) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 20 - Quiz de Português #10
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (20, 'Quiz de Português #10', 'Questões introdutórias de português.', 2, 2) ON CONFLICT (id) DO NOTHING;

-- Questão 96
INSERT INTO questions (id, body, difficulty) VALUES (96, 'Qual é o plural correto da palavra "cão"?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (381, 96, 1, 'Cães', TRUE, 'O plural de "cão" é "cães".') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (382, 96, 2, 'Cãos', FALSE, 'Cãos está incorreto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (383, 96, 3, 'Cãoses', FALSE, 'Cãoses está incorreto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (384, 96, 4, 'Cãons', FALSE, 'Cãons está incorreto.') ON CONFLICT (id) DO NOTHING;

-- Questão 97
INSERT INTO questions (id, body, difficulty) VALUES (97, 'Qual frase está correta quanto ao uso do "por que"?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (385, 97, 1, 'Não sei porque.', FALSE, 'Aqui o correto seria "por quê".') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (386, 97, 2, 'Por que você saiu cedo?', TRUE, 'Usa-se "por que" separado em perguntas diretas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (387, 97, 3, 'Ele saiu porquê estava cansado.', FALSE, 'Aqui o correto seria "porque".') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (388, 97, 4, 'O por que de tudo isso.', FALSE, 'Aqui o correto seria "porquê".') ON CONFLICT (id) DO NOTHING;

-- Questão 98
INSERT INTO questions (id, body, difficulty) VALUES (98, 'Qual alternativa apresenta apenas pronomes possessivos?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (389, 98, 1, 'Eu, tu, ele', FALSE, 'São pronomes pessoais.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (390, 98, 2, 'Meu, teu, seu', TRUE, 'Todos são pronomes possessivos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (391, 98, 3, 'Este, essa, aquele', FALSE, 'São pronomes demonstrativos.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (392, 98, 4, 'Quem, qual, quanto', FALSE, 'São pronomes interrogativos.') ON CONFLICT (id) DO NOTHING;

-- Questão 99
INSERT INTO questions (id, body, difficulty) VALUES (99, 'Qual das frases apresenta um verbo transitivo direto?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (393, 99, 1, 'Comprei um livro.', TRUE, 'Comprei é verbo transitivo direto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (394, 99, 2, 'Gosto de música.', FALSE, 'Gosto é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (395, 99, 3, 'Preciso de ajuda.', FALSE, 'Preciso é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (396, 99, 4, 'Assisti ao filme.', FALSE, 'Assistir, no sentido de ver, é verbo transitivo indireto.') ON CONFLICT (id) DO NOTHING;

-- Questão 100
INSERT INTO questions (id, body, difficulty) VALUES (100, 'Qual alternativa apresenta apenas palavras oxítonas?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (397, 100, 1, 'Sofá, café, cipó', TRUE, 'Todas são oxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (398, 100, 2, 'Árvore, lápis, fácil', FALSE, 'Todas são paroxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (399, 100, 3, 'Você, sofá, café', FALSE, 'Você é paroxítona, as outras são oxítonas.') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (400, 100, 4, 'Papel, sofá, café', FALSE, 'Papel é paroxítona, as outras são oxítonas.') ON CONFLICT (id) DO NOTHING;

-- Associação das questões ao quiz 20
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (20, 96) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (20, 97) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (20, 98) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (20, 99) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (20, 100) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 21 - Quiz de Biologia #1
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (21, 'Quiz de Biologia #1', 'Questões introdutórias de biologia.', 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (101, 'Biologia: Vero sint eos minima accusamus accusamus.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (401, 101, 1, 'Alternativa 1 para a questão 101', FALSE, 'Justificativa para a alternativa 1 da questão 101') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (402, 101, 2, 'Alternativa 2 para a questão 101', TRUE, 'Justificativa para a alternativa 2 da questão 101') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (403, 101, 3, 'Alternativa 3 para a questão 101', FALSE, 'Justificativa para a alternativa 3 da questão 101') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (404, 101, 4, 'Alternativa 4 para a questão 101', FALSE, 'Justificativa para a alternativa 4 da questão 101') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (102, 'Biologia: Vel ipsa qui rem consequatur.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (405, 102, 1, 'Alternativa 1 para a questão 102', FALSE, 'Justificativa para a alternativa 1 da questão 102') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (406, 102, 2, 'Alternativa 2 para a questão 102', TRUE, 'Justificativa para a alternativa 2 da questão 102') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (407, 102, 3, 'Alternativa 3 para a questão 102', FALSE, 'Justificativa para a alternativa 3 da questão 102') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (408, 102, 4, 'Alternativa 4 para a questão 102', FALSE, 'Justificativa para a alternativa 4 da questão 102') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (103, 'Biologia: Facilis minus magni hic officiis ipsum nobis.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (409, 103, 1, 'Alternativa 1 para a questão 103', FALSE, 'Justificativa para a alternativa 1 da questão 103') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (410, 103, 2, 'Alternativa 2 para a questão 103', TRUE, 'Justificativa para a alternativa 2 da questão 103') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (411, 103, 3, 'Alternativa 3 para a questão 103', FALSE, 'Justificativa para a alternativa 3 da questão 103') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (412, 103, 4, 'Alternativa 4 para a questão 103', FALSE, 'Justificativa para a alternativa 4 da questão 103') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (104, 'Biologia: Animi iusto optio odio quos voluptatibus in eligendi.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (413, 104, 1, 'Alternativa 1 para a questão 104', FALSE, 'Justificativa para a alternativa 1 da questão 104') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (414, 104, 2, 'Alternativa 2 para a questão 104', FALSE, 'Justificativa para a alternativa 2 da questão 104') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (415, 104, 3, 'Alternativa 3 para a questão 104', TRUE, 'Justificativa para a alternativa 3 da questão 104') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (416, 104, 4, 'Alternativa 4 para a questão 104', FALSE, 'Justificativa para a alternativa 4 da questão 104') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (105, 'Biologia: Eveniet nesciunt minima eligendi aliquid temporibus.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (417, 105, 1, 'Alternativa 1 para a questão 105', TRUE, 'Justificativa para a alternativa 1 da questão 105') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (418, 105, 2, 'Alternativa 2 para a questão 105', FALSE, 'Justificativa para a alternativa 2 da questão 105') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (419, 105, 3, 'Alternativa 3 para a questão 105', FALSE, 'Justificativa para a alternativa 3 da questão 105') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (420, 105, 4, 'Alternativa 4 para a questão 105', FALSE, 'Justificativa para a alternativa 4 da questão 105') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (21, 101) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (21, 102) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (21, 103) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (21, 104) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (21, 105) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 22 - Quiz de Biologia #2
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (22, 'Quiz de Biologia #2', 'Questões introdutórias de biologia.', 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (106, 'Biologia: A id facilis cupiditate voluptatum vitae libero.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (421, 106, 1, 'Alternativa 1 para a questão 106', TRUE, 'Justificativa para a alternativa 1 da questão 106') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (422, 106, 2, 'Alternativa 2 para a questão 106', FALSE, 'Justificativa para a alternativa 2 da questão 106') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (423, 106, 3, 'Alternativa 3 para a questão 106', FALSE, 'Justificativa para a alternativa 3 da questão 106') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (424, 106, 4, 'Alternativa 4 para a questão 106', FALSE, 'Justificativa para a alternativa 4 da questão 106') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (107, 'Biologia: Magni aliquam tempore sed non reiciendis quas.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (425, 107, 1, 'Alternativa 1 para a questão 107', FALSE, 'Justificativa para a alternativa 1 da questão 107') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (426, 107, 2, 'Alternativa 2 para a questão 107', TRUE, 'Justificativa para a alternativa 2 da questão 107') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (427, 107, 3, 'Alternativa 3 para a questão 107', FALSE, 'Justificativa para a alternativa 3 da questão 107') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (428, 107, 4, 'Alternativa 4 para a questão 107', FALSE, 'Justificativa para a alternativa 4 da questão 107') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (108, 'Biologia: Veritatis at illo perferendis ad ullam.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (429, 108, 1, 'Alternativa 1 para a questão 108', TRUE, 'Justificativa para a alternativa 1 da questão 108') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (430, 108, 2, 'Alternativa 2 para a questão 108', FALSE, 'Justificativa para a alternativa 2 da questão 108') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (431, 108, 3, 'Alternativa 3 para a questão 108', FALSE, 'Justificativa para a alternativa 3 da questão 108') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (432, 108, 4, 'Alternativa 4 para a questão 108', FALSE, 'Justificativa para a alternativa 4 da questão 108') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (109, 'Biologia: Corporis id corrupti dolorum expedita.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (433, 109, 1, 'Alternativa 1 para a questão 109', FALSE, 'Justificativa para a alternativa 1 da questão 109') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (434, 109, 2, 'Alternativa 2 para a questão 109', FALSE, 'Justificativa para a alternativa 2 da questão 109') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (435, 109, 3, 'Alternativa 3 para a questão 109', FALSE, 'Justificativa para a alternativa 3 da questão 109') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (436, 109, 4, 'Alternativa 4 para a questão 109', TRUE, 'Justificativa para a alternativa 4 da questão 109') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (110, 'Biologia: Ut nemo fugit delectus sapiente labore.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (437, 110, 1, 'Alternativa 1 para a questão 110', FALSE, 'Justificativa para a alternativa 1 da questão 110') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (438, 110, 2, 'Alternativa 2 para a questão 110', TRUE, 'Justificativa para a alternativa 2 da questão 110') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (439, 110, 3, 'Alternativa 3 para a questão 110', FALSE, 'Justificativa para a alternativa 3 da questão 110') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (440, 110, 4, 'Alternativa 4 para a questão 110', FALSE, 'Justificativa para a alternativa 4 da questão 110') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (22, 106) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (22, 107) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (22, 108) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (22, 109) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (22, 110) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 23 - Quiz de Biologia #3
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (23, 'Quiz de Biologia #3', 'Questões introdutórias de biologia.', 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (111, 'Biologia: Magnam accusantium dignissimos maiores ipsa accusantium quidem.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (441, 111, 1, 'Alternativa 1 para a questão 111', FALSE, 'Justificativa para a alternativa 1 da questão 111') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (442, 111, 2, 'Alternativa 2 para a questão 111', FALSE, 'Justificativa para a alternativa 2 da questão 111') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (443, 111, 3, 'Alternativa 3 para a questão 111', TRUE, 'Justificativa para a alternativa 3 da questão 111') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (444, 111, 4, 'Alternativa 4 para a questão 111', FALSE, 'Justificativa para a alternativa 4 da questão 111') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (112, 'Biologia: Expedita dicta ullam consectetur esse facere cumque.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (445, 112, 1, 'Alternativa 1 para a questão 112', FALSE, 'Justificativa para a alternativa 1 da questão 112') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (446, 112, 2, 'Alternativa 2 para a questão 112', TRUE, 'Justificativa para a alternativa 2 da questão 112') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (447, 112, 3, 'Alternativa 3 para a questão 112', FALSE, 'Justificativa para a alternativa 3 da questão 112') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (448, 112, 4, 'Alternativa 4 para a questão 112', FALSE, 'Justificativa para a alternativa 4 da questão 112') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (113, 'Biologia: Dolores laboriosam perferendis reprehenderit.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (449, 113, 1, 'Alternativa 1 para a questão 113', FALSE, 'Justificativa para a alternativa 1 da questão 113') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (450, 113, 2, 'Alternativa 2 para a questão 113', TRUE, 'Justificativa para a alternativa 2 da questão 113') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (451, 113, 3, 'Alternativa 3 para a questão 113', FALSE, 'Justificativa para a alternativa 3 da questão 113') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (452, 113, 4, 'Alternativa 4 para a questão 113', FALSE, 'Justificativa para a alternativa 4 da questão 113') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (114, 'Biologia: Adipisci reiciendis corporis rem.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (453, 114, 1, 'Alternativa 1 para a questão 114', FALSE, 'Justificativa para a alternativa 1 da questão 114') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (454, 114, 2, 'Alternativa 2 para a questão 114', FALSE, 'Justificativa para a alternativa 2 da questão 114') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (455, 114, 3, 'Alternativa 3 para a questão 114', FALSE, 'Justificativa para a alternativa 3 da questão 114') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (456, 114, 4, 'Alternativa 4 para a questão 114', TRUE, 'Justificativa para a alternativa 4 da questão 114') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (115, 'Biologia: Voluptas inventore maxime magni excepturi sint.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (457, 115, 1, 'Alternativa 1 para a questão 115', FALSE, 'Justificativa para a alternativa 1 da questão 115') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (458, 115, 2, 'Alternativa 2 para a questão 115', FALSE, 'Justificativa para a alternativa 2 da questão 115') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (459, 115, 3, 'Alternativa 3 para a questão 115', FALSE, 'Justificativa para a alternativa 3 da questão 115') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (460, 115, 4, 'Alternativa 4 para a questão 115', TRUE, 'Justificativa para a alternativa 4 da questão 115') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (23, 111) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (23, 112) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (23, 113) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (23, 114) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (23, 115) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 24 - Quiz de Biologia #4
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (24, 'Quiz de Biologia #4', 'Questões introdutórias de biologia.', 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (116, 'Biologia: Fugit aperiam recusandae possimus odio fugiat numquam.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (461, 116, 1, 'Alternativa 1 para a questão 116', FALSE, 'Justificativa para a alternativa 1 da questão 116') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (462, 116, 2, 'Alternativa 2 para a questão 116', TRUE, 'Justificativa para a alternativa 2 da questão 116') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (463, 116, 3, 'Alternativa 3 para a questão 116', FALSE, 'Justificativa para a alternativa 3 da questão 116') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (464, 116, 4, 'Alternativa 4 para a questão 116', FALSE, 'Justificativa para a alternativa 4 da questão 116') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (117, 'Biologia: Cum odit natus quia reprehenderit in magni debitis.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (465, 117, 1, 'Alternativa 1 para a questão 117', FALSE, 'Justificativa para a alternativa 1 da questão 117') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (466, 117, 2, 'Alternativa 2 para a questão 117', TRUE, 'Justificativa para a alternativa 2 da questão 117') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (467, 117, 3, 'Alternativa 3 para a questão 117', FALSE, 'Justificativa para a alternativa 3 da questão 117') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (468, 117, 4, 'Alternativa 4 para a questão 117', FALSE, 'Justificativa para a alternativa 4 da questão 117') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (118, 'Biologia: Laborum facilis fugit nisi dolor ut praesentium non.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (469, 118, 1, 'Alternativa 1 para a questão 118', FALSE, 'Justificativa para a alternativa 1 da questão 118') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (470, 118, 2, 'Alternativa 2 para a questão 118', FALSE, 'Justificativa para a alternativa 2 da questão 118') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (471, 118, 3, 'Alternativa 3 para a questão 118', TRUE, 'Justificativa para a alternativa 3 da questão 118') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (472, 118, 4, 'Alternativa 4 para a questão 118', FALSE, 'Justificativa para a alternativa 4 da questão 118') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (119, 'Biologia: Suscipit laudantium qui asperiores repellat rem.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (473, 119, 1, 'Alternativa 1 para a questão 119', FALSE, 'Justificativa para a alternativa 1 da questão 119') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (474, 119, 2, 'Alternativa 2 para a questão 119', FALSE, 'Justificativa para a alternativa 2 da questão 119') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (475, 119, 3, 'Alternativa 3 para a questão 119', FALSE, 'Justificativa para a alternativa 3 da questão 119') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (476, 119, 4, 'Alternativa 4 para a questão 119', TRUE, 'Justificativa para a alternativa 4 da questão 119') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (120, 'Biologia: Nobis dolore non reiciendis.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (477, 120, 1, 'Alternativa 1 para a questão 120', FALSE, 'Justificativa para a alternativa 1 da questão 120') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (478, 120, 2, 'Alternativa 2 para a questão 120', FALSE, 'Justificativa para a alternativa 2 da questão 120') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (479, 120, 3, 'Alternativa 3 para a questão 120', TRUE, 'Justificativa para a alternativa 3 da questão 120') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (480, 120, 4, 'Alternativa 4 para a questão 120', FALSE, 'Justificativa para a alternativa 4 da questão 120') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (24, 116) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (24, 117) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (24, 118) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (24, 119) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (24, 120) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 25 - Quiz de Biologia #5
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (25, 'Quiz de Biologia #5', 'Questões introdutórias de biologia.', 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (121, 'Biologia: Iure perferendis amet cumque quia ratione quos.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (481, 121, 1, 'Alternativa 1 para a questão 121', FALSE, 'Justificativa para a alternativa 1 da questão 121') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (482, 121, 2, 'Alternativa 2 para a questão 121', FALSE, 'Justificativa para a alternativa 2 da questão 121') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (483, 121, 3, 'Alternativa 3 para a questão 121', FALSE, 'Justificativa para a alternativa 3 da questão 121') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (484, 121, 4, 'Alternativa 4 para a questão 121', TRUE, 'Justificativa para a alternativa 4 da questão 121') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (122, 'Biologia: Facilis aspernatur neque eligendi earum excepturi.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (485, 122, 1, 'Alternativa 1 para a questão 122', TRUE, 'Justificativa para a alternativa 1 da questão 122') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (486, 122, 2, 'Alternativa 2 para a questão 122', FALSE, 'Justificativa para a alternativa 2 da questão 122') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (487, 122, 3, 'Alternativa 3 para a questão 122', FALSE, 'Justificativa para a alternativa 3 da questão 122') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (488, 122, 4, 'Alternativa 4 para a questão 122', FALSE, 'Justificativa para a alternativa 4 da questão 122') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (123, 'Biologia: Tempore deleniti neque iste recusandae explicabo.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (489, 123, 1, 'Alternativa 1 para a questão 123', FALSE, 'Justificativa para a alternativa 1 da questão 123') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (490, 123, 2, 'Alternativa 2 para a questão 123', FALSE, 'Justificativa para a alternativa 2 da questão 123') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (491, 123, 3, 'Alternativa 3 para a questão 123', TRUE, 'Justificativa para a alternativa 3 da questão 123') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (492, 123, 4, 'Alternativa 4 para a questão 123', FALSE, 'Justificativa para a alternativa 4 da questão 123') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (124, 'Biologia: Quis esse enim molestias similique voluptatum velit amet.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (493, 124, 1, 'Alternativa 1 para a questão 124', FALSE, 'Justificativa para a alternativa 1 da questão 124') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (494, 124, 2, 'Alternativa 2 para a questão 124', FALSE, 'Justificativa para a alternativa 2 da questão 124') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (495, 124, 3, 'Alternativa 3 para a questão 124', FALSE, 'Justificativa para a alternativa 3 da questão 124') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (496, 124, 4, 'Alternativa 4 para a questão 124', TRUE, 'Justificativa para a alternativa 4 da questão 124') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (125, 'Biologia: Voluptatem deserunt ducimus qui atque.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (497, 125, 1, 'Alternativa 1 para a questão 125', FALSE, 'Justificativa para a alternativa 1 da questão 125') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (498, 125, 2, 'Alternativa 2 para a questão 125', TRUE, 'Justificativa para a alternativa 2 da questão 125') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (499, 125, 3, 'Alternativa 3 para a questão 125', FALSE, 'Justificativa para a alternativa 3 da questão 125') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (500, 125, 4, 'Alternativa 4 para a questão 125', FALSE, 'Justificativa para a alternativa 4 da questão 125') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (25, 121) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (25, 122) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (25, 123) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (25, 124) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (25, 125) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 26 - Quiz de Biologia #6
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (26, 'Quiz de Biologia #6', 'Questões introdutórias de biologia.', 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (126, 'Biologia: Optio facilis repudiandae ad.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (501, 126, 1, 'Alternativa 1 para a questão 126', FALSE, 'Justificativa para a alternativa 1 da questão 126') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (502, 126, 2, 'Alternativa 2 para a questão 126', FALSE, 'Justificativa para a alternativa 2 da questão 126') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (503, 126, 3, 'Alternativa 3 para a questão 126', TRUE, 'Justificativa para a alternativa 3 da questão 126') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (504, 126, 4, 'Alternativa 4 para a questão 126', FALSE, 'Justificativa para a alternativa 4 da questão 126') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (127, 'Biologia: Mollitia accusamus necessitatibus debitis dolor libero distinctio incidunt.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (505, 127, 1, 'Alternativa 1 para a questão 127', FALSE, 'Justificativa para a alternativa 1 da questão 127') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (506, 127, 2, 'Alternativa 2 para a questão 127', TRUE, 'Justificativa para a alternativa 2 da questão 127') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (507, 127, 3, 'Alternativa 3 para a questão 127', FALSE, 'Justificativa para a alternativa 3 da questão 127') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (508, 127, 4, 'Alternativa 4 para a questão 127', FALSE, 'Justificativa para a alternativa 4 da questão 127') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (128, 'Biologia: Porro necessitatibus illum assumenda in.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (509, 128, 1, 'Alternativa 1 para a questão 128', FALSE, 'Justificativa para a alternativa 1 da questão 128') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (510, 128, 2, 'Alternativa 2 para a questão 128', TRUE, 'Justificativa para a alternativa 2 da questão 128') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (511, 128, 3, 'Alternativa 3 para a questão 128', FALSE, 'Justificativa para a alternativa 3 da questão 128') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (512, 128, 4, 'Alternativa 4 para a questão 128', FALSE, 'Justificativa para a alternativa 4 da questão 128') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (129, 'Biologia: Quaerat similique modi recusandae.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (513, 129, 1, 'Alternativa 1 para a questão 129', FALSE, 'Justificativa para a alternativa 1 da questão 129') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (514, 129, 2, 'Alternativa 2 para a questão 129', FALSE, 'Justificativa para a alternativa 2 da questão 129') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (515, 129, 3, 'Alternativa 3 para a questão 129', FALSE, 'Justificativa para a alternativa 3 da questão 129') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (516, 129, 4, 'Alternativa 4 para a questão 129', TRUE, 'Justificativa para a alternativa 4 da questão 129') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (130, 'Biologia: Reprehenderit ratione libero assumenda nulla ipsum.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (517, 130, 1, 'Alternativa 1 para a questão 130', FALSE, 'Justificativa para a alternativa 1 da questão 130') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (518, 130, 2, 'Alternativa 2 para a questão 130', FALSE, 'Justificativa para a alternativa 2 da questão 130') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (519, 130, 3, 'Alternativa 3 para a questão 130', FALSE, 'Justificativa para a alternativa 3 da questão 130') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (520, 130, 4, 'Alternativa 4 para a questão 130', TRUE, 'Justificativa para a alternativa 4 da questão 130') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (26, 126) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (26, 127) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (26, 128) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (26, 129) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (26, 130) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 27 - Quiz de Biologia #7
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (27, 'Quiz de Biologia #7', 'Questões introdutórias de biologia.', 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (131, 'Biologia: Delectus beatae eum neque.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (521, 131, 1, 'Alternativa 1 para a questão 131', FALSE, 'Justificativa para a alternativa 1 da questão 131') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (522, 131, 2, 'Alternativa 2 para a questão 131', FALSE, 'Justificativa para a alternativa 2 da questão 131') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (523, 131, 3, 'Alternativa 3 para a questão 131', TRUE, 'Justificativa para a alternativa 3 da questão 131') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (524, 131, 4, 'Alternativa 4 para a questão 131', FALSE, 'Justificativa para a alternativa 4 da questão 131') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (132, 'Biologia: Fuga doloremque recusandae reprehenderit ipsum suscipit atque eos.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (525, 132, 1, 'Alternativa 1 para a questão 132', FALSE, 'Justificativa para a alternativa 1 da questão 132') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (526, 132, 2, 'Alternativa 2 para a questão 132', TRUE, 'Justificativa para a alternativa 2 da questão 132') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (527, 132, 3, 'Alternativa 3 para a questão 132', FALSE, 'Justificativa para a alternativa 3 da questão 132') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (528, 132, 4, 'Alternativa 4 para a questão 132', FALSE, 'Justificativa para a alternativa 4 da questão 132') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (133, 'Biologia: Est quasi optio.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (529, 133, 1, 'Alternativa 1 para a questão 133', FALSE, 'Justificativa para a alternativa 1 da questão 133') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (530, 133, 2, 'Alternativa 2 para a questão 133', TRUE, 'Justificativa para a alternativa 2 da questão 133') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (531, 133, 3, 'Alternativa 3 para a questão 133', FALSE, 'Justificativa para a alternativa 3 da questão 133') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (532, 133, 4, 'Alternativa 4 para a questão 133', FALSE, 'Justificativa para a alternativa 4 da questão 133') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (134, 'Biologia: Dolor non quod eum.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (533, 134, 1, 'Alternativa 1 para a questão 134', TRUE, 'Justificativa para a alternativa 1 da questão 134') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (534, 134, 2, 'Alternativa 2 para a questão 134', FALSE, 'Justificativa para a alternativa 2 da questão 134') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (535, 134, 3, 'Alternativa 3 para a questão 134', FALSE, 'Justificativa para a alternativa 3 da questão 134') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (536, 134, 4, 'Alternativa 4 para a questão 134', FALSE, 'Justificativa para a alternativa 4 da questão 134') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (135, 'Biologia: Illo est necessitatibus sed debitis error.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (537, 135, 1, 'Alternativa 1 para a questão 135', TRUE, 'Justificativa para a alternativa 1 da questão 135') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (538, 135, 2, 'Alternativa 2 para a questão 135', FALSE, 'Justificativa para a alternativa 2 da questão 135') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (539, 135, 3, 'Alternativa 3 para a questão 135', FALSE, 'Justificativa para a alternativa 3 da questão 135') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (540, 135, 4, 'Alternativa 4 para a questão 135', FALSE, 'Justificativa para a alternativa 4 da questão 135') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (27, 131) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (27, 132) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (27, 133) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (27, 134) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (27, 135) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 28 - Quiz de Biologia #8
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (28, 'Quiz de Biologia #8', 'Questões introdutórias de biologia.', 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (136, 'Biologia: Inventore adipisci unde numquam nulla.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (541, 136, 1, 'Alternativa 1 para a questão 136', FALSE, 'Justificativa para a alternativa 1 da questão 136') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (542, 136, 2, 'Alternativa 2 para a questão 136', FALSE, 'Justificativa para a alternativa 2 da questão 136') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (543, 136, 3, 'Alternativa 3 para a questão 136', TRUE, 'Justificativa para a alternativa 3 da questão 136') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (544, 136, 4, 'Alternativa 4 para a questão 136', FALSE, 'Justificativa para a alternativa 4 da questão 136') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (137, 'Biologia: Facilis ipsam error commodi velit.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (545, 137, 1, 'Alternativa 1 para a questão 137', TRUE, 'Justificativa para a alternativa 1 da questão 137') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (546, 137, 2, 'Alternativa 2 para a questão 137', FALSE, 'Justificativa para a alternativa 2 da questão 137') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (547, 137, 3, 'Alternativa 3 para a questão 137', FALSE, 'Justificativa para a alternativa 3 da questão 137') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (548, 137, 4, 'Alternativa 4 para a questão 137', FALSE, 'Justificativa para a alternativa 4 da questão 137') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (138, 'Biologia: Sed placeat error dicta hic praesentium unde quisquam.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (549, 138, 1, 'Alternativa 1 para a questão 138', FALSE, 'Justificativa para a alternativa 1 da questão 138') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (550, 138, 2, 'Alternativa 2 para a questão 138', FALSE, 'Justificativa para a alternativa 2 da questão 138') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (551, 138, 3, 'Alternativa 3 para a questão 138', TRUE, 'Justificativa para a alternativa 3 da questão 138') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (552, 138, 4, 'Alternativa 4 para a questão 138', FALSE, 'Justificativa para a alternativa 4 da questão 138') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (139, 'Biologia: Cupiditate dolor fuga ab at officia labore.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (553, 139, 1, 'Alternativa 1 para a questão 139', TRUE, 'Justificativa para a alternativa 1 da questão 139') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (554, 139, 2, 'Alternativa 2 para a questão 139', FALSE, 'Justificativa para a alternativa 2 da questão 139') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (555, 139, 3, 'Alternativa 3 para a questão 139', FALSE, 'Justificativa para a alternativa 3 da questão 139') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (556, 139, 4, 'Alternativa 4 para a questão 139', FALSE, 'Justificativa para a alternativa 4 da questão 139') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (140, 'Biologia: Culpa eveniet neque odio.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (557, 140, 1, 'Alternativa 1 para a questão 140', FALSE, 'Justificativa para a alternativa 1 da questão 140') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (558, 140, 2, 'Alternativa 2 para a questão 140', TRUE, 'Justificativa para a alternativa 2 da questão 140') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (559, 140, 3, 'Alternativa 3 para a questão 140', FALSE, 'Justificativa para a alternativa 3 da questão 140') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (560, 140, 4, 'Alternativa 4 para a questão 140', FALSE, 'Justificativa para a alternativa 4 da questão 140') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (28, 136) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (28, 137) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (28, 138) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (28, 139) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (28, 140) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 29 - Quiz de Biologia #9
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (29, 'Quiz de Biologia #9', 'Questões introdutórias de biologia.', 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (141, 'Biologia: Tempora voluptates nihil omnis minus voluptatibus iure.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (561, 141, 1, 'Alternativa 1 para a questão 141', FALSE, 'Justificativa para a alternativa 1 da questão 141') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (562, 141, 2, 'Alternativa 2 para a questão 141', FALSE, 'Justificativa para a alternativa 2 da questão 141') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (563, 141, 3, 'Alternativa 3 para a questão 141', TRUE, 'Justificativa para a alternativa 3 da questão 141') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (564, 141, 4, 'Alternativa 4 para a questão 141', FALSE, 'Justificativa para a alternativa 4 da questão 141') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (142, 'Biologia: Totam eius quae doloremque amet sit quasi.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (565, 142, 1, 'Alternativa 1 para a questão 142', FALSE, 'Justificativa para a alternativa 1 da questão 142') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (566, 142, 2, 'Alternativa 2 para a questão 142', TRUE, 'Justificativa para a alternativa 2 da questão 142') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (567, 142, 3, 'Alternativa 3 para a questão 142', FALSE, 'Justificativa para a alternativa 3 da questão 142') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (568, 142, 4, 'Alternativa 4 para a questão 142', FALSE, 'Justificativa para a alternativa 4 da questão 142') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (143, 'Biologia: Veniam quaerat officia.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (569, 143, 1, 'Alternativa 1 para a questão 143', FALSE, 'Justificativa para a alternativa 1 da questão 143') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (570, 143, 2, 'Alternativa 2 para a questão 143', FALSE, 'Justificativa para a alternativa 2 da questão 143') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (571, 143, 3, 'Alternativa 3 para a questão 143', TRUE, 'Justificativa para a alternativa 3 da questão 143') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (572, 143, 4, 'Alternativa 4 para a questão 143', FALSE, 'Justificativa para a alternativa 4 da questão 143') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (144, 'Biologia: Modi itaque sed.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (573, 144, 1, 'Alternativa 1 para a questão 144', FALSE, 'Justificativa para a alternativa 1 da questão 144') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (574, 144, 2, 'Alternativa 2 para a questão 144', TRUE, 'Justificativa para a alternativa 2 da questão 144') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (575, 144, 3, 'Alternativa 3 para a questão 144', FALSE, 'Justificativa para a alternativa 3 da questão 144') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (576, 144, 4, 'Alternativa 4 para a questão 144', FALSE, 'Justificativa para a alternativa 4 da questão 144') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (145, 'Biologia: Saepe sapiente quae.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (577, 145, 1, 'Alternativa 1 para a questão 145', TRUE, 'Justificativa para a alternativa 1 da questão 145') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (578, 145, 2, 'Alternativa 2 para a questão 145', FALSE, 'Justificativa para a alternativa 2 da questão 145') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (579, 145, 3, 'Alternativa 3 para a questão 145', FALSE, 'Justificativa para a alternativa 3 da questão 145') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (580, 145, 4, 'Alternativa 4 para a questão 145', FALSE, 'Justificativa para a alternativa 4 da questão 145') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (29, 141) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (29, 142) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (29, 143) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (29, 144) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (29, 145) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 30 - Quiz de Biologia #10
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (30, 'Quiz de Biologia #10', 'Questões introdutórias de biologia.', 3, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (146, 'Biologia: Nemo nostrum laboriosam quisquam provident tenetur iure.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (581, 146, 1, 'Alternativa 1 para a questão 146', TRUE, 'Justificativa para a alternativa 1 da questão 146') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (582, 146, 2, 'Alternativa 2 para a questão 146', FALSE, 'Justificativa para a alternativa 2 da questão 146') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (583, 146, 3, 'Alternativa 3 para a questão 146', FALSE, 'Justificativa para a alternativa 3 da questão 146') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (584, 146, 4, 'Alternativa 4 para a questão 146', FALSE, 'Justificativa para a alternativa 4 da questão 146') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (147, 'Biologia: Nulla ea libero ut molestiae.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (585, 147, 1, 'Alternativa 1 para a questão 147', FALSE, 'Justificativa para a alternativa 1 da questão 147') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (586, 147, 2, 'Alternativa 2 para a questão 147', TRUE, 'Justificativa para a alternativa 2 da questão 147') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (587, 147, 3, 'Alternativa 3 para a questão 147', FALSE, 'Justificativa para a alternativa 3 da questão 147') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (588, 147, 4, 'Alternativa 4 para a questão 147', FALSE, 'Justificativa para a alternativa 4 da questão 147') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (148, 'Biologia: Dolorum repellat officiis necessitatibus eius doloribus aut.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (589, 148, 1, 'Alternativa 1 para a questão 148', TRUE, 'Justificativa para a alternativa 1 da questão 148') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (590, 148, 2, 'Alternativa 2 para a questão 148', FALSE, 'Justificativa para a alternativa 2 da questão 148') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (591, 148, 3, 'Alternativa 3 para a questão 148', FALSE, 'Justificativa para a alternativa 3 da questão 148') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (592, 148, 4, 'Alternativa 4 para a questão 148', FALSE, 'Justificativa para a alternativa 4 da questão 148') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (149, 'Biologia: Reiciendis accusamus incidunt aspernatur unde natus nobis.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (593, 149, 1, 'Alternativa 1 para a questão 149', TRUE, 'Justificativa para a alternativa 1 da questão 149') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (594, 149, 2, 'Alternativa 2 para a questão 149', FALSE, 'Justificativa para a alternativa 2 da questão 149') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (595, 149, 3, 'Alternativa 3 para a questão 149', FALSE, 'Justificativa para a alternativa 3 da questão 149') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (596, 149, 4, 'Alternativa 4 para a questão 149', FALSE, 'Justificativa para a alternativa 4 da questão 149') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (150, 'Biologia: Saepe eveniet architecto ipsam neque quae.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (597, 150, 1, 'Alternativa 1 para a questão 150', FALSE, 'Justificativa para a alternativa 1 da questão 150') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (598, 150, 2, 'Alternativa 2 para a questão 150', FALSE, 'Justificativa para a alternativa 2 da questão 150') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (599, 150, 3, 'Alternativa 3 para a questão 150', FALSE, 'Justificativa para a alternativa 3 da questão 150') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (600, 150, 4, 'Alternativa 4 para a questão 150', TRUE, 'Justificativa para a alternativa 4 da questão 150') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (30, 146) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (30, 147) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (30, 148) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (30, 149) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (30, 150) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 31 - Quiz de Química #1
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (31, 'Quiz de Química #1', 'Questões introdutórias de química.', 3, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (151, 'Química: Atque nihil consequatur impedit nostrum expedita vel.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (601, 151, 1, 'Alternativa 1 para a questão 151', FALSE, 'Justificativa para a alternativa 1 da questão 151') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (602, 151, 2, 'Alternativa 2 para a questão 151', FALSE, 'Justificativa para a alternativa 2 da questão 151') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (603, 151, 3, 'Alternativa 3 para a questão 151', TRUE, 'Justificativa para a alternativa 3 da questão 151') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (604, 151, 4, 'Alternativa 4 para a questão 151', FALSE, 'Justificativa para a alternativa 4 da questão 151') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (152, 'Química: Dolorem quae alias dicta earum necessitatibus quod tempora.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (605, 152, 1, 'Alternativa 1 para a questão 152', TRUE, 'Justificativa para a alternativa 1 da questão 152') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (606, 152, 2, 'Alternativa 2 para a questão 152', FALSE, 'Justificativa para a alternativa 2 da questão 152') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (607, 152, 3, 'Alternativa 3 para a questão 152', FALSE, 'Justificativa para a alternativa 3 da questão 152') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (608, 152, 4, 'Alternativa 4 para a questão 152', FALSE, 'Justificativa para a alternativa 4 da questão 152') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (153, 'Química: Veniam quis minima consequuntur.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (609, 153, 1, 'Alternativa 1 para a questão 153', FALSE, 'Justificativa para a alternativa 1 da questão 153') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (610, 153, 2, 'Alternativa 2 para a questão 153', FALSE, 'Justificativa para a alternativa 2 da questão 153') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (611, 153, 3, 'Alternativa 3 para a questão 153', FALSE, 'Justificativa para a alternativa 3 da questão 153') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (612, 153, 4, 'Alternativa 4 para a questão 153', TRUE, 'Justificativa para a alternativa 4 da questão 153') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (154, 'Química: Repellendus ea magnam nisi cumque.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (613, 154, 1, 'Alternativa 1 para a questão 154', FALSE, 'Justificativa para a alternativa 1 da questão 154') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (614, 154, 2, 'Alternativa 2 para a questão 154', FALSE, 'Justificativa para a alternativa 2 da questão 154') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (615, 154, 3, 'Alternativa 3 para a questão 154', FALSE, 'Justificativa para a alternativa 3 da questão 154') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (616, 154, 4, 'Alternativa 4 para a questão 154', TRUE, 'Justificativa para a alternativa 4 da questão 154') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (155, 'Química: Omnis quod perferendis dolores nobis hic.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (617, 155, 1, 'Alternativa 1 para a questão 155', FALSE, 'Justificativa para a alternativa 1 da questão 155') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (618, 155, 2, 'Alternativa 2 para a questão 155', FALSE, 'Justificativa para a alternativa 2 da questão 155') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (619, 155, 3, 'Alternativa 3 para a questão 155', FALSE, 'Justificativa para a alternativa 3 da questão 155') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (620, 155, 4, 'Alternativa 4 para a questão 155', TRUE, 'Justificativa para a alternativa 4 da questão 155') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (31, 151) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (31, 152) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (31, 153) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (31, 154) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (31, 155) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 32 - Quiz de Química #2
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (32, 'Quiz de Química #2', 'Questões introdutórias de química.', 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (156, 'Química: Sunt adipisci recusandae accusantium consequuntur dolores.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (621, 156, 1, 'Alternativa 1 para a questão 156', FALSE, 'Justificativa para a alternativa 1 da questão 156') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (622, 156, 2, 'Alternativa 2 para a questão 156', TRUE, 'Justificativa para a alternativa 2 da questão 156') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (623, 156, 3, 'Alternativa 3 para a questão 156', FALSE, 'Justificativa para a alternativa 3 da questão 156') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (624, 156, 4, 'Alternativa 4 para a questão 156', FALSE, 'Justificativa para a alternativa 4 da questão 156') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (157, 'Química: Vitae excepturi non doloremque quisquam.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (625, 157, 1, 'Alternativa 1 para a questão 157', TRUE, 'Justificativa para a alternativa 1 da questão 157') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (626, 157, 2, 'Alternativa 2 para a questão 157', FALSE, 'Justificativa para a alternativa 2 da questão 157') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (627, 157, 3, 'Alternativa 3 para a questão 157', FALSE, 'Justificativa para a alternativa 3 da questão 157') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (628, 157, 4, 'Alternativa 4 para a questão 157', FALSE, 'Justificativa para a alternativa 4 da questão 157') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (158, 'Química: Saepe repudiandae dolorem minima magnam.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (629, 158, 1, 'Alternativa 1 para a questão 158', FALSE, 'Justificativa para a alternativa 1 da questão 158') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (630, 158, 2, 'Alternativa 2 para a questão 158', FALSE, 'Justificativa para a alternativa 2 da questão 158') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (631, 158, 3, 'Alternativa 3 para a questão 158', TRUE, 'Justificativa para a alternativa 3 da questão 158') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (632, 158, 4, 'Alternativa 4 para a questão 158', FALSE, 'Justificativa para a alternativa 4 da questão 158') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (159, 'Química: Tenetur corrupti consequatur.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (633, 159, 1, 'Alternativa 1 para a questão 159', FALSE, 'Justificativa para a alternativa 1 da questão 159') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (634, 159, 2, 'Alternativa 2 para a questão 159', FALSE, 'Justificativa para a alternativa 2 da questão 159') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (635, 159, 3, 'Alternativa 3 para a questão 159', FALSE, 'Justificativa para a alternativa 3 da questão 159') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (636, 159, 4, 'Alternativa 4 para a questão 159', TRUE, 'Justificativa para a alternativa 4 da questão 159') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (160, 'Química: Porro suscipit culpa deserunt rerum asperiores.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (637, 160, 1, 'Alternativa 1 para a questão 160', FALSE, 'Justificativa para a alternativa 1 da questão 160') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (638, 160, 2, 'Alternativa 2 para a questão 160', FALSE, 'Justificativa para a alternativa 2 da questão 160') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (639, 160, 3, 'Alternativa 3 para a questão 160', TRUE, 'Justificativa para a alternativa 3 da questão 160') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (640, 160, 4, 'Alternativa 4 para a questão 160', FALSE, 'Justificativa para a alternativa 4 da questão 160') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (32, 156) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (32, 157) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (32, 158) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (32, 159) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (32, 160) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 33 - Quiz de Química #3
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (33, 'Quiz de Química #3', 'Questões introdutórias de química.', 3, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (161, 'Química: Corporis est ipsa in.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (641, 161, 1, 'Alternativa 1 para a questão 161', TRUE, 'Justificativa para a alternativa 1 da questão 161') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (642, 161, 2, 'Alternativa 2 para a questão 161', FALSE, 'Justificativa para a alternativa 2 da questão 161') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (643, 161, 3, 'Alternativa 3 para a questão 161', FALSE, 'Justificativa para a alternativa 3 da questão 161') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (644, 161, 4, 'Alternativa 4 para a questão 161', FALSE, 'Justificativa para a alternativa 4 da questão 161') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (162, 'Química: Veritatis inventore deleniti perspiciatis aperiam molestiae.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (645, 162, 1, 'Alternativa 1 para a questão 162', FALSE, 'Justificativa para a alternativa 1 da questão 162') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (646, 162, 2, 'Alternativa 2 para a questão 162', TRUE, 'Justificativa para a alternativa 2 da questão 162') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (647, 162, 3, 'Alternativa 3 para a questão 162', FALSE, 'Justificativa para a alternativa 3 da questão 162') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (648, 162, 4, 'Alternativa 4 para a questão 162', FALSE, 'Justificativa para a alternativa 4 da questão 162') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (163, 'Química: Non molestiae culpa quaerat est ratione.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (649, 163, 1, 'Alternativa 1 para a questão 163', TRUE, 'Justificativa para a alternativa 1 da questão 163') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (650, 163, 2, 'Alternativa 2 para a questão 163', FALSE, 'Justificativa para a alternativa 2 da questão 163') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (651, 163, 3, 'Alternativa 3 para a questão 163', FALSE, 'Justificativa para a alternativa 3 da questão 163') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (652, 163, 4, 'Alternativa 4 para a questão 163', FALSE, 'Justificativa para a alternativa 4 da questão 163') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (164, 'Química: Non architecto explicabo voluptatibus praesentium nisi totam.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (653, 164, 1, 'Alternativa 1 para a questão 164', FALSE, 'Justificativa para a alternativa 1 da questão 164') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (654, 164, 2, 'Alternativa 2 para a questão 164', TRUE, 'Justificativa para a alternativa 2 da questão 164') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (655, 164, 3, 'Alternativa 3 para a questão 164', FALSE, 'Justificativa para a alternativa 3 da questão 164') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (656, 164, 4, 'Alternativa 4 para a questão 164', FALSE, 'Justificativa para a alternativa 4 da questão 164') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (165, 'Química: Tempora occaecati corporis quasi quis reiciendis explicabo.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (657, 165, 1, 'Alternativa 1 para a questão 165', TRUE, 'Justificativa para a alternativa 1 da questão 165') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (658, 165, 2, 'Alternativa 2 para a questão 165', FALSE, 'Justificativa para a alternativa 2 da questão 165') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (659, 165, 3, 'Alternativa 3 para a questão 165', FALSE, 'Justificativa para a alternativa 3 da questão 165') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (660, 165, 4, 'Alternativa 4 para a questão 165', FALSE, 'Justificativa para a alternativa 4 da questão 165') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (33, 161) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (33, 162) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (33, 163) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (33, 164) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (33, 165) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 34 - Quiz de Química #4
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (34, 'Quiz de Química #4', 'Questões introdutórias de química.', 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (166, 'Química: Error dolorem non facilis cupiditate delectus nostrum eius.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (661, 166, 1, 'Alternativa 1 para a questão 166', FALSE, 'Justificativa para a alternativa 1 da questão 166') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (662, 166, 2, 'Alternativa 2 para a questão 166', FALSE, 'Justificativa para a alternativa 2 da questão 166') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (663, 166, 3, 'Alternativa 3 para a questão 166', TRUE, 'Justificativa para a alternativa 3 da questão 166') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (664, 166, 4, 'Alternativa 4 para a questão 166', FALSE, 'Justificativa para a alternativa 4 da questão 166') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (167, 'Química: Id necessitatibus quo nostrum ipsum culpa.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (665, 167, 1, 'Alternativa 1 para a questão 167', FALSE, 'Justificativa para a alternativa 1 da questão 167') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (666, 167, 2, 'Alternativa 2 para a questão 167', TRUE, 'Justificativa para a alternativa 2 da questão 167') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (667, 167, 3, 'Alternativa 3 para a questão 167', FALSE, 'Justificativa para a alternativa 3 da questão 167') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (668, 167, 4, 'Alternativa 4 para a questão 167', FALSE, 'Justificativa para a alternativa 4 da questão 167') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (168, 'Química: Quos voluptatum eligendi alias vel.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (669, 168, 1, 'Alternativa 1 para a questão 168', TRUE, 'Justificativa para a alternativa 1 da questão 168') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (670, 168, 2, 'Alternativa 2 para a questão 168', FALSE, 'Justificativa para a alternativa 2 da questão 168') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (671, 168, 3, 'Alternativa 3 para a questão 168', FALSE, 'Justificativa para a alternativa 3 da questão 168') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (672, 168, 4, 'Alternativa 4 para a questão 168', FALSE, 'Justificativa para a alternativa 4 da questão 168') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (169, 'Química: Ut natus nam perspiciatis illo magni sed.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (673, 169, 1, 'Alternativa 1 para a questão 169', FALSE, 'Justificativa para a alternativa 1 da questão 169') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (674, 169, 2, 'Alternativa 2 para a questão 169', FALSE, 'Justificativa para a alternativa 2 da questão 169') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (675, 169, 3, 'Alternativa 3 para a questão 169', TRUE, 'Justificativa para a alternativa 3 da questão 169') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (676, 169, 4, 'Alternativa 4 para a questão 169', FALSE, 'Justificativa para a alternativa 4 da questão 169') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (170, 'Química: Iure doloribus vero.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (677, 170, 1, 'Alternativa 1 para a questão 170', FALSE, 'Justificativa para a alternativa 1 da questão 170') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (678, 170, 2, 'Alternativa 2 para a questão 170', FALSE, 'Justificativa para a alternativa 2 da questão 170') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (679, 170, 3, 'Alternativa 3 para a questão 170', TRUE, 'Justificativa para a alternativa 3 da questão 170') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (680, 170, 4, 'Alternativa 4 para a questão 170', FALSE, 'Justificativa para a alternativa 4 da questão 170') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (34, 166) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (34, 167) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (34, 168) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (34, 169) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (34, 170) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 35 - Quiz de Química #5
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (35, 'Quiz de Química #5', 'Questões introdutórias de química.', 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (171, 'Química: Dicta recusandae explicabo iure soluta debitis ex.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (681, 171, 1, 'Alternativa 1 para a questão 171', FALSE, 'Justificativa para a alternativa 1 da questão 171') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (682, 171, 2, 'Alternativa 2 para a questão 171', FALSE, 'Justificativa para a alternativa 2 da questão 171') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (683, 171, 3, 'Alternativa 3 para a questão 171', TRUE, 'Justificativa para a alternativa 3 da questão 171') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (684, 171, 4, 'Alternativa 4 para a questão 171', FALSE, 'Justificativa para a alternativa 4 da questão 171') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (172, 'Química: Nulla error explicabo quae adipisci nesciunt tenetur porro.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (685, 172, 1, 'Alternativa 1 para a questão 172', FALSE, 'Justificativa para a alternativa 1 da questão 172') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (686, 172, 2, 'Alternativa 2 para a questão 172', TRUE, 'Justificativa para a alternativa 2 da questão 172') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (687, 172, 3, 'Alternativa 3 para a questão 172', FALSE, 'Justificativa para a alternativa 3 da questão 172') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (688, 172, 4, 'Alternativa 4 para a questão 172', FALSE, 'Justificativa para a alternativa 4 da questão 172') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (173, 'Química: Ut quae modi libero nostrum.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (689, 173, 1, 'Alternativa 1 para a questão 173', FALSE, 'Justificativa para a alternativa 1 da questão 173') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (690, 173, 2, 'Alternativa 2 para a questão 173', TRUE, 'Justificativa para a alternativa 2 da questão 173') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (691, 173, 3, 'Alternativa 3 para a questão 173', FALSE, 'Justificativa para a alternativa 3 da questão 173') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (692, 173, 4, 'Alternativa 4 para a questão 173', FALSE, 'Justificativa para a alternativa 4 da questão 173') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (174, 'Química: Et quasi voluptate quo minus consequatur dolore.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (693, 174, 1, 'Alternativa 1 para a questão 174', TRUE, 'Justificativa para a alternativa 1 da questão 174') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (694, 174, 2, 'Alternativa 2 para a questão 174', FALSE, 'Justificativa para a alternativa 2 da questão 174') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (695, 174, 3, 'Alternativa 3 para a questão 174', FALSE, 'Justificativa para a alternativa 3 da questão 174') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (696, 174, 4, 'Alternativa 4 para a questão 174', FALSE, 'Justificativa para a alternativa 4 da questão 174') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (175, 'Química: Consequatur voluptatem libero voluptas fugiat dolores.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (697, 175, 1, 'Alternativa 1 para a questão 175', FALSE, 'Justificativa para a alternativa 1 da questão 175') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (698, 175, 2, 'Alternativa 2 para a questão 175', TRUE, 'Justificativa para a alternativa 2 da questão 175') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (699, 175, 3, 'Alternativa 3 para a questão 175', FALSE, 'Justificativa para a alternativa 3 da questão 175') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (700, 175, 4, 'Alternativa 4 para a questão 175', FALSE, 'Justificativa para a alternativa 4 da questão 175') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (35, 171) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (35, 172) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (35, 173) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (35, 174) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (35, 175) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 36 - Quiz de Química #6
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (36, 'Quiz de Química #6', 'Questões introdutórias de química.', 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (176, 'Química: Tempore explicabo commodi placeat aperiam.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (701, 176, 1, 'Alternativa 1 para a questão 176', FALSE, 'Justificativa para a alternativa 1 da questão 176') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (702, 176, 2, 'Alternativa 2 para a questão 176', FALSE, 'Justificativa para a alternativa 2 da questão 176') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (703, 176, 3, 'Alternativa 3 para a questão 176', TRUE, 'Justificativa para a alternativa 3 da questão 176') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (704, 176, 4, 'Alternativa 4 para a questão 176', FALSE, 'Justificativa para a alternativa 4 da questão 176') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (177, 'Química: Corporis quam repellendus modi cupiditate.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (705, 177, 1, 'Alternativa 1 para a questão 177', FALSE, 'Justificativa para a alternativa 1 da questão 177') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (706, 177, 2, 'Alternativa 2 para a questão 177', FALSE, 'Justificativa para a alternativa 2 da questão 177') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (707, 177, 3, 'Alternativa 3 para a questão 177', FALSE, 'Justificativa para a alternativa 3 da questão 177') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (708, 177, 4, 'Alternativa 4 para a questão 177', TRUE, 'Justificativa para a alternativa 4 da questão 177') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (178, 'Química: Reiciendis odit quam molestiae praesentium provident adipisci.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (709, 178, 1, 'Alternativa 1 para a questão 178', FALSE, 'Justificativa para a alternativa 1 da questão 178') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (710, 178, 2, 'Alternativa 2 para a questão 178', FALSE, 'Justificativa para a alternativa 2 da questão 178') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (711, 178, 3, 'Alternativa 3 para a questão 178', FALSE, 'Justificativa para a alternativa 3 da questão 178') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (712, 178, 4, 'Alternativa 4 para a questão 178', TRUE, 'Justificativa para a alternativa 4 da questão 178') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (179, 'Química: Cupiditate a assumenda culpa amet voluptatum.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (713, 179, 1, 'Alternativa 1 para a questão 179', FALSE, 'Justificativa para a alternativa 1 da questão 179') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (714, 179, 2, 'Alternativa 2 para a questão 179', FALSE, 'Justificativa para a alternativa 2 da questão 179') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (715, 179, 3, 'Alternativa 3 para a questão 179', FALSE, 'Justificativa para a alternativa 3 da questão 179') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (716, 179, 4, 'Alternativa 4 para a questão 179', TRUE, 'Justificativa para a alternativa 4 da questão 179') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (180, 'Química: Repellendus laudantium incidunt.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (717, 180, 1, 'Alternativa 1 para a questão 180', FALSE, 'Justificativa para a alternativa 1 da questão 180') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (718, 180, 2, 'Alternativa 2 para a questão 180', FALSE, 'Justificativa para a alternativa 2 da questão 180') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (719, 180, 3, 'Alternativa 3 para a questão 180', FALSE, 'Justificativa para a alternativa 3 da questão 180') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (720, 180, 4, 'Alternativa 4 para a questão 180', TRUE, 'Justificativa para a alternativa 4 da questão 180') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (36, 176) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (36, 177) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (36, 178) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (36, 179) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (36, 180) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 37 - Quiz de Química #7
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (37, 'Quiz de Química #7', 'Questões introdutórias de química.', 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (181, 'Química: Doloribus necessitatibus deserunt quia velit ab dolore aliquam.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (721, 181, 1, 'Alternativa 1 para a questão 181', FALSE, 'Justificativa para a alternativa 1 da questão 181') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (722, 181, 2, 'Alternativa 2 para a questão 181', TRUE, 'Justificativa para a alternativa 2 da questão 181') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (723, 181, 3, 'Alternativa 3 para a questão 181', FALSE, 'Justificativa para a alternativa 3 da questão 181') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (724, 181, 4, 'Alternativa 4 para a questão 181', FALSE, 'Justificativa para a alternativa 4 da questão 181') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (182, 'Química: Ipsum ullam quam pariatur reiciendis dignissimos nam.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (725, 182, 1, 'Alternativa 1 para a questão 182', FALSE, 'Justificativa para a alternativa 1 da questão 182') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (726, 182, 2, 'Alternativa 2 para a questão 182', FALSE, 'Justificativa para a alternativa 2 da questão 182') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (727, 182, 3, 'Alternativa 3 para a questão 182', TRUE, 'Justificativa para a alternativa 3 da questão 182') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (728, 182, 4, 'Alternativa 4 para a questão 182', FALSE, 'Justificativa para a alternativa 4 da questão 182') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (183, 'Química: Necessitatibus animi repudiandae perspiciatis.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (729, 183, 1, 'Alternativa 1 para a questão 183', FALSE, 'Justificativa para a alternativa 1 da questão 183') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (730, 183, 2, 'Alternativa 2 para a questão 183', TRUE, 'Justificativa para a alternativa 2 da questão 183') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (731, 183, 3, 'Alternativa 3 para a questão 183', FALSE, 'Justificativa para a alternativa 3 da questão 183') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (732, 183, 4, 'Alternativa 4 para a questão 183', FALSE, 'Justificativa para a alternativa 4 da questão 183') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (184, 'Química: Fuga tempore laborum pariatur repellat numquam nostrum.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (733, 184, 1, 'Alternativa 1 para a questão 184', TRUE, 'Justificativa para a alternativa 1 da questão 184') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (734, 184, 2, 'Alternativa 2 para a questão 184', FALSE, 'Justificativa para a alternativa 2 da questão 184') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (735, 184, 3, 'Alternativa 3 para a questão 184', FALSE, 'Justificativa para a alternativa 3 da questão 184') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (736, 184, 4, 'Alternativa 4 para a questão 184', FALSE, 'Justificativa para a alternativa 4 da questão 184') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (185, 'Química: Omnis minima excepturi inventore.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (737, 185, 1, 'Alternativa 1 para a questão 185', TRUE, 'Justificativa para a alternativa 1 da questão 185') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (738, 185, 2, 'Alternativa 2 para a questão 185', FALSE, 'Justificativa para a alternativa 2 da questão 185') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (739, 185, 3, 'Alternativa 3 para a questão 185', FALSE, 'Justificativa para a alternativa 3 da questão 185') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (740, 185, 4, 'Alternativa 4 para a questão 185', FALSE, 'Justificativa para a alternativa 4 da questão 185') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (37, 181) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (37, 182) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (37, 183) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (37, 184) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (37, 185) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 38 - Quiz de Química #8
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (38, 'Quiz de Química #8', 'Questões introdutórias de química.', 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (186, 'Química: Quos perspiciatis libero at.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (741, 186, 1, 'Alternativa 1 para a questão 186', FALSE, 'Justificativa para a alternativa 1 da questão 186') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (742, 186, 2, 'Alternativa 2 para a questão 186', FALSE, 'Justificativa para a alternativa 2 da questão 186') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (743, 186, 3, 'Alternativa 3 para a questão 186', TRUE, 'Justificativa para a alternativa 3 da questão 186') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (744, 186, 4, 'Alternativa 4 para a questão 186', FALSE, 'Justificativa para a alternativa 4 da questão 186') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (187, 'Química: Alias velit fuga perferendis repudiandae eius repudiandae.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (745, 187, 1, 'Alternativa 1 para a questão 187', FALSE, 'Justificativa para a alternativa 1 da questão 187') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (746, 187, 2, 'Alternativa 2 para a questão 187', FALSE, 'Justificativa para a alternativa 2 da questão 187') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (747, 187, 3, 'Alternativa 3 para a questão 187', FALSE, 'Justificativa para a alternativa 3 da questão 187') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (748, 187, 4, 'Alternativa 4 para a questão 187', TRUE, 'Justificativa para a alternativa 4 da questão 187') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (188, 'Química: Iusto incidunt illo sint.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (749, 188, 1, 'Alternativa 1 para a questão 188', FALSE, 'Justificativa para a alternativa 1 da questão 188') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (750, 188, 2, 'Alternativa 2 para a questão 188', TRUE, 'Justificativa para a alternativa 2 da questão 188') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (751, 188, 3, 'Alternativa 3 para a questão 188', FALSE, 'Justificativa para a alternativa 3 da questão 188') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (752, 188, 4, 'Alternativa 4 para a questão 188', FALSE, 'Justificativa para a alternativa 4 da questão 188') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (189, 'Química: Sapiente aperiam pariatur praesentium doloribus praesentium.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (753, 189, 1, 'Alternativa 1 para a questão 189', FALSE, 'Justificativa para a alternativa 1 da questão 189') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (754, 189, 2, 'Alternativa 2 para a questão 189', FALSE, 'Justificativa para a alternativa 2 da questão 189') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (755, 189, 3, 'Alternativa 3 para a questão 189', TRUE, 'Justificativa para a alternativa 3 da questão 189') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (756, 189, 4, 'Alternativa 4 para a questão 189', FALSE, 'Justificativa para a alternativa 4 da questão 189') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (190, 'Química: Ex reprehenderit quod laborum dolorum at vitae.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (757, 190, 1, 'Alternativa 1 para a questão 190', TRUE, 'Justificativa para a alternativa 1 da questão 190') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (758, 190, 2, 'Alternativa 2 para a questão 190', FALSE, 'Justificativa para a alternativa 2 da questão 190') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (759, 190, 3, 'Alternativa 3 para a questão 190', FALSE, 'Justificativa para a alternativa 3 da questão 190') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (760, 190, 4, 'Alternativa 4 para a questão 190', FALSE, 'Justificativa para a alternativa 4 da questão 190') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (38, 186) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (38, 187) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (38, 188) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (38, 189) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (38, 190) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 39 - Quiz de Química #9
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (39, 'Quiz de Química #9', 'Questões introdutórias de química.', 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (191, 'Química: Quod officiis quasi vel.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (761, 191, 1, 'Alternativa 1 para a questão 191', FALSE, 'Justificativa para a alternativa 1 da questão 191') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (762, 191, 2, 'Alternativa 2 para a questão 191', TRUE, 'Justificativa para a alternativa 2 da questão 191') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (763, 191, 3, 'Alternativa 3 para a questão 191', FALSE, 'Justificativa para a alternativa 3 da questão 191') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (764, 191, 4, 'Alternativa 4 para a questão 191', FALSE, 'Justificativa para a alternativa 4 da questão 191') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (192, 'Química: Non amet atque nostrum architecto eaque.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (765, 192, 1, 'Alternativa 1 para a questão 192', TRUE, 'Justificativa para a alternativa 1 da questão 192') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (766, 192, 2, 'Alternativa 2 para a questão 192', FALSE, 'Justificativa para a alternativa 2 da questão 192') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (767, 192, 3, 'Alternativa 3 para a questão 192', FALSE, 'Justificativa para a alternativa 3 da questão 192') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (768, 192, 4, 'Alternativa 4 para a questão 192', FALSE, 'Justificativa para a alternativa 4 da questão 192') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (193, 'Química: Voluptatibus voluptate laborum nemo natus fugiat.?', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (769, 193, 1, 'Alternativa 1 para a questão 193', FALSE, 'Justificativa para a alternativa 1 da questão 193') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (770, 193, 2, 'Alternativa 2 para a questão 193', TRUE, 'Justificativa para a alternativa 2 da questão 193') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (771, 193, 3, 'Alternativa 3 para a questão 193', FALSE, 'Justificativa para a alternativa 3 da questão 193') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (772, 193, 4, 'Alternativa 4 para a questão 193', FALSE, 'Justificativa para a alternativa 4 da questão 193') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (194, 'Química: Omnis tempore laudantium impedit odit natus fugiat quidem.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (773, 194, 1, 'Alternativa 1 para a questão 194', FALSE, 'Justificativa para a alternativa 1 da questão 194') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (774, 194, 2, 'Alternativa 2 para a questão 194', FALSE, 'Justificativa para a alternativa 2 da questão 194') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (775, 194, 3, 'Alternativa 3 para a questão 194', TRUE, 'Justificativa para a alternativa 3 da questão 194') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (776, 194, 4, 'Alternativa 4 para a questão 194', FALSE, 'Justificativa para a alternativa 4 da questão 194') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (195, 'Química: Sequi similique fuga distinctio id.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (777, 195, 1, 'Alternativa 1 para a questão 195', TRUE, 'Justificativa para a alternativa 1 da questão 195') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (778, 195, 2, 'Alternativa 2 para a questão 195', FALSE, 'Justificativa para a alternativa 2 da questão 195') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (779, 195, 3, 'Alternativa 3 para a questão 195', FALSE, 'Justificativa para a alternativa 3 da questão 195') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (780, 195, 4, 'Alternativa 4 para a questão 195', FALSE, 'Justificativa para a alternativa 4 da questão 195') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (39, 191) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (39, 192) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (39, 193) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (39, 194) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (39, 195) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 40 - Quiz de Química #10
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES (40, 'Quiz de Química #10', 'Questões introdutórias de química.', 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (196, 'Química: Unde nostrum aperiam magnam distinctio ducimus ex.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (781, 196, 1, 'Alternativa 1 para a questão 196', FALSE, 'Justificativa para a alternativa 1 da questão 196') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (782, 196, 2, 'Alternativa 2 para a questão 196', TRUE, 'Justificativa para a alternativa 2 da questão 196') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (783, 196, 3, 'Alternativa 3 para a questão 196', FALSE, 'Justificativa para a alternativa 3 da questão 196') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (784, 196, 4, 'Alternativa 4 para a questão 196', FALSE, 'Justificativa para a alternativa 4 da questão 196') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (197, 'Química: Ut laborum ipsa atque eaque alias praesentium.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (785, 197, 1, 'Alternativa 1 para a questão 197', FALSE, 'Justificativa para a alternativa 1 da questão 197') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (786, 197, 2, 'Alternativa 2 para a questão 197', TRUE, 'Justificativa para a alternativa 2 da questão 197') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (787, 197, 3, 'Alternativa 3 para a questão 197', FALSE, 'Justificativa para a alternativa 3 da questão 197') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (788, 197, 4, 'Alternativa 4 para a questão 197', FALSE, 'Justificativa para a alternativa 4 da questão 197') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (198, 'Química: Repudiandae recusandae dolorem sequi et.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (789, 198, 1, 'Alternativa 1 para a questão 198', FALSE, 'Justificativa para a alternativa 1 da questão 198') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (790, 198, 2, 'Alternativa 2 para a questão 198', FALSE, 'Justificativa para a alternativa 2 da questão 198') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (791, 198, 3, 'Alternativa 3 para a questão 198', FALSE, 'Justificativa para a alternativa 3 da questão 198') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (792, 198, 4, 'Alternativa 4 para a questão 198', TRUE, 'Justificativa para a alternativa 4 da questão 198') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (199, 'Química: Doloremque iste incidunt sint quaerat.?', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (793, 199, 1, 'Alternativa 1 para a questão 199', FALSE, 'Justificativa para a alternativa 1 da questão 199') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (794, 199, 2, 'Alternativa 2 para a questão 199', FALSE, 'Justificativa para a alternativa 2 da questão 199') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (795, 199, 3, 'Alternativa 3 para a questão 199', FALSE, 'Justificativa para a alternativa 3 da questão 199') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (796, 199, 4, 'Alternativa 4 para a questão 199', TRUE, 'Justificativa para a alternativa 4 da questão 199') ON CONFLICT (id) DO NOTHING;
INSERT INTO questions (id, body, difficulty) VALUES (200, 'Química: Occaecati nihil impedit quia quod.?', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (797, 200, 1, 'Alternativa 1 para a questão 200', TRUE, 'Justificativa para a alternativa 1 da questão 200') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (798, 200, 2, 'Alternativa 2 para a questão 200', FALSE, 'Justificativa para a alternativa 2 da questão 200') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (799, 200, 3, 'Alternativa 3 para a questão 200', FALSE, 'Justificativa para a alternativa 3 da questão 200') ON CONFLICT (id) DO NOTHING;
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES (800, 200, 4, 'Alternativa 4 para a questão 200', FALSE, 'Justificativa para a alternativa 4 da questão 200') ON CONFLICT (id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (40, 196) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (40, 197) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (40, 198) ON CONFLICT (quiz_id, question_id) DO NOTHING;
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (40, 199) ON CONFLICT (quiz_id, question_id) DO NOTHING;
