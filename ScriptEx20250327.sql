use farmacia_db;

SELECT nome, preco, preco + 5 AS preco_acrescido FROM produtos; 
SELECT nome, estoque, estoque - 10 AS estoque_ajustado FROM produtos; 
SELECT nome, preco, preco * 1.1 AS preco_com_aumento FROM produtos; 
SELECT nome, estoque, estoque / 2 AS metade_estoque FROM produtos; 
SELECT id_produto, estoque, estoque % 2 AS resto_divisao FROM produtos; 
SELECT * FROM clientes WHERE nome = 'João Silva'; 
SELECT * FROM fornecedores WHERE nome <> 'Fornecedor A'; 
SELECT * FROM produtos WHERE preco > 15; 
SELECT * FROM produtos WHERE estoque < 80; 
SELECT * FROM vendas WHERE total >= 30; 
SELECT * FROM prescricoes WHERE data_prescricao <= '2024-03-08'; 
SELECT * FROM produtos WHERE preco BETWEEN 10 AND 20; 
SELECT * FROM medicos WHERE especialidade IN ('Pediatra', 'Dentista'); 
SELECT * FROM clientes WHERE nome LIKE 'M%'; 
SELECT * FROM produtos WHERE descricao LIKE '%Analgésico%'; 
SELECT * FROM produtos WHERE preco > 10 AND estoque > 50; 
SELECT * FROM vendas WHERE total > 40 OR data_venda = '2024-03-10'; 
SELECT * FROM fornecedores WHERE NOT nome = 'Fornecedor D'; 
SELECT * FROM produtos WHERE (preco > 10 AND estoque < 100) OR nome LIKE 'I%'; 
SELECT * FROM vendas WHERE total BETWEEN 20 AND 40 AND data_venda = '2024-03-10'; 
SELECT * FROM medicos WHERE especialidade IN ('Dentista', 'Clínico Geral') OR nome LIKE 'D%'; 
SELECT * FROM clientes WHERE nome NOT LIKE 'A%'; 
SELECT * FROM fornecedores WHERE email IS NOT NULL AND telefone IS NOT NULL; 
SELECT * FROM clientes WHERE telefone IS NULL OR email IS NULL; 
SELECT * FROM fornecimentos WHERE quantidade > 100 AND preco_unitario < 10 AND data_fornecimento > '2024-03-07'; 
SELECT nome AS entidade FROM clientes 
UNION 
SELECT nome AS entidade FROM fornecedores; 
SELECT nome AS entidade FROM clientes 
UNION ALL 
SELECT nome AS entidade FROM fornecedores; 
SELECT SUM(quantidade) AS total_vendido FROM itens_venda; 
SELECT AVG(preco) AS preco_medio FROM produtos; 
SELECT COUNT(*) AS total_prescricoes FROM prescricoes; 
SELECT MAX(preco) AS produto_mais_caro FROM produtos; 
SELECT MIN(total) AS menor_venda FROM vendas; 
SELECT id_cliente, COUNT(*) AS qtd_prescricoes 
FROM prescricoes 
GROUP BY id_cliente; 
SELECT id_produto, SUM(quantidade) AS total_vendido 
FROM itens_venda 
GROUP BY id_produto 
ORDER BY total_vendido DESC; 
SELECT id_produto, SUM(quantidade) AS total_vendido 
FROM itens_venda 
GROUP BY id_produto 
HAVING total_vendido > 2; 
SELECT id_produto, SUM(quantidade) AS total_vendido 
FROM itens_venda 
GROUP BY id_produto 
HAVING total_vendido = ( 
    SELECT MAX(total_vendido) FROM ( 
        SELECT SUM(quantidade) AS total_vendido 
        FROM itens_venda 
        GROUP BY id_produto 
    ) AS sub 
); 
SELECT c.nome, SUM(v.total) AS total_gasto 
FROM clientes c, vendas v 
WHERE c.id_cliente = v.id_cliente 
GROUP BY c.nome 
ORDER BY total_gasto DESC 
LIMIT 1; 
SELECT DISTINCT f.nome 
FROM fornecimentos fo, fornecedores f 
WHERE fo.id_fornecedor = f.id_fornecedor 
AND fo.preco_unitario > 15; 
SELECT iv.id_item, iv.id_produto, iv.quantidade, iv.preco_unitario 
FROM itens_venda iv, vendas v 
WHERE iv.id_venda = v.id_venda 
AND v.total = (SELECT MAX(total) FROM vendas); 
SELECT nome FROM fornecedores WHERE telefone IS NULL; 
SELECT * FROM clientes; 
SELECT nome, preco FROM produtos; 
SELECT * FROM vendas WHERE data_venda = '2024-03-10'; 
SELECT nome, especialidade FROM medicos; 
SELECT nome, telefone FROM fornecedores; 
SELECT * FROM produtos WHERE preco > 15; 
SELECT * FROM produtos WHERE estoque < 80; 
SELECT * FROM vendas WHERE total > 30; 
SELECT c.nome, p.data_prescricao  
FROM clientes c, prescricoes p 
WHERE c.id_cliente = p.id_cliente; 
SELECT * FROM fornecimentos WHERE data_fornecimento = '2024-03-09'; 
SELECT * FROM produtos WHERE descricao LIKE '%Analgésico%'; 
SELECT v.*  
FROM vendas v, clientes c  
WHERE v.id_cliente = c.id_cliente AND c.nome LIKE 'M%'; 
SELECT * FROM produtos WHERE estoque BETWEEN 50 AND 120; 
SELECT * FROM clientes WHERE email IS NOT NULL; 
SELECT p.*  
FROM prescricoes p, medicos m  
WHERE p.id_medico = m.id_medico AND m.especialidade = 'Pediatra'; 
SELECT * FROM produtos  
WHERE preco = (SELECT MAX(preco) FROM produtos); 
SELECT c.nome, v.total  
FROM clientes c, vendas v  
WHERE c.id_cliente = v.id_cliente AND v.total = (SELECT MAX(total) FROM vendas); 
SELECT id_produto, SUM(quantidade) AS total_vendido  
FROM itens_venda  
GROUP BY id_produto  
ORDER BY total_vendido DESC  
LIMIT 1; 
SELECT AVG(preco) AS media_preco, COUNT(*) AS total_produtos  
FROM produtos; 
SELECT f.nome, SUM(fo.quantidade) AS total_fornecido  
FROM fornecedores f, fornecimentos fo  
WHERE f.id_fornecedor = fo.id_fornecedor  
GROUP BY f.nome  
ORDER BY total_fornecido DESC  
LIMIT 1; 
SELECT c.nome, v.data_venda, v.total 
FROM clientes c 
INNER JOIN vendas v ON c.id_cliente = v.id_cliente; 
SELECT p.id_prescricao, m.nome AS medico, p.descricao 
FROM prescricoes p 
INNER JOIN medicos m ON p.id_medico = m.id_medico; 
SELECT iv.id_venda, p.nome AS produto, iv.quantidade, iv.preco_unitario 
FROM itens_venda iv 
JOIN produtos p ON iv.id_produto = p.id_produto; 
SELECT p.nome AS produto, f.data_fornecimento, f.quantidade 
FROM produtos p 
LEFT JOIN fornecimentos f ON p.id_produto = f.id_produto; 
SELECT fo.nome AS fornecedor, f.data_fornecimento, f.quantidade 
FROM fornecimentos f 
RIGHT JOIN fornecedores fo ON f.id_fornecedor = fo.id_fornecedor; 
SELECT c.nome, p.descricao AS prescricao 
FROM clientes c 
LEFT JOIN prescricoes p ON c.id_cliente = p.id_cliente; 
SELECT p.nome AS produto, f.quantidade, f.data_fornecimento 
FROM fornecimentos f 
RIGHT JOIN produtos p ON f.id_produto = p.id_produto; 
SELECT c.nome AS cliente, v.data_venda, iv.quantidade, iv.preco_unitario 
FROM vendas v 
INNER JOIN clientes c ON v.id_cliente = c.id_cliente 
INNER JOIN itens_venda iv ON v.id_venda = iv.id_venda; 
SELECT v.id_venda, v.data_venda, iv.id_item, iv.quantidade 
FROM vendas v 
LEFT JOIN itens_venda iv ON v.id_venda = iv.id_venda; 
SELECT m.nome AS medico, p.descricao 
FROM prescricoes p 
RIGHT JOIN medicos m ON p.id_medico = m.id_medico; 
SELECT COUNT(*) AS total_clientes FROM clientes; 
SELECT SUM(total) AS total_vendas FROM vendas; 
SELECT AVG(preco) AS media_preco FROM produtos;
