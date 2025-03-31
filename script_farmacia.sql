-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS farmacia_db;
USE farmacia_db;

-- Tabela para armazenar informações dos clientes
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Tabela para armazenar informações dos médicos
CREATE TABLE IF NOT EXISTS medicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100)
);

-- Tabela para armazenar informações dos produtos
CREATE TABLE IF NOT EXISTS produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL
);

-- Tabela para armazenar informações das vendas
CREATE TABLE IF NOT EXISTS vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_venda DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Tabela para armazenar os itens vendidos em cada venda
CREATE TABLE IF NOT EXISTS itens_venda (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT,
    id_produto INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Tabela para armazenar informações sobre as prescrições médicas
CREATE TABLE IF NOT EXISTS prescricoes (
    id_prescricao INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_medico INT,
    data_prescricao DATE NOT NULL,
    descricao TEXT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);

-- Tabela para armazenar informações sobre os fornecedores
CREATE TABLE IF NOT EXISTS fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Tabela para armazenar informações sobre os fornecimentos de produtos pelos fornecedores
CREATE TABLE IF NOT EXISTS fornecimentos (
    id_fornecimento INT AUTO_INCREMENT PRIMARY KEY,
    id_fornecedor INT,
    id_produto INT,
    data_fornecimento DATE NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Inserindo registros na tabela clientes
INSERT INTO clientes (nome, endereco, telefone, email) VALUES
('João Silva', 'Rua das Flores, 123', '+55 11 9999-8888', 'joao@example.com'),
('Maria Oliveira', 'Avenida dos Anjos, 456', '+55 11 9876-5432', 'maria@example.com'),
('Pedro Santos', 'Travessa das Ruas, 789', '+55 11 8765-4321', 'pedro@example.com'),
('Ana Pereira', 'Alameda das Árvores, 321', '+55 11 7654-3210', 'ana@example.com');

-- Inserindo registros na tabela medicos
INSERT INTO medicos (nome, especialidade) VALUES
('Dr. Carlos', 'Clínico Geral'),
('Dra. Ana', 'Pediatra'),
('Dr. Paulo', 'Dentista'),
('Dra. Maria', 'Ginecologista');

-- Inserindo registros na tabela produtos
INSERT INTO produtos (nome, descricao, preco, estoque) VALUES
('Paracetamol', 'Analgésico e antitérmico', 10.50, 100),
('Amoxicilina', 'Antibiótico', 20.75, 50),
('Ibuprofeno', 'Anti-inflamatório', 15.25, 75),
('Dipirona', 'Analgésico e antitérmico', 8.90, 120);

-- Inserindo registros na tabela vendas
INSERT INTO vendas (id_cliente, data_venda, total) VALUES
(1, '2024-03-10', 25.00),
(2, '2024-03-10', 35.50),
(3, '2024-03-09', 42.75),
(4, '2024-03-09', 18.90);

-- Inserindo registros na tabela itens_venda
INSERT INTO itens_venda (id_venda, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 2, 5.00),
(1, 3, 1, 15.00),
(2, 2, 1, 20.50),
(3, 4, 3, 6.30);

-- Inserindo registros na tabela prescricoes
INSERT INTO prescricoes (id_cliente, id_medico, data_prescricao, descricao) VALUES
(1, 2, '2024-03-05', 'Tomar Paracetamol conforme necessário'),
(2, 1, '2024-03-07', 'Tomar Amoxicilina por 7 dias'),
(3, 4, '2024-03-08', 'Aplicar injeção de Dipirona'),
(4, 3, '2024-03-09', 'Usar Ibuprofeno para dor');

-- Inserindo registros na tabela fornecedores
INSERT INTO fornecedores (nome, endereco, telefone, email) VALUES
('Fornecedor A', 'Rua dos Fornecedores, 100', '+55 11 1111-1111', 'fornecedorA@example.com'),
('Fornecedor B', 'Avenida dos Suprimentos, 200', '+55 11 2222-2222', 'fornecedorB@example.com'),
('Fornecedor C', 'Travessa das Entregas, 300', '+55 11 3333-3333', 'fornecedorC@example.com'),
('Fornecedor D', 'Alameda das Compras, 400', '+55 11 4444-4444', 'fornecedorD@example.com');

-- Inserindo registros na tabela fornecimentos
INSERT INTO fornecimentos (id_fornecedor, id_produto, data_fornecimento, quantidade, preco_unitario) VALUES
(1, 1, '2024-03-08', 200, 8.50),
(2, 2, '2024-03-09', 100, 18.00),
(3, 3, '2024-03-10', 150, 12.00),
(4, 4, '2024-03-07', 300, 7.00);

-- ex 17032025 1-10 simples
SELECT * FROM clientes;

SELECT  nome, telefone from clientes;

select nome from medicos where especialidade = 'Clínico geral';

select nome, preco from produtos where estoque > 100;

select * from vendas where data_venda = '2024-03-10';

select id_produto, quantidade from itens_venda where id_venda = 1;

select nome from produtos where preco <10;

select nome from clientes where endereco = 'Avenida dos Anjos, 456';
-- Evitar utilizar sinal de = quando estiver pesquisando por string

select nome from medicos where especialidade IN ('Pediatra', 'Dentista');
-- tambem seria possivel usar o mesmo do exemplo de cima, com o operador or 

select sum(total) from vendas where data_venda = '2024-03-09';

-- ex 17032025 11-20 intermed
SELECT c.nome, SUM(v.total) 
FROM clientes c 
LEFT JOIN vendas v ON c.id_cliente = v.id_cliente
group by c.nome;
-- O LEFT no código acima prioriza o lado esquerdo, o group faz com que quando o nome for pesquisado, as outras informações que estamos procurando apareçam também

select nome from produtos where nome like '%Analgésico%' or descricao like '%Analgésico%'; 