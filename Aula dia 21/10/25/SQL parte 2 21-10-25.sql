-- atividade : criar um table x fazer toda a parte ddl definir tudo que é composto por uma tabela
-- Chave primaria

-- estudar drop, delete e update
-- PROFESSORES QUE NAO SAO CORDENADORES
SELECT 
    p.IDT_PROF , p.NOM_PROF
FROM
    professores AS P
WHERE NOT EXISTS ( SELECT 1 FROM cursos AS C WHERE p.IDT_PROF = c.IDT_PROF );

-- existem cursos que nao possuem cordenadores?
SELECT 
    *
FROM
    cursos AS c
WHERE
    c.IDT_PROF IS NULL;
-- Lista professores
SELECT * from professores;
-- existem turmas sem professores alocados
SELECT 
    *
FROM
    turmas AS T
WHERE
    T.IDT_PROF IS NOT NULL;
-- Professores que nao possuem turmas
SELECT 
    p.IDT_PROF, p.NOM_PROF
FROM
    professores AS P WHERE NOT EXISTS ( SELECT 1 FROM TURMAS AS T WHERE P.IDT_PROF = T.IDT_PROF);
-- Professores que possuem as turmas
SELECT 
    p.IDT_PROF, p.NOM_PROF
FROM
    professores AS P WHERE EXISTS ( SELECT 1 FROM TURMAS AS T WHERE P.IDT_PROF = T.IDT_PROF);
-- lauro idt_prof = 2
-- cod_disc = 29
-- ano 1999 - semestre 3
SELECT 
    *
FROM
    turmas AS t
WHERE
    t.COD_DISC = 29 AND t.ANO = 1999 AND t.SEMESTRE = 3;
    
    
-- UPDATE
-- Aqui vai adicionar o idt 2 em todas as turmas
UPDATE turmas AS T
SET t.IDT_PROF = 2
where t.IDT_PROF is null;
-- Aqui apos bagunçara a base aqui vai voltar a ser null
UPDATE turmas AS T
SET T.IDT_PROF = null
WHERE t.idt_prof = 2;
-- Vai adicionar o professor com idt 2 nas turmas que estiver com o idt do professor null
UPDATE TURMAS AS T
SET T.IDT_PROF = 2
WHERE t.COD_DISC = 29 
	AND t.ANO = 1999 
	AND t.SEMESTRE = 3;
-- Volta os dados
rollback;

-- INSERT
-- verificar na tabela se a nos periodos letivos esse ano
SELECT 
    *
FROM
    periodos_letivos AS pl
WHERE
    pl.ANO = 2025 AND pl.SEMESTRE = 2;

-- inserir o  periodo letivo 2025 e o semestre 2
insert into periodos_letivos (ano, semestre, dat_ini, dat_fim)
values
(2025, 2, '2025-07-01', '2025-12-31');

-- DELETE
-- Deletando ano = 2025 semestre = 2

delete from periodos_letivos as pl where pl.ano = 2025 and pl.SEMESTRE = 2

-- criar um table x fazer toda a parte ddl definir tudo que é composto por uma tabela

