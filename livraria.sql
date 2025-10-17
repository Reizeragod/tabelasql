
CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome_autor VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    id_autor INT NOT NULL,
    id_categoria INT NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE itens_pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario_compra DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    UNIQUE (id_pedido, id_produto)
);

INSERT INTO autores (nome_autor) VALUES
('Sun Tzu'),
('J.R.R. Tolkien'),
('George Orwell'),
('Yuval Noah Harari'),
('Frank Herbert'),
('William Gibson'),
('Ray Bradbury'),
('Isaac Asimov'),
('Jane Austen'),
('Neil Gaiman'),
('Stephen King');

INSERT INTO categorias (nome_categoria) VALUES
('Estratégia'),
('Fantasia'),
('Distopia'),
('Não-Ficção'),
('Ficção Científica'),
('Clássicos'),
('Romance Gótico'),
('Terror');

INSERT INTO clientes (nome, email, telefone) VALUES
('João da Silva', 'joao.silva@ufms.br', '67987654321'),
('Maria Oliveira', 'maria.oliveira@ufms.br', '67987654322'),
('Carlos Souza', 'carlos.souza@ufms.br', '67987654323'),
('Ana Costa', 'ana.costa@ufms.br', '67987654324'),
('Pedro Martins', 'pedro.martins@ufms.br', '67987654325');

INSERT INTO produtos (titulo, id_autor, id_categoria, isbn, preco, estoque) VALUES
('A Arte da Guerra', 1, 1, '978-8571860002', 35.50, 15),
('O Hobbit', 2, 2, '978-8595083162', 52.90, 10),
('1984', 3, 3, '978-8535914849', 40.00, 22),
('Sapiens: Uma Breve História da Humanidade', 4, 4, '978-8543105741', 65.00, 5),
('Duna', 5, 5, '978-8544102604', 75.00, 30),
('Neuromancer', 6, 5, '978-8531901844', 48.90, 25),
('Fahrenheit 451', 7, 3, '978-8535916034', 42.50, 18),
('Fundação', 8, 5, '978-8576570773', 68.00, 12),
('Orgulho e Preconceito', 9, 6, '978-8582850392', 45.00, 20),
('Razão e Sensibilidade', 9, 6, '978-8582850408', 45.00, 15),
('Coraline', 10, 7, '978-8535916690', 55.00, 10),
('O Iluminado', 11, 8, '978-8599296927', 72.00, 14),
('It: A Coisa', 11, 8, '978-8501044453', 89.90, 8),
('Cemitério Maldito', 11, 8, '978-8501044767', 65.00, 9);

INSERT INTO pedidos (id_cliente, data_pedido, valor_total) VALUES
(1, '2025-09-29', 111.90),
(2, '2025-09-30', 40.00),
(3, '2025-10-01', 120.00),
(4, '2025-10-17', 261.00),
(5, '2025-10-17', 226.90);

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario_compra) VALUES
(1, 1, 2, 35.50),
(1, 2, 1, 40.90),
(2, 3, 1, 40.00),
(3, 3, 3, 40.00),
(4, 5, 2, 75.00),
(4, 9, 1, 45.00),
(4, 11, 1, 66.00),
(5, 12, 1, 72.00),
(5, 13, 1, 89.90),
(5, 14, 1, 65.00);

-- versão expandida com materiais escolares

INSERT INTO categorias (nome_categoria) VALUES ('Materiais Escolares');

-- NOVOS PRODUTOS: 100 itens de material escolar
INSERT INTO produtos (titulo, id_autor, id_categoria, isbn, preco, estoque) VALUES
('Caderno Universitário 200 folhas - Capa Dura', NULL, 9, NULL, 22.50, 100),
('Caderno 96 folhas - Espiral', NULL, 9, NULL, 12.90, 150),
('Lápis Preto HB nº2', NULL, 9, NULL, 1.50, 500),
('Borracha Branca Escolar', NULL, 9, NULL, 2.00, 400),
('Caneta Azul Bic Cristal', NULL, 9, NULL, 2.30, 300),
('Caneta Preta Bic Cristal', NULL, 9, NULL, 2.30, 300),
('Caneta Vermelha Bic Cristal', NULL, 9, NULL, 2.30, 250),
('Apontador Simples', NULL, 9, NULL, 3.50, 200),
('Régua 30 cm Plástica', NULL, 9, NULL, 4.50, 180),
('Tesoura Escolar sem ponta', NULL, 9, NULL, 6.90, 150),
('Cola Branca 90g', NULL, 9, NULL, 4.90, 250),
('Cola Bastão 40g', NULL, 9, NULL, 5.50, 200),
('Estojo Simples', NULL, 9, NULL, 14.90, 120),
('Estojo Duplo Compartimento', NULL, 9, NULL, 25.90, 100),
('Mochila Escolar Básica', NULL, 9, NULL, 89.90, 50),
('Mochila com Rodinhas', NULL, 9, NULL, 189.90, 30),
('Agenda Escolar 2025', NULL, 9, NULL, 25.00, 100),
('Canetinha Hidrocor 12 cores', NULL, 9, NULL, 18.90, 120),
('Lápis de Cor 12 cores', NULL, 9, NULL, 19.90, 200),
('Lápis de Cor 24 cores', NULL, 9, NULL, 36.90, 150),
('Giz de Cera 12 cores', NULL, 9, NULL, 9.90, 180),
('Tinta Guache 6 cores', NULL, 9, NULL, 14.50, 160),
('Tinta Guache 12 cores', NULL, 9, NULL, 26.00, 100),
('Pincel nº 6', NULL, 9, NULL, 4.00, 200),
('Pincel nº 12', NULL, 9, NULL, 6.00, 200),
('Papel Sulfite A4 500 folhas', NULL, 9, NULL, 28.90, 80),
('Bloco de Desenho A3', NULL, 9, NULL, 19.90, 100),
('Bloco de Desenho A4', NULL, 9, NULL, 12.90, 120),
('Papel Colorido A4 100 folhas', NULL, 9, NULL, 16.90, 90),
('Compasso Escolar', NULL, 9, NULL, 8.90, 150),
('Transferidor 180°', NULL, 9, NULL, 5.50, 200),
('Esquadro 45°', NULL, 9, NULL, 5.50, 200),
('Esquadro 60°', NULL, 9, NULL, 5.50, 200),
('Calculadora Escolar Simples', NULL, 9, NULL, 29.90, 90),
('Calculadora Científica', NULL, 9, NULL, 119.90, 40),
('Grampeador Pequeno', NULL, 9, NULL, 18.90, 100),
('Grampos nº10 (Caixa 1000 unid.)', NULL, 9, NULL, 5.90, 150),
('Fita Adesiva Transparente 12mm', NULL, 9, NULL, 3.50, 200),
('Fita Adesiva Larga 48mm', NULL, 9, NULL, 9.90, 100),
('Corretivo Líquido 18ml', NULL, 9, NULL, 6.90, 150),
('Corretivo em Fita', NULL, 9, NULL, 9.90, 120),
('Marcador de Texto Amarelo', NULL, 9, NULL, 5.90, 150),
('Marcador de Texto Rosa', NULL, 9, NULL, 5.90, 150),
('Marcador de Texto Azul', NULL, 9, NULL, 5.90, 150),
('Caneta Gel Colorida (Kit 6 cores)', NULL, 9, NULL, 24.90, 90),
('Caderno de Desenho Espiral', NULL, 9, NULL, 18.50, 100),
('Pasta Catálogo 50 plásticos', NULL, 9, NULL, 22.90, 80),
('Pasta Sanfonada 12 divisórias', NULL, 9, NULL, 28.90, 70),
('Envelope A4 Kraft (pacote 50)', NULL, 9, NULL, 34.90, 60),
('Envelope Ofício Branco (pacote 100)', NULL, 9, NULL, 25.90, 60),
('Lancheira Escolar', NULL, 9, NULL, 79.90, 50),
('Squeeze Garrafa 500ml', NULL, 9, NULL, 29.90, 70),
('Apagador de Quadro Branco', NULL, 9, NULL, 9.90, 100),
('Marcador Quadro Branco Azul', NULL, 9, NULL, 6.90, 100),
('Marcador Quadro Branco Preto', NULL, 9, NULL, 6.90, 100),
('Marcador Quadro Branco Vermelho', NULL, 9, NULL, 6.90, 100),
('Refil Caneta Azul', NULL, 9, NULL, 4.50, 120),
('Refil Caneta Preta', NULL, 9, NULL, 4.50, 120),
('Refil Caneta Vermelha', NULL, 9, NULL, 4.50, 120),
('Fichário Universitário', NULL, 9, NULL, 54.90, 60),
('Folhas Fichário Pautadas (96 folhas)', NULL, 9, NULL, 16.90, 80),
('Post-it 76x76mm (100 folhas)', NULL, 9, NULL, 9.90, 150),
('Post-it 38x51mm (100 folhas)', NULL, 9, NULL, 7.90, 150),
('Clip de Papel 33mm (100 unid.)', NULL, 9, NULL, 6.90, 100),
('Clip de Papel 50mm (100 unid.)', NULL, 9, NULL, 8.90, 100),
('Caneta Marca Texto (Kit 4 cores)', NULL, 9, NULL, 19.90, 90),
('Caderno Brochura 96 folhas', NULL, 9, NULL, 9.90, 150),
('Caderno de Anotações Pequeno', NULL, 9, NULL, 7.90, 150),
('Pasta L Plástica', NULL, 9, NULL, 2.90, 200),
('Pasta com Elástico', NULL, 9, NULL, 6.90, 200),
('Bloco de Notas A5', NULL, 9, NULL, 11.90, 150),
('Régua Flexível 30 cm', NULL, 9, NULL, 5.90, 150),
('Pincel Atômico Preto', NULL, 9, NULL, 4.90, 120),
('Pincel Atômico Azul', NULL, 9, NULL, 4.90, 120),
('Caneta Técnica 0.3mm', NULL, 9, NULL, 19.90, 80),
('Caneta Técnica 0.5mm', NULL, 9, NULL, 19.90, 80),
('Caneta Técnica 0.7mm', NULL, 9, NULL, 19.90, 80),
('Estojo Escolar Luxo 3 divisórias', NULL, 9, NULL, 39.90, 50),
('Mochila Executiva', NULL, 9, NULL, 199.90, 40),
('Bolsa Tote Escolar', NULL, 9, NULL, 129.90, 45),
('Caderno Inteligente A5', NULL, 9, NULL, 79.90, 50),
('Refil Caderno Inteligente A5', NULL, 9, NULL, 29.90, 80),
('Tinta para Caneta Técnica Preta', NULL, 9, NULL, 12.90, 100),
('Tinta para Caneta Técnica Azul', NULL, 9, NULL, 12.90, 100),
('Caneta Esferográfica Luxo', NULL, 9, NULL, 49.90, 40),
('Lapiseira 0.5mm', NULL, 9, NULL, 12.90, 150),
('Lapiseira 0.7mm', NULL, 9, NULL, 12.90, 150),
('Grafite 0.5mm (caixa)', NULL, 9, NULL, 5.90, 120),
('Grafite 0.7mm (caixa)', NULL, 9, NULL, 5.90, 120),
('Tesoura de Precisão', NULL, 9, NULL, 14.90, 100),
('Estojo Metálico com 12 lápis artísticos', NULL, 9, NULL, 59.90, 60),
('Estojo com 24 marcadores artísticos', NULL, 9, NULL, 129.90, 40),
('Bloco Canson A4 180g', NULL, 9, NULL, 34.90, 70),
('Caderno de Música Pautado', NULL, 9, NULL, 24.90, 80),
('Caneta Brush Pen (Kit 6 cores)', NULL, 9, NULL, 59.90, 50),
('Régua Metálica Inox 30 cm', NULL, 9, NULL, 14.90, 100),
('Compasso Profissional', NULL, 9, NULL, 24.90, 70),
('Transferidor Profissional Acrílico', NULL, 9, NULL, 9.90, 100),
('Pasta Arquivo 4cm', NULL, 9, NULL, 18.90, 80),
('Organizador de Mesa Plástico', NULL, 9, NULL, 32.90, 60),
('Organizador de Mesa Metálico', NULL, 9, NULL, 49.90, 50),
('Rolo de Papel Pardo 10m', NULL, 9, NULL, 22.90, 60),
('Rolo de Papel Manteiga 10m', NULL, 9, NULL, 19.90, 60),
('Rolo de Papel Vegetal 10m', NULL, 9, NULL, 24.90, 60);

-- PEDIDO EXEMPLO COM MATERIAIS ESCOLARES
INSERT INTO pedidos (id_cliente, data_pedido, valor_total)
VALUES (2, '2025-10-18', 0.00);

SET @id_pedido_material = LAST_INSERT_ID();

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario_compra) VALUES
(@id_pedido_material, (SELECT id_produto FROM produtos WHERE titulo = 'Caderno Universitário 200 folhas - Capa Dura' LIMIT 1), 2, 22.50),
(@id_pedido_material, (SELECT id_produto FROM produtos WHERE titulo = 'Lápis Preto HB nº2' LIMIT 1), 5, 1.50),
(@id_pedido_material, (SELECT id_produto FROM produtos WHERE titulo = 'Caneta Azul Bic Cristal' LIMIT 1), 3, 2.30),
(@id_pedido_material, (SELECT id_produto FROM produtos WHERE titulo = 'Borracha Branca Escolar' LIMIT 1), 2, 2.00),
(@id_pedido_material, (SELECT id_produto FROM produtos WHERE titulo = 'Mochila Escolar Básica' LIMIT 1), 1, 89.90);

-- VIEW DE MONITORAMENTO DE MATERIAIS ESCOLARES
CREATE OR REPLACE VIEW vw_estoque_materiais AS
SELECT 
    p.id_produto,
    p.titulo AS produto,
    p.preco,
    p.estoque,
    CASE 
        WHEN p.estoque <= 20 THEN 'Baixo Estoque'
        WHEN p.estoque BETWEEN 21 AND 100 THEN 'Estoque Regular'
        ELSE 'Estoque Alto'
    END AS status_estoque
FROM produtos p
JOIN categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Materiais Escolares'
ORDER BY p.titulo;

-- Deixando mais real a tabela
-- TABELA DE FORNECEDORES
CREATE TABLE fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_fornecedor VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    telefone VARCHAR(20),
    cnpj VARCHAR(18) UNIQUE,
    endereco VARCHAR(255)
);

-- ALTERA PRODUTOS PARA LIGAR A FORNECEDOR
ALTER TABLE produtos ADD COLUMN id_fornecedor INT NULL;
ALTER TABLE produtos
ADD CONSTRAINT fk_produto_fornecedor FOREIGN KEY (id_fornecedor)
REFERENCES fornecedores(id_fornecedor);

-- TABELA DE PAGAMENTOS
CREATE TABLE pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    forma_pagamento ENUM('Cartão de Crédito', 'Pix', 'Boleto', 'Dinheiro') NOT NULL,
    valor_pago DECIMAL(10, 2) NOT NULL,
    data_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_pagamento ENUM('Pendente', 'Pago', 'Cancelado') DEFAULT 'Pendente',
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);

-- LOG DE MOVIMENTAÇÕES DE ESTOQUE
CREATE TABLE log_movimentacoes (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    tipo_movimentacao ENUM('Venda', 'Reposição', 'Cancelamento') NOT NULL,
    quantidade INT NOT NULL,
    data_movimentacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    observacao VARCHAR(255),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- TRIGGER: REDUZ ESTOQUE E LOGA VENDA
DELIMITER $$

CREATE TRIGGER trg_baixar_estoque
AFTER INSERT ON itens_pedido
FOR EACH ROW
BEGIN
    UPDATE produtos
    SET estoque = estoque - NEW.quantidade
    WHERE id_produto = NEW.id_produto;

    INSERT INTO log_movimentacoes (id_produto, tipo_movimentacao, quantidade, observacao)
    VALUES (NEW.id_produto, 'Venda', NEW.quantidade, CONCAT('Item inserido no pedido ', NEW.id_pedido));
END$$

-- TRIGGER: REPOE ESTOQUE E LOGA CANCELAMENTO
CREATE TRIGGER trg_repor_estoque
AFTER DELETE ON itens_pedido
FOR EACH ROW
BEGIN
    UPDATE produtos
    SET estoque = estoque + OLD.quantidade
    WHERE id_produto = OLD.id_produto;

    INSERT INTO log_movimentacoes (id_produto, tipo_movimentacao, quantidade, observacao)
    VALUES (OLD.id_produto, 'Cancelamento', OLD.quantidade, CONCAT('Item removido do pedido ', OLD.id_pedido));
END$$

DELIMITER ;

-- VIEW FINANCEIRA
CREATE OR REPLACE VIEW vw_relatorio_financeiro AS
SELECT 
    p.id_pedido,
    c.nome AS cliente,
    pg.forma_pagamento,
    pg.status_pagamento,
    p.data_pedido,
    p.valor_total AS total_pedido,
    COALESCE(SUM(i.quantidade * i.preco_unitario_compra), 0) AS valor_itens,
    (p.valor_total - COALESCE(SUM(i.quantidade * i.preco_unitario_compra), 0)) AS margem_aproximada
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
LEFT JOIN pagamentos pg ON p.id_pedido = pg.id_pedido
LEFT JOIN itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY p.id_pedido, c.nome, pg.forma_pagamento, pg.status_pagamento, p.data_pedido, p.valor_total
ORDER BY p.data_pedido DESC;

-- VIEW DE ESTOQUE ATUAL DETALHADO
CREATE OR REPLACE VIEW vw_estoque_detalhado AS
SELECT 
    p.id_produto,
    p.titulo,
    c.nome_categoria,
    f.nome_fornecedor,
    p.preco,
    p.estoque,
    CASE 
        WHEN p.estoque <= 10 THEN 'Crítico'
        WHEN p.estoque BETWEEN 11 AND 50 THEN 'Moderado'
        ELSE 'Adequado'
    END AS status_estoque
FROM produtos p
LEFT JOIN categorias c ON p.id_categoria = c.id_categoria
LEFT JOIN fornecedores f ON p.id_fornecedor = f.id_fornecedor
ORDER BY p.estoque ASC;

-- TABELAS DE CARGOS E FUNCIONÁRIOS
CREATE TABLE cargos (
    id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    nome_cargo VARCHAR(100) NOT NULL,
    salario_base DECIMAL(10, 2),
    nivel_acesso ENUM('Administrador', 'Gerente', 'Vendedor', 'Caixa', 'Estoquista') NOT NULL
);

CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_admissao DATE DEFAULT CURRENT_DATE,
    id_cargo INT NOT NULL,
    FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo)
);

-- INSERE CARGOS
INSERT INTO cargos (nome_cargo, salario_base, nivel_acesso) VALUES
('Gerente Geral', 6500.00, 'Administrador'),
('Gerente de Vendas', 4800.00, 'Gerente'),
('Caixa', 2800.00, 'Caixa'),
('Vendedor de Livros', 3000.00, 'Vendedor'),
('Estoquista', 2600.00, 'Estoquista');

-- INSERE 10 FUNCIONÁRIOS
INSERT INTO funcionarios (nome_funcionario, email, telefone, id_cargo) VALUES
('Carla Mendes', 'carla.mendes@livraria.com', '67991234501', 1),
('Rogério Lima', 'rogerio.lima@livraria.com', '67991234502', 2),
('Juliana Souza', 'juliana.souza@livraria.com', '67991234503', 3),
('Paulo Henrique', 'paulo.henrique@livraria.com', '67991234504', 3),
('Mariana Costa', 'mariana.costa@livraria.com', '67991234505', 4),
('Lucas Almeida', 'lucas.almeida@livraria.com', '67991234506', 4),
('André Rodrigues', 'andre.rodrigues@livraria.com', '67991234507', 4),
('Beatriz Nunes', 'beatriz.nunes@livraria.com', '67991234508', 5),
('Rafael Gomes', 'rafael.gomes@livraria.com', '67991234509', 5),
('Sofia Pereira', 'sofia.pereira@livraria.com', '67991234510', 5);

-- HISTÓRICO DE FECHAMENTO DIÁRIO
CREATE TABLE fechamento_diario (
    id_fechamento INT AUTO_INCREMENT PRIMARY KEY,
    data_fechamento DATE NOT NULL UNIQUE,
    total_vendas DECIMAL(12,2) DEFAULT 0,
    total_itens_vendidos INT DEFAULT 0,
    total_pagamentos DECIMAL(12,2) DEFAULT 0,
    total_estoque_atual INT DEFAULT 0,
    data_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- PROCEDURE DE FECHAMENTO DIÁRIO (executa resumo de vendas e estoque)
DELIMITER $$

CREATE PROCEDURE sp_fechamento_diario(IN p_data DATE)
BEGIN
    DECLARE v_total_vendas DECIMAL(12,2);
    DECLARE v_total_itens INT;
    DECLARE v_total_pagamentos DECIMAL(12,2);
    DECLARE v_total_estoque INT;

    SELECT 
        COALESCE(SUM(p.valor_total), 0),
        COALESCE(SUM(i.quantidade), 0)
    INTO v_total_vendas, v_total_itens
    FROM pedidos p
    LEFT JOIN itens_pedido i ON p.id_pedido = i.id_pedido
    WHERE DATE(p.data_pedido) = p_data;

    SELECT COALESCE(SUM(pg.valor_pago), 0)
    INTO v_total_pagamentos
    FROM pagamentos pg
    JOIN pedidos p ON pg.id_pedido = p.id_pedido
    WHERE DATE(p.data_pedido) = p_data
      AND pg.status_pagamento = 'Pago';

    SELECT COALESCE(SUM(estoque), 0)
    INTO v_total_estoque
    FROM produtos;

    INSERT INTO fechamento_diario (data_fechamento, total_vendas, total_itens_vendidos, total_pagamentos, total_estoque_atual)
    VALUES (p_data, v_total_vendas, v_total_itens, v_total_pagamentos, v_total_estoque)
    ON DUPLICATE KEY UPDATE
        total_vendas = v_total_vendas,
        total_itens_vendidos = v_total_itens,
        total_pagamentos = v_total_pagamentos,
        total_estoque_atual = v_total_estoque,
        data_registro = NOW();
END$$

DELIMITER ;

-- VIEW DE HISTÓRICO DIÁRIO DETALHADO
CREATE OR REPLACE VIEW vw_fechamento_resumo AS
SELECT 
    f.data_fechamento,
    f.total_vendas,
    f.total_itens_vendidos,
    f.total_pagamentos,
    f.total_estoque_atual,
    DATE_FORMAT(f.data_registro, '%Y-%m-%d %H:%i:%s') AS hora_registro
FROM fechamento_diario f
ORDER BY f.data_fechamento DESC;

-- EXEMPLO DE EXECUÇÃO DO FECHAMENTO
CALL sp_fechamento_diario(CURDATE());
