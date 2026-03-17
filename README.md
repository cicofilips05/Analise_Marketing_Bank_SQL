# Analise_Marketing_Bank_SQL
Análise de dados de campanha de marketing bancário utilizando SQL, com foco na identificação de fatores que influenciam a conversão de clientes. Exploração de perfil, comportamento e estratégias de contato para geração de insights e otimização de campanhas.

🧩 Análise de Campanha de Marketing Bancário — SQL + Excel + PowerPoint 

📖 Introdução

Este projeto tem como objetivo analisar a efetividade de uma campanha de marketing bancário, identificando os principais fatores que influenciam a conversão de clientes.

A análise foi conduzida utilizando SQL para exploração e tratamento dos dados, com visualizações desenvolvidas no Excel e apresentação final estruturada no PowerPoint.

O foco do projeto foi aplicar lógica analítica e storytelling com dados, transformando informações de clientes e interações em insights estratégicos para otimização de campanhas.


🎯 Problema de Negócio

Campanhas de marketing frequentemente apresentam baixa taxa de conversão, gerando custos elevados e baixa eficiência.

Diante disso, este projeto busca responder:

1. Perfil do Cliente

Quais perfis apresentam maior probabilidade de conversão?

Idade e profissão influenciam a decisão?

Existe diferença entre grupos com maior ou menor representatividade?

2. Condições Financeiras

Clientes com maior saldo convertem mais?

O endividamento impacta a decisão?

Existe relação entre saúde financeira e conversão?

3. Estratégia de Contato

Mais contatos aumentam a conversão?

Existe um ponto de saturação?

Qual o impacto do número de tentativas?

4. Efetividade Geral

Qual é a taxa de conversão da campanha?

Há espaço para otimização?


🧠 Estrutura Analítica (SQL)

Toda a análise foi realizada em SQL, utilizando:

SELECT, WHERE, ORDER BY → exploração e filtragem dos dados

GROUP BY → agregações por perfil, idade, contato e saldo

CASE WHEN → criação de categorias (faixas etárias, saldo, contatos)

CTEs (WITH) → organização das análises por etapa

Window Functions → cálculo de participações e proporções


📊 Visualizações (Excel)

Os gráficos foram desenvolvidos no Excel, priorizando clareza e foco nos insights:
As visualizações foram construídas a partir das saídas das queries.


🎨 Apresentação (PowerPoint)

A apresentação foi estruturada com foco em comunicação executiva e storytelling:

Destaque para padrões de conversão

Identificação de grupos estratégicos

Comparação entre eficiência e escala

Insights acionáveis para tomada de decisão


📝 Principais Descobertas

A taxa de conversão geral é de 11,52%, indicando baixa efetividade da campanha

Clientes idosos apresentam maior taxa de conversão, mas baixa representatividade

Clientes adultos dominam a base, porém com menor taxa de conversão

Profissões como aposentados e estudantes apresentam maior eficiência

Clientes com melhor condição financeira convertem mais

O endividamento reduz a probabilidade de conversão

A conversão é maior no primeiro contato, com queda significativa após múltiplas tentativas

Existe um padrão consistente de trade-off entre eficiência e escala


📌 Recomendações Estratégicas

Priorizar segmentos com alta taxa de conversão (ex: idosos, aposentados)

Desenvolver estratégias específicas para grupos numerosos (ex: adultos)

Reduzir o número de contatos excessivos, focando na qualidade da abordagem inicial

Direcionar campanhas para clientes com melhor perfil financeiro

Utilizar segmentação para equilibrar eficiência e volume


🚀 Conclusão

Este projeto demonstra como a análise de dados pode ser aplicada para otimizar campanhas de marketing, identificando padrões claros de comportamento dos clientes.
Os resultados mostram que a conversão depende tanto do perfil do cliente quanto da estratégia adotada, sendo essencial equilibrar eficiência e escala para maximizar os resultados.
