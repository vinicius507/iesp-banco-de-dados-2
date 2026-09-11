-- 1. Lista sessões com nome do paciente e nome do terapeuta
SELECT
	s.id,
	p.nome AS paciente,
	t.nome AS terapeuta
FROM sessoes s
INNER JOIN pacientes p ON p.id = s.paciente_id
INNER JOIN terapeutas t ON t.id = s.terapeuta_id;

-- 2. Mostra sessões com valor maior que a média de todos os valores cobrados
SELECT s.* FROM
	sessoes s WHERE s.valor > (
		SELECT avg(valor) FROM sessoes
	);

-- 3. Total gasto por paciente, com o Id do paciente, nome do paciente e soma
-- dos valores das sessões
SELECT
	p.id,
	p.nome,
	coalesce(sum(s.valor), 0) AS valor_total
FROM pacientes p
LEFT JOIN sessoes s ON s.paciente_id = p.id
GROUP BY p.id;
