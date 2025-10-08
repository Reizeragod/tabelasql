
-- 1. Criação da Tabela 'produtos'
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL
);

-- 2. Inserção de pelo menos três registros na Tabela 'produtos'
INSERT INTO produtos (titulo, autor, preco, estoque) VALUES
('A Arte da Guerra', 'Sun Tzu', 35.50, 15),
('O Hobbit', 'J.R.R. Tolkien', 52.90, 10),
('1984', 'George Orwell', 40.00, 22),
('Sapiens: Uma Breve História da Humanidade', 'Yuval Noah Harari', 65.00, 5);

-- 3. Criação da Tabela 'pedidos' com chave estrangeira
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    -- Define a chave estrangeira (FOREIGN KEY) que liga o pedido ao produto
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- 4. Inserção de pelo menos três registros na Tabela 'pedidos'
-- É importante que os id_produto inseridos aqui existam na tabela 'produtos'.
INSERT INTO pedidos (id_produto, quantidade, data_pedido, valor_total) VALUES
(1, 2, '2025-09-29', 71.00),   -- 2x 'A Arte da Guerra' (2 * 35.50)
(3, 1, '2025-09-30', 40.00),   -- 1x '1984'
(2, 3, '2025-10-01', 158.70);  -- 3x 'O Hobbit' (3 * 52.90)