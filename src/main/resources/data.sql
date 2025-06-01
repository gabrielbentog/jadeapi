-- Usuários
INSERT INTO users (id, name) VALUES
(1, 'Aluno Teste 1'),
(2, 'Joana Silva'),
(3, 'Carlos Estudioso') -- Adicionado para mais testes
ON CONFLICT (id) DO NOTHING;

-- Subjects (Matérias)
INSERT INTO subject (id, name) VALUES
(1, 'Java Básico'),
(2, 'Estruturas de Dados em Java'),
(3, 'Spring Framework Essencial')
ON CONFLICT (id) DO NOTHING;

-- Quizzes
-- Quiz 1 (ID 1) - Java Básico, Dificuldade 1
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES
(1, 'Conceitos Fundamentais de Java', 'Teste seus conhecimentos sobre os pilares do Java.', 1, 1)
ON CONFLICT (id) DO NOTHING;

-- Quiz 2 (ID 2) - Java Básico, Dificuldade 2
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES
(2, 'Controle de Fluxo e Loops em Java', 'Questões sobre if/else, switch, for, while.', 2, 1)
ON CONFLICT (id) DO NOTHING;

-- Quiz 3 (ID 3) - Estruturas de Dados, Dificuldade 2
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES
(3, 'Arrays e Listas em Java', 'Entendendo coleções básicas.', 2, 2)
ON CONFLICT (id) DO NOTHING;

-- Quiz 4 (ID 4) - Java Básico, Dificuldade 3 (NOVO)
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES
(4, 'Java Básico Avançado - Threads e Exceções', 'Desafios sobre concorrência e tratamento de erros.', 3, 1)
ON CONFLICT (id) DO NOTHING;

-- Quiz 5 (ID 5) - Estruturas de Dados, Dificuldade 3 (NOVO)
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES
(5, 'Árvores e Grafos em Java', 'Conceitos e aplicações de estruturas de dados complexas.', 3, 2)
ON CONFLICT (id) DO NOTHING;

-- Quiz 6 (ID 6) - Spring Framework, Dificuldade 1 (NOVO)
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES
(6, 'Introdução ao Spring Boot', 'Seus primeiros passos com o ecossistema Spring.', 1, 3)
ON CONFLICT (id) DO NOTHING;

-- Quiz 7 (ID 7) - Spring Framework, Dificuldade 2 (NOVO)
INSERT INTO quizzes (id, name, description, difficulty, subject_id) VALUES
(7, 'Injeção de Dependências com Spring', 'Entendendo o core do Spring Framework.', 2, 3)
ON CONFLICT (id) DO NOTHING;


-- Questions
-- Perguntas para o Quiz 1 (ID 1) - Conceitos Fundamentais de Java (IDs 1-3)
INSERT INTO questions (id, body, difficulty) VALUES
(1, 'Qual destes não é um tipo primitivo em Java?', 1),
(2, 'O que significa JVM?', 1),
(3, 'Qual palavra-chave é usada para herança em Java?', 2)
ON CONFLICT (id) DO NOTHING;

-- Perguntas para o Quiz 2 (ID 2) - Controle de Fluxo e Loops em Java (IDs 4-5)
INSERT INTO questions (id, body, difficulty) VALUES
(4, 'Qual loop é garantido para executar seu corpo pelo menos uma vez?', 2),
(5, 'A instrução "break" pode ser usada em qual dos seguintes contextos?', 2)
ON CONFLICT (id) DO NOTHING;

-- Perguntas para o Quiz 3 (ID 3) - Arrays e Listas em Java (IDs 6-7)
INSERT INTO questions (id, body, difficulty) VALUES
(6, 'Qual a principal diferença entre um Array e um ArrayList em Java?', 2),
(7, 'Como se declara um array de inteiros com 5 posições em Java?', 1)
ON CONFLICT (id) DO NOTHING;

-- Perguntas para o Quiz 4 (ID 4) - Java Básico Avançado (NOVO) (IDs 8-9)
INSERT INTO questions (id, body, difficulty) VALUES
(8, 'Qual interface deve ser implementada para criar uma Thread em Java, além de estender a classe Thread?', 3),
(9, 'Qual bloco é sempre executado em um try-catch-finally, independentemente de uma exceção ocorrer?', 3)
ON CONFLICT (id) DO NOTHING;

-- Perguntas para o Quiz 5 (ID 5) - Árvores e Grafos em Java (NOVO) (IDs 10-11)
INSERT INTO questions (id, body, difficulty) VALUES
(10, 'Em uma árvore binária de busca (BST), onde está localizado o menor valor?', 3),
(11, 'Qual algoritmo de busca em grafos utiliza uma fila para explorar os vizinhos?', 3)
ON CONFLICT (id) DO NOTHING;

-- Perguntas para o Quiz 6 (ID 6) - Introdução ao Spring Boot (NOVO) (IDs 12-13)
INSERT INTO questions (id, body, difficulty) VALUES
(12, 'Qual anotação principal marca uma classe como uma aplicação Spring Boot?', 1),
(13, 'O que é o Spring Initializr?', 1)
ON CONFLICT (id) DO NOTHING;

-- Perguntas para o Quiz 7 (ID 7) - Injeção de Dependências com Spring (NOVO) (IDs 14-15)
INSERT INTO questions (id, body, difficulty) VALUES
(14, 'Qual anotação é comumente usada para injeção de dependência por construtor no Spring?', 2),
(15, 'Qual o principal benefício da Inversão de Controle (IoC)?', 2)
ON CONFLICT (id) DO NOTHING;


-- Alternatives
-- (Alternativas para perguntas 1-7 permanecem as mesmas do seu data.sql original)
-- Alternativas para Pergunta 1 (Quiz 1)
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES
(1, 1, 1, 'int', FALSE, 'int é um tipo primitivo para números inteiros.'),
(2, 1, 2, 'boolean', FALSE, 'boolean é um tipo primitivo para valores verdadeiros ou falsos.'),
(3, 1, 3, 'String', TRUE, 'String é uma classe (um objeto), não um tipo primitivo.'),
(4, 1, 4, 'char', FALSE, 'char é um tipo primitivo para caracteres.')
ON CONFLICT (id) DO NOTHING;
-- ... (suas alternativas para perguntas 2-7) ...
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


-- Alternativas para Pergunta 8 (Quiz 4 - NOVO)
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES
(26, 8, 1, 'Callable', FALSE, 'Callable é para tasks que retornam resultado e podem lançar exceções, usada com ExecutorService.'),
(27, 8, 2, 'Runnable', TRUE, 'Runnable é a interface comum com o método run() para definir uma task para uma thread.'),
(28, 8, 3, 'Serializable', FALSE, 'Serializable é para persistência de objetos.'),
(29, 8, 4, 'Executor', FALSE, 'Executor é uma interface para desacoplar submissão de tasks da mecânica de execução.')
ON CONFLICT (id) DO NOTHING;

-- Alternativas para Pergunta 9 (Quiz 4 - NOVO)
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES
(30, 9, 1, 'try', FALSE, 'O bloco try contém o código que pode lançar uma exceção.'),
(31, 9, 2, 'catch', FALSE, 'O bloco catch lida com a exceção, se lançada.'),
(32, 9, 3, 'finally', TRUE, 'O bloco finally é sempre executado, ocorra exceção ou não (exceto em System.exit()).'),
(33, 9, 4, 'throws', FALSE, 'throws é usado na assinatura de um método para declarar exceções que ele pode lançar.')
ON CONFLICT (id) DO NOTHING;

-- Alternativas para Pergunta 10 (Quiz 5 - NOVO)
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES
(34, 10, 1, 'Na raiz da árvore.', FALSE, 'A raiz pode ser qualquer valor dependendo da inserção.'),
(35, 10, 2, 'No nó mais à esquerda da subárvore esquerda da raiz.', TRUE, 'Em uma BST, o menor valor é encontrado seguindo os filhos à esquerda o máximo possível.'),
(36, 10, 3, 'No nó mais à direita da subárvore direita da raiz.', FALSE, 'Este seria o maior valor.'),
(37, 10, 4, 'Em qualquer nó folha.', FALSE, 'Pode haver valores maiores em nós folha.')
ON CONFLICT (id) DO NOTHING;

-- Alternativas para Pergunta 11 (Quiz 5 - NOVO)
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES
(38, 11, 1, 'Busca em Profundidade (DFS)', FALSE, 'DFS tipicamente usa uma pilha ou recursão.'),
(39, 11, 2, 'Busca em Largura (BFS)', TRUE, 'BFS usa uma fila para visitar nós nível por nível.'),
(40, 11, 3, 'Algoritmo de Dijkstra', FALSE, 'Dijkstra encontra o caminho mais curto, geralmente usando uma fila de prioridade.'),
(41, 11, 4, 'Algoritmo de Kruskal', FALSE, 'Kruskal encontra a árvore geradora mínima.')
ON CONFLICT (id) DO NOTHING;

-- Alternativas para Pergunta 12 (Quiz 6 - NOVO)
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES
(42, 12, 1, '@SpringBootApplication', TRUE, 'Esta é uma anotação de conveniência que adiciona @Configuration, @EnableAutoConfiguration e @ComponentScan.'),
(43, 12, 2, '@EnableSpringBoot', FALSE, 'Não é uma anotação padrão do Spring Boot.'),
(44, 12, 3, '@Application', FALSE, 'Não é uma anotação padrão do Spring Boot para este propósito.'),
(45, 12, 4, '@SpringApp', FALSE, 'Não é uma anotação padrão do Spring Boot.')
ON CONFLICT (id) DO NOTHING;

-- Alternativas para Pergunta 13 (Quiz 6 - NOVO)
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES
(46, 13, 1, 'Um servidor de aplicações embutido.', FALSE, 'Embora o Spring Boot possa usar servidores embutidos, o Initializr é outra coisa.'),
(47, 13, 2, 'Uma ferramenta web/IDE para gerar a estrutura inicial de projetos Spring Boot.', TRUE, 'O Spring Initializr (start.spring.io) ajuda a configurar rapidamente um novo projeto com as dependências necessárias.'),
(48, 13, 3, 'Uma biblioteca para testes unitários no Spring.', FALSE, 'Isso seria algo como Spring Test ou JUnit/Mockito.'),
(49, 13, 4, 'O container de Inversão de Controle do Spring.', FALSE, 'Este é o ApplicationContext/BeanFactory.')
ON CONFLICT (id) DO NOTHING;

-- Alternativas para Pergunta 14 (Quiz 7 - NOVO)
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES
(50, 14, 1, '@Inject', FALSE, '@Inject é da especificação JSR-330, similar a @Autowired, mas a pergunta é sobre construtor.'),
(51, 14, 2, '@Autowired (no construtor)', TRUE, 'Colocar @Autowired no construtor é a forma recomendada para injeção de dependência via construtor.'),
(52, 14, 3, '@Resource', FALSE, '@Resource é da especificação JSR-250, geralmente para injeção por nome.'),
(53, 14, 4, '@Bean', FALSE, '@Bean é usado em classes de configuração para declarar beans.')
ON CONFLICT (id) DO NOTHING;

-- Alternativas para Pergunta 15 (Quiz 7 - NOVO)
INSERT INTO alternatives (id, question_id, position, body, is_correct, justification) VALUES
(54, 15, 1, 'Aumentar o acoplamento entre componentes.', FALSE, 'IoC visa diminuir o acoplamento.'),
(55, 15, 2, 'Diminuir o acoplamento e aumentar a modularidade e testabilidade.', TRUE, 'Ao delegar a criação e gerenciamento de dependências para um container, o código se torna mais modular e fácil de testar.'),
(56, 15, 3, 'Permitir que os componentes controlem suas próprias dependências diretamente.', FALSE, 'IoC inverte esse controle; o container controla as dependências.'),
(57, 15, 4, 'Forçar o uso de herança em vez de composição.', FALSE, 'IoC favorece a composição.')
ON CONFLICT (id) DO NOTHING;


-- quiz_questions (Relacionamento entre Quizzes e Questions)
-- Quiz 1 (ID 1) com Perguntas 1, 2, 3
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (1, 1), (1, 2), (1, 3) ON CONFLICT (quiz_id, question_id) DO NOTHING;
-- Quiz 2 (ID 2) com Perguntas 4, 5
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (2, 4), (2, 5) ON CONFLICT (quiz_id, question_id) DO NOTHING;
-- Quiz 3 (ID 3) com Perguntas 6, 7
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (3, 6), (3, 7) ON CONFLICT (quiz_id, question_id) DO NOTHING;

-- NOVOS RELACIONAMENTOS
-- Quiz 4 (ID 4) com Perguntas 8, 9
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (4, 8), (4, 9) ON CONFLICT (quiz_id, question_id) DO NOTHING;
-- Quiz 5 (ID 5) com Perguntas 10, 11
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (5, 10), (5, 11) ON CONFLICT (quiz_id, question_id) DO NOTHING;
-- Quiz 6 (ID 6) com Perguntas 12, 13
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (6, 12), (6, 13) ON CONFLICT (quiz_id, question_id) DO NOTHING;
-- Quiz 7 (ID 7) com Perguntas 14, 15
INSERT INTO quiz_questions (quiz_id, question_id) VALUES (7, 14), (7, 15) ON CONFLICT (quiz_id, question_id) DO NOTHING;


-- Atualizar sequências para evitar conflitos se você inserir sem ID depois
-- (Para PostgreSQL)
SELECT setval('users_id_seq', COALESCE((SELECT MAX(id) FROM users), 1), true);
SELECT setval('subject_id_seq', COALESCE((SELECT MAX(id) FROM subject), 1), true);
SELECT setval('quizzes_id_seq', COALESCE((SELECT MAX(id) FROM quizzes), 1), true);
SELECT setval('questions_id_seq', COALESCE((SELECT MAX(id) FROM questions), 1), true);
SELECT setval('alternatives_id_seq', COALESCE((SELECT MAX(id) FROM alternatives), 1), true);
-- As tabelas quiz_attempts e user_answers não tiveram IDs pré-definidos, então suas sequências
-- devem estar corretas se elas começarem do 1. Se você inserir manualmente IDs nelas, precisará
-- adicionar setval para quiz_attempts_id_seq e user_answers_id_seq também.
-- A tabela quiz_questions usa uma chave primária composta e não tem sua própria sequência de ID.