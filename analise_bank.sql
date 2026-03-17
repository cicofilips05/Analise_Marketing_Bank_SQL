USE mkt;
--- =========================================================
--- 1. EXPLORAÇÃO INICIAL DOS DADOS
--- Objetivo: entender a estrutura da base e validar consistência
--- =========================================================

--- Visualizar as primeiras linhas da tabela
SELECT * FROM bank
LIMIT 10; 

--- Contagem total de registros
SELECT COUNT(*) FROM bank;

--- Verificação de valores ausentes em variáveis-chave
SELECT *
FROM bank
WHERE age IS NULL
   OR job IS NULL
   OR balance IS NULL;

--- =========================================================
--- 2. TAXA DE CONVERSÃO GERAL
--- Objetivo: entender o desempenho geral da campanha
--- =========================================================

--- Cálculo da taxa de conversão total (y = yes / no)
SELECT 
    y,
    COUNT(*) AS total,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentual
FROM bank
GROUP BY y;

--- =========================================================
--- 3. PERFIL DO CLIENTE
--- Objetivo: identificar quais características estão associadas à conversão
--- =========================================================

--- Taxa de conversão por profissão
WITH profs AS (
    SELECT 
        job,
        COUNT(*) AS total,
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS conversoes
    FROM bank
    GROUP BY job
)

SELECT 
    job,
    total,
    conversoes,
    ROUND(100.0 * conversoes / total, 2) AS taxa_conversao,
    ROUND(100.0 * total / SUM(total) OVER (), 2) AS participacao_base,
    ROUND(100.0 * conversoes / SUM(conversoes) OVER (), 2) AS participacao_conversoes
FROM profs
ORDER BY taxa_conversao DESC;


--- Taxa de conversão por faixa etária
WITH faixa_etaria AS (
    SELECT 
        CASE 
            WHEN age < 24 THEN 'Jovens'
            WHEN age BETWEEN 25 AND 60 THEN 'Adultos'
            ELSE 'Idosos'
        END AS grupo_idade,
        y
    FROM bank
)
SELECT 
    grupo_idade,
    COUNT(*) AS total_clientes,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS conversoes,
    ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS taxa_conversao,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS participacao_base
FROM faixa_etaria
GROUP BY grupo_idade
ORDER BY taxa_conversao DESC;

--- =========================================================
--- 4. ESTRATÉGIA DE CAMPANHA
--- Objetivo: avaliar a eficácia da abordagem comercial
--- =========================================================

--- Número de contatos vs conversão
WITH campanha AS (
    SELECT 
        CASE 
            WHEN campaign = 1 THEN '1 contato'
            WHEN campaign BETWEEN 2 AND 3 THEN '2-3 contatos'
            WHEN campaign BETWEEN 4 AND 6 THEN '4-6 contatos'
            ELSE '7+ contatos'
        END AS faixa_contato,
        y
    FROM bank
)
SELECT 
    faixa_contato,
    COUNT(*) AS total,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS conversoes,
    ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS taxa_conversao,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS participacao_base
FROM campanha
GROUP BY faixa_contato
ORDER BY taxa_conversao DESC;

--- Resultado de campanhas anteriores (poutcome)
WITH poutcome_analysis AS (
    SELECT 
        poutcome,
        COUNT(*) AS total,
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS conversoes
    FROM bank
    GROUP BY poutcome
)
SELECT 
    poutcome,
    total,
    conversoes,
    ROUND(100.0 * conversoes / total, 2) AS taxa_conversao,
    ROUND(100.0 * total / SUM(total) OVER (), 2) AS participacao_base,
    ROUND(100.0 * conversoes / SUM(conversoes) OVER (), 2) AS participacao_conversoes
FROM poutcome_analysis
ORDER BY taxa_conversao DESC;

--- Canal de contato
--- Verificar se o meio de comunicação influencia a conversão
WITH contact_analysis AS (
    SELECT 
        contact,
        COUNT(*) AS total,
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS conversoes
    FROM bank
    GROUP BY contact
)
SELECT 
    contact,
    total,
    conversoes,
    ROUND(100.0 * conversoes / total, 2) AS taxa_conversao,
    ROUND(100.0 * total / SUM(total) OVER (), 2) AS participacao_base,
    ROUND(100.0 * conversoes / SUM(conversoes) OVER (), 2) AS participacao_conversoes
FROM contact_analysis
ORDER BY taxa_conversao DESC;

--- =========================================================
--- 5. PERFIL FINANCEIRO DO CLIENTE
--- Objetivo: avaliar o impacto da condição financeira na conversão
--- =========================================================

--- Cálculo da média do saldo
SELECT  AVG(balance) FROM bank;

--- Conversão por faixa de saldo
WITH balance_faixa AS (
    SELECT 
        CASE 
            WHEN balance < 0 THEN 'Negativo'
            WHEN balance <= 1422.6578 THEN 'Até a média'
            ELSE 'Acima da média'
        END AS faixa_saldo,
        y
    FROM bank
)
SELECT 
    faixa_saldo,
    COUNT(*) AS total,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS conversoes,
    ROUND(100.0 * SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS taxa_conversao,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS participacao_base
FROM balance_faixa
GROUP BY faixa_saldo
ORDER BY taxa_conversao DESC;

--- Perfil de crédito (financiamento e empréstimo)
WITH credito AS (
    SELECT 
        housing,
        loan,
        COUNT(*) AS total,
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS conversoes
    FROM bank
    GROUP BY housing, loan
)
SELECT 
    housing,
    loan,
    total,
    conversoes,
    ROUND(100.0 * conversoes / total, 2) AS taxa_conversao,
    ROUND(100.0 * total / SUM(total) OVER (), 2) AS participacao_base
FROM credito
ORDER BY taxa_conversao DESC;
