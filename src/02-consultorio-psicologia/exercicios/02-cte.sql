-- 1. Subquery — Terapeutas que nunca tiveram uma sessão cancelada
-- Liste o nome dos terapeutas que não aparecem em nenhuma sessão com status =
-- 'cancelada'.
SELECT
	t.*
FROM terapeutas t
WHERE NOT EXISTS (
		SELECT 1 FROM sessoes s WHERE s.terapeuta_id = t.id AND s.status = 'cancelada'
	);

-- 2. CTE — Faturamento por terapeuta, só acima da média geral
-- Usando uma CTE, calcule o total faturado (soma de valor, considerando só
-- sessões realizada) por terapeuta, e depois filtre apenas os terapeutas cujo
-- faturamento é maior que a média entre todos os terapeutas.
WITH
	terapeuta_faturamento AS (
		SELECT
			t.id,
			t.nome,
			coalesce(sum(s.valor), 0) AS faturamento
		FROM terapeutas t
		LEFT JOIN sessoes s ON s.terapeuta_id = t.id AND s.status = 'realizada'
		GROUP BY t.id
	)

SELECT tf.*
FROM terapeuta_faturamento tf
WHERE tf.faturamento > (SELECT avg(faturamento) FROM terapeuta_faturamento);

-- 3. CTE + Subquery — Pacientes com mais faltas que a média de faltas por
-- paciente Primeiro, uma CTE que conta quantas sessões com status = 'falta'
-- cada paciente teve. Depois, use uma subquery para pegar só quem está acima
-- da média de faltas entre os pacientes que tiveram pelo menos uma falta.
WITH
	paciente_faltas AS (
		SELECT
			p.id,
			p.nome,
			count(*) AS total_faltas
		FROM pacientes p
		LEFT JOIN sessoes s ON s.paciente_id = p.id AND s.status = 'falta'
		GROUP BY p.id
	)

SELECT pf.*
FROM paciente_faltas pf
WHERE pf.total_faltas > (SELECT avg(total_faltas) FROM paciente_faltas);
