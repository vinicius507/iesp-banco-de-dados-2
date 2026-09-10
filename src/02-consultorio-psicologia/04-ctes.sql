WITH
	pacientes_caros AS (
		SELECT s.paciente_id FROM sessoes s WHERE s.valor > (
				SELECT avg(valor) FROM sessoes
			)
	)

SELECT * FROM pacientes_caros;
