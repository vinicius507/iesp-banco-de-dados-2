-- 1. Subquery
-- Escreva uma query que liste o nome dos pacientes vinculados a convênios com
-- percentual_cobertura maior que 70%. 

SELECT
	p.id,
	p.nome
FROM pacientes p
WHERE EXISTS (
		SELECT 1
		FROM convenios c
		WHERE c.id = p.convenio_id AND c.percentual_cobertura > 70
	);

-- 2. CTE 
-- Usando uma CTE, calcule quantas sessões cada sala teve com status =
-- 'realizada'. Em seguida, na consulta final, mostre apenas a sala (ou salas)
-- com o maior número de sessões realizadas.
WITH
	sessoes_realizadas AS (
		SELECT
			s.sala_id,
			count(*) AS realizadas
		FROM sessoes s
		WHERE s.status = 'realizada'
		GROUP BY s.sala_id
	)

SELECT
	s.id,
	s.numero,
	sr.realizadas
FROM salas s
JOIN sessoes_realizadas sr ON sr.sala_id = s.id
WHERE sr.realizadas = (SELECT max(realizadas) FROM sessoes_realizadas);

-- 3. Leitura de código
-- Analise a query abaixo e responda: o que essa consulta retorna, em palavras
-- (não precisa rodar, é pra interpretar)?

SELECT p.nome
FROM pacientes p
WHERE p.id NOT IN (
		SELECT s.paciente_id
		FROM sessoes s
		WHERE s.status = 'realizada'
	);

-- Resposta: A query retorna os nomes dos pacientes que nunca tiveram uma
-- sessão realizada.

-- 4. View
-- Crie uma view chamada vw_agenda_terapeuta que mostre, para sessões com
-- status = 'agendada': nome do terapeuta, nome do paciente, data/hora da
-- sessão e número da sala. Depois, escreva um SELECT usando essa view para
-- mostrar apenas a agenda da terapeuta Ana Souza. 

CREATE OR REPLACE VIEW vw_agenda_terapeuta AS
SELECT
	t.nome    AS terapeuta,
	p.nome    AS paciente,
	s.data_hora,
	sl.numero AS numero_da_sala
FROM sessoes s
JOIN terapeutas t ON s.terapeuta_id = t.id
JOIN pacientes p ON s.paciente_id = p.id
JOIN salas sl ON s.sala_id = sl.id
WHERE s.status = 'agendada';

SELECT
	*
FROM vw_agenda_terapeuta at
WHERE at.terapeuta = 'Ana Beatriz Souza';

-- 5. Conceitual + View x Materialized View
-- Responda com suas palavras: se você criasse uma VIEW normal chamada
-- vw_faturamento_terapeuta (faturamento total por terapeuta) e depois
-- inserisse uma nova sessão realizada no banco, o valor mostrado por SELECT *
-- FROM vw_faturamento_terapeuta mudaria imediatamente? E se fosse uma
-- MATERIALIZED VIEW, o que seria necessário fazer para o valor refletir essa
-- nova sessão?

-- Resposta: Sim, ao realizarmos o select na `VIEW` após inserir uma nova
-- sessão realizada no banco, as rows retornadas estariam atualizadas com os
-- dados da nova sessão. Isso se dá pois uma VIEW não guarda dados, ela é
-- apenas uma consulta salva com um nome. Por outro lado, uma `MATERIALIZED
-- VIEW` precisa ser atualizada manualmente usando `REFRESH MATERIALIZED VIEW
-- vw_faturamento_terapeuta`.
