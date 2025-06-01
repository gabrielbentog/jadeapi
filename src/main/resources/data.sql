-- Usuários
INSERT INTO users (id, name) VALUES
(1, 'Aluno Teste 1'),
(2, 'Joana Silva')
ON CONFLICT (id) DO NOTHING;

-- Subjects (Matérias)
INSERT INTO subject (id, name) VALUES
(1, 'Java Básico'),
(2, 'Estruturas de Dados em Java'),
(3, 'Spring Framework Essencial')
ON CONFLICT (id) DO NOTHING;

-- Quizzes
-- Quiz 1 sobre Java Básico
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES
(1, 'Conceitos Fundamentais de Java', 'Teste seus conhecimentos sobre os pilares do Java.', 1, 1),
(2, 'Controle de Fluxo e Loops em Java', 'Questões sobre if/else, switch, for, while.', 2, 1)
ON CONFLICT (id) DO NOTHING;

-- Quiz 2 sobre Estruturas de Dados
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES
(3, 'Arrays e Listas em Java', 'Entendendo coleções básicas.', 2, 2)
ON CONFLICT (id) DO NOTHING;

-- Questions
-- Perguntas para o Quiz 1 (Conceitos Fundamentais de Java)
INSERT INTO questions (id, body, difficulty) VALUES
(1, 'Qual destes não é um tipo primitivo em Java?', 1),
(2, 'O que significa JVM?', 1),
(3, 'Qual palavra-chave é usada para herança em Java?', 2)
ON CONFLICT (id) DO NOTHING;

-- Perguntas para o Quiz 2 (Controle de Fluxo e Loops em Java)
INSERT INTO questions (id, body, difficulty) VALUES
(4, 'Qual loop é garantido para executar seu corpo pelo menos uma vez?', 2),
(5, 'A instrução "break" pode ser usada em qual dos seguintes contextos?', 2)
ON CONFLICT (id) DO NOTHING;

-- Perguntas para o Quiz 3 (Arrays e Listas em Java)
INSERT INTO questions (id, body, difficulty) VALUES
(6, 'Qual a principal diferença entre um Array e um ArrayList em Java?', 2),
(7, 'Como se declara um array de inteiros com 5 posições em Java?', 1)
ON CONFLICT (id) DO NOTHING;


-- Alternatives
-- Alternativas para Pergunta 1 (Quiz 1)
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES
(1, 1, 1, 'int', FALSE, 'int é um tipo primitivo para números inteiros.'),
(2, 1, 2, 'boolean', FALSE, 'boolean é um tipo primitivo para valores verdadeiros ou falsos.'),
(3, 1, 3, 'String', TRUE, 'String é uma classe (um objeto), não um tipo primitivo.'),
(4, 1, 4, 'char', FALSE, 'char é um tipo primitivo para caracteres.')
ON CONFLICT (id) DO NOTHING;

-- Alternativas para Pergunta 2 (Quiz 1)
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES
(5, 2, 1, 'Java Virtual Machine', TRUE, 'JVM significa Java Virtual Machine, responsável por executar o bytecode Java.'),
(6, 2, 2, 'Java Very Modern', FALSE, 'Esta não é a definição correta.'),
(7, 2, 3, 'Java Verified Module', FALSE, 'Esta não é a definição correta.')
ON CONFLICT (id) DO NOTHING;

-- Alternativas para Pergunta 3 (Quiz 1)
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES
(8, 3, 1, 'implements', FALSE, '`implements` é usado para implementar interfaces.'),
(9, 3, 2, 'extends', TRUE, '`extends` é a palavra-chave para herança de classes.'),
(10, 3, 3, 'inherits', FALSE, '`inherits` não é uma palavra-chave em Java para herança.'),
(11, 3, 4, 'super', FALSE, '`super` é usado para referenciar membros da superclasse.')
ON CONFLICT (id) DO NOTHING;

-- Alternativas para Pergunta 4 (Quiz 2)
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES
(12, 4, 1, 'for', FALSE, 'O loop `for` pode não executar se a condição inicial for falsa.'),
(13, 4, 2, 'while', FALSE, 'O loop `while` pode não executar se a condição inicial for falsa.'),
(14, 4, 3, 'do-while', TRUE, 'O loop `do-while` executa o corpo e depois verifica a condição.')
ON CONFLICT (id) DO NOTHING;

-- Alternativas para Pergunta 5 (Quiz 2)
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES
(15, 5, 1, 'Apenas em loops `for`', FALSE, '`break` pode ser usado em outros loops e switch.'),
(16, 5, 2, 'Apenas em blocos `switch`', FALSE, '`break` pode ser usado em loops também.'),
(17, 5, 3, 'Em loops (`for`, `while`, `do-while`) e blocos `switch`', TRUE, '`break` é usado para sair de loops e casos de switch.'),
(18, 5, 4, 'Apenas em métodos para retornar um valor', FALSE, '`return` é usado para sair de métodos.')
ON CONFLICT (id) DO NOTHING;

-- Alternativas para Pergunta 6 (Quiz 3)
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES
(19, 6, 1, 'Array pode armazenar tipos primitivos e objetos, ArrayList apenas objetos.', FALSE, 'Ambos podem lidar com objetos (ArrayList usa generics e autoboxing para primitivos). A questão é sobre tamanho.'),
(20, 6, 2, 'Array tem tamanho fixo, ArrayList tem tamanho dinâmico.', TRUE, 'Esta é a principal diferença: ArrayList pode crescer ou encolher.'),
(21, 6, 3, 'Array é mais rápido para inserções no meio da lista.', FALSE, 'ArrayList (baseado em array) é ineficiente para inserções no meio.')
ON CONFLICT (id) DO NOTHING;

-- Alternativas para Pergunta 7 (Quiz 3)
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES
(22, 7, 1, 'int[5] array;', FALSE, 'A sintaxe correta para declaração e inicialização é diferente.'),
(23, 7, 2, 'int array = new int[5];', TRUE, 'Esta é a forma correta de declarar e instanciar um array de 5 inteiros.'),
(24, 7, 3, 'ArrayList<int> array = new ArrayList<int>(5);', FALSE, 'ArrayList não aceita tipos primitivos diretamente nos generics; usaria Integer. E a pergunta é sobre array.'),
(25, 7, 4, 'int array[5] = new int[];', FALSE, 'Sintaxe incorreta para Java.')
ON CONFLICT (id) DO NOTHING;


-- quiz_questions (Relacionamento entre Quizzes e Questions)
-- Quiz 1 (ID 1) com Perguntas 1, 2, 3
INSERT INTO quiz_questions (quiz_id, question_id) VALUES
(1, 1),
(1, 2),
(1, 3)
ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 2 (ID 2) com Perguntas 4, 5
INSERT INTO quiz_questions (quiz_id, question_id) VALUES
(2, 4),
(2, 5)
ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Quiz 3 (ID 3) com Perguntas 6, 7
INSERT INTO quiz_questions (quiz_id, question_id) VALUES
(3, 6),
(3, 7)
ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- Atualizar sequências para evitar conflitos se você inserir sem ID depois
-- A forma exata pode variar um pouco com o dialeto SQL, mas para PostgreSQL:
SELECT setval('users_id_seq', COALESCE((SELECT MAX(id) FROM users), 1));
SELECT setval('subject_id_seq', COALESCE((SELECT MAX(id) FROM subject), 1));
SELECT setval('quizzes_id_seq', COALESCE((SELECT MAX(id) FROM quizzes), 1));
SELECT setval('questions_id_seq', COALESCE((SELECT MAX(id) FROM questions), 1));
SELECT setval('alternatives_id_seq', COALESCE((SELECT MAX(id) FROM alternatives), 1));
-- Não há sequences para quiz_questions, quiz_attempts, user_answers, pois seus IDs são BIGSERIAL e não foram pré-definidos aqui.
-- Se você pré-definir IDs para quiz_attempts e user_answers, adicione setval para eles também.
-- Como quiz_questions não tem um ID próprio mas sim uma PK composta, não precisa de setval.