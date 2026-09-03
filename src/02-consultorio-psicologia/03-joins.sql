-- 03-joins.sql

-- UNIESP Faculdades
-- Banco de Dados II
-- Vinícius Gonçalves de Oliveira

SELECT
    p.id   AS paciente_id,
    p.nome AS nome_id,
    c.id   AS convenio_id,
    c.nome AS convenio
FROM
    pacientes p
INNER JOIN convenios c ON c.id = p.convenio_id
ORDER BY p.id;

SELECT
    p.id   AS paciente_id,
    p.nome AS nome_id,
    c.id   AS convenio_id,
    c.nome AS convenio
FROM
    pacientes p
LEFT JOIN convenios c ON c.id = p.convenio_id
ORDER BY p.id;

SELECT
    p.id   AS paciente_id,
    p.nome AS nome_id,
    c.id   AS convenio_id,
    c.nome AS convenio
FROM
    pacientes p
RIGHT JOIN convenios c ON c.id = p.convenio_id
ORDER BY p.id;

SELECT
    p.id   AS paciente_id,
    p.nome AS nome_id,
    c.id   AS convenio_id,
    c.nome AS convenio
FROM
    pacientes p
FULL JOIN convenios c ON c.id = p.convenio_id
ORDER BY p.id;

SELECT
    p.id   AS paciente_id,
    p.nome AS nome_id,
    c.id   AS convenio_id,
    c.nome AS convenio
FROM
    pacientes p
CROSS JOIN convenios c
ORDER BY p.id;
