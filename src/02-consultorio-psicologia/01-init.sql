-- 01-init.sql

-- UNIESP Faculdades
-- Banco de Dados II
-- Vinícius Gonçalves de Oliveira

CREATE TABLE convenios (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	percentual_cobertura NUMERIC(5, 2) NOT NULL
	CHECK (percentual_cobertura BETWEEN 0 AND 100)
);

CREATE TABLE terapeutas (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(150) NOT NULL,
	crp VARCHAR(20) NOT NULL UNIQUE,
	especialidade VARCHAR(100),
	email VARCHAR(150) UNIQUE,
	telefone VARCHAR(20),
	data_contratacao DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE pacientes (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(150) NOT NULL,
	cpf VARCHAR(14) NOT NULL UNIQUE,
	data_nascimento DATE NOT NULL,
	telefone VARCHAR(20),
	email VARCHAR(150),
	convenio_id INTEGER REFERENCES convenios(id),
	data_cadastro DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE salas (
	id SERIAL PRIMARY KEY,
	numero VARCHAR(10) NOT NULL UNIQUE,
	tipo VARCHAR(50) NOT NULL DEFAULT 'presencial'
	CHECK (tipo IN ('presencial', 'online'))
);

CREATE TABLE sessoes (
	id SERIAL PRIMARY KEY,
	paciente_id INTEGER NOT NULL REFERENCES pacientes(id),
	terapeuta_id INTEGER NOT NULL REFERENCES terapeutas(id),
	sala_id INTEGER REFERENCES salas(id),
	data_hora TIMESTAMP NOT NULL,
	duracao_minutos INTEGER NOT NULL DEFAULT 50,
	status VARCHAR(20) NOT NULL DEFAULT 'agendada'
	CHECK (status IN ('agendada', 'realizada', 'cancelada', 'falta')),
	valor NUMERIC(8, 2) NOT NULL
);

CREATE TABLE prontuarios (
	id SERIAL PRIMARY KEY,
	sessao_id INTEGER NOT NULL UNIQUE REFERENCES sessoes(id),
	anotacoes TEXT,
	data_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
