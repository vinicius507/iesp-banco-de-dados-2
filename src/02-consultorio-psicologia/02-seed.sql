-- 02-seed.sql

-- UNIESP Faculdades
-- Banco de Dados II
-- Vinícius Gonçalves de Oliveira

INSERT INTO convenios (nome, percentual_cobertura) VALUES
('Unimed', 80.00),
('Bradesco Saúde', 70.00),
('Amil', 60.00),
('SulAmérica', 75.00);

INSERT INTO terapeutas (
    nome, crp, especialidade, email, telefone, data_contratacao
) VALUES
(
    'Ana Beatriz Souza',
    '06/12345',
    'Terapia Cognitivo-Comportamental',
    'ana.souza@consultorio.com',
    '(83) 99111-1111',
    '2022-02-01'
),
(
    'Carlos Eduardo Lima',
    '06/23456',
    'Psicanálise',
    'carlos.lima@consultorio.com',
    '(83) 99222-2222',
    '2021-06-15'
),
(
    'Fernanda Ribeiro',
    '06/34567',
    'Terapia Infantil',
    'fernanda.ribeiro@consultorio.com',
    '(83) 99333-3333',
    '2023-01-10'
),
(
    'João Pedro Alves',
    '06/45678',
    'Terapia de Casal',
    'joao.alves@consultorio.com',
    '(83) 99444-4444',
    '2020-09-20'
);

INSERT INTO pacientes (
    nome, cpf, data_nascimento, telefone, email, convenio_id, data_cadastro
) VALUES
(
    'Mariana Costa',
    '111.111.111-11',
    '1995-03-14',
    '(83) 98111-0001',
    'mariana.costa@email.com',
    1,
    '2024-01-10'
),
(
    'Pedro Henrique',
    '222.222.222-22',
    '1988-07-22',
    '(83) 98111-0002',
    'pedro.henrique@email.com',
    2,
    '2024-01-15'
),
(
    'Juliana Martins',
    '333.333.333-33',
    '2001-11-05',
    '(83) 98111-0003',
    'juliana.martins@email.com',
    NULL,
    '2024-02-01'
),
(
    'Rafael Souza',
    '444.444.444-44',
    '1979-05-30',
    '(83) 98111-0004',
    'rafael.souza@email.com',
    3,
    '2024-02-10'
),
(
    'Camila Fernandes',
    '555.555.555-55',
    '1993-09-18',
    '(83) 98111-0005',
    'camila.fernandes@email.com',
    NULL,
    '2024-02-20'
),
(
    'Lucas Oliveira',
    '666.666.666-66',
    '2010-12-01',
    '(83) 98111-0006',
    'lucas.oliveira@email.com',
    1,
    '2024-03-01'
),
(
    'Beatriz Almeida',
    '777.777.777-77',
    '1985-04-25',
    '(83) 98111-0007',
    'beatriz.almeida@email.com',
    4,
    '2024-03-05'
),
(
    'Gustavo Pereira',
    '888.888.888-88',
    '1998-02-14',
    '(83) 98111-0008',
    'gustavo.pereira@email.com',
    2,
    '2024-03-12'
);

INSERT INTO salas (numero, tipo) VALUES
('101', 'presencial'),
('102', 'presencial'),
('ONLINE-1', 'online');

INSERT INTO sessoes (
    paciente_id,
    terapeuta_id,
    sala_id,
    data_hora,
    duracao_minutos,
    status,
    valor
) VALUES
(1, 1, 1, '2024-04-02 09:00', 50, 'realizada', 200.00),
(1, 1, 1, '2024-04-09 09:00', 50, 'realizada', 200.00),
(2, 2, 2, '2024-04-03 10:00', 50, 'realizada', 220.00),
(3, 1, 3, '2024-04-03 14:00', 50, 'realizada', 180.00),
(4, 3, 1, '2024-04-04 08:00', 50, 'falta', 0.00),
(5, 4, 2, '2024-04-04 16:00', 60, 'realizada', 250.00),
(6, 3, 1, '2024-04-05 11:00', 50, 'realizada', 180.00),
(7, 2, 3, '2024-04-05 15:00', 50, 'cancelada', 0.00),
(8, 1, 1, '2024-04-08 09:00', 50, 'agendada', 200.00),
(2, 2, 2, '2024-04-10 10:00', 50, 'agendada', 220.00),
(1, 1, 1, '2024-04-16 09:00', 50, 'agendada', 200.00),
(6, 3, 1, '2024-04-12 11:00', 50, 'agendada', 180.00);

INSERT INTO prontuarios (sessao_id, anotacoes) VALUES
(
    1,
    'Paciente relatou melhora no padrão de sono. Manteve rotina de exercicios sugerida na sessao anterior.'
),
(
    2,
    'Sessao focada em tecnicas de reestruturacao cognitiva para ansiedade no ambiente de trabalho.'
),
(
    3,
    'Primeira sessao de acompanhamento pos-avaliacao inicial. Paciente engajado no processo.'
),
(
    4,
    'Trabalhamos questoes relacionadas a autoestima. Paciente demonstrou avanco significativo.'
),
(
    6,
    'Sessao com foco em habilidades sociais e regulacao emocional. Uso de recursos ludicos.'
),
(
    7,
    'Casal discutiu comunicacao nao violenta. Combinados definidos para a proxima semana.'
);
