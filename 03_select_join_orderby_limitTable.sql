-------------------------------------------Imóveis com nome do proprietário (JOIN)-----------------------------------------
SELECT i.id_imovel, i.endereco, i.bairro, i.cidade, i.tipo_imovel, i.valor,
       c.nome AS proprietario
FROM Imovel i
JOIN Cliente c ON i.id_proprietario = c.id_cliente
ORDER BY i.id_imovel;

-------------------------------------------Contratos detalhados com imóvel, cliente final e corretor (JOINs)---------------
SELECT co.id_contrato, co.tipo_contrato, co.valor_total, co.data_contrato,
       im.endereco, cl.nome AS cliente_final, corr.nome AS corretor
FROM Contrato co
JOIN Imovel im ON co.id_imovel = im.id_imovel
JOIN Cliente cl ON co.id_cliente_final = cl.id_cliente
JOIN Corretor corr ON co.id_corretor = corr.id_corretor
ORDER BY co.data_contrato DESC;

--------------------------------------------Histórico de visitas (WHERE + ORDER BY + LIMIT)--------------------------------
SELECT v.id_visita, v.data_visita, cl.nome AS cliente, im.endereco, corr.nome AS corretor
FROM Visita v
JOIN Cliente cl ON v.id_cliente = cl.id_cliente
JOIN Imovel im ON v.id_imovel = im.id_imovel
JOIN Corretor corr ON v.id_corretor = corr.id_corretor
WHERE v.data_visita >= '2025-05-01'
ORDER BY v.data_visita DESC
LIMIT 10;

-------------------------------------------Total pago por contrato (GROUP BY)----------------------------------------------
SELECT p.id_contrato, COUNT(*) AS qtd_pagamentos, SUM(p.valor_pagamento) AS total_pago
FROM Pagamento p
GROUP BY p.id_contrato
HAVING total_pago > 0
ORDER BY total_pago DESC;

-------------------------------------------Clientes que visitaram, mas não fecharam contrato (subquery + DISTINCT)---------
SELECT DISTINCT cl.id_cliente, cl.nome
FROM Visita v
JOIN Cliente cl ON v.id_cliente = cl.id_cliente
WHERE cl.id_cliente NOT IN (SELECT id_cliente_final FROM Contrato);
