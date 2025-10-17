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
    telefone VARCHAR(20) -- Novo detalhe
);

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    id_autor INT NOT NULL,      -- FK para Autores
    id_categoria INT NOT NULL,  -- FK para Categorias
    isbn VARCHAR(20) UNIQUE,    -- Novo detalhe (Identificador universal)
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
    id_item INT AUTO_INCREMENT PRIMARY KEY, -- Novo PK para simplicidade
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    -- Registra o preço no momento da venda 
    preco_unitario_compra DECIMAL(10, 2) NOT NULL, 

    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    UNIQUE (id_pedido, id_produto) -- Garante que um produto não seja duplicado no mesmo pedido
);

INSERT INTO autores (nome_autor) VALUES
('Sun Tzu'),          -- ID 1
('J.R.R. Tolkien'),   -- ID 2
('George Orwell'),    -- ID 3
('Yuval Noah Harari'),-- ID 4
('Frank Herbert'),    -- ID 5
('William Gibson'),   -- ID 6
('Ray Bradbury'),     -- ID 7
('Isaac Asimov'),     -- ID 8
('Jane Austen'),      -- ID 9 (Nova Coleção)
('Neil Gaiman');      -- ID 10 (Nova Coleção)

INSERT INTO categorias (nome_categoria) VALUES
('Estratégia'),        -- ID 1
('Fantasia'),          -- ID 2
('Distopia'),          -- ID 3
('Não-Ficção'),        -- ID 4
('Ficção Científica'), -- ID 5
('Clássicos'),         -- ID 6 (Nova Coleção)
('Romance Gótico');    -- ID 7 (Nova Coleção)

INSERT INTO clientes (nome, email, telefone) VALUES
('João da Silva', 'joao.silva@ufms.br', '67987654321'), -- ID 1
('Maria Oliveira', 'maria.oliveira@ufms.br', '67987654322'), -- ID 2
('Carlos Souza', 'carlos.souza@ufms.br', '67987654323'), -- ID 3
('Ana Costa', 'ana.costa@ufms.br', '67987654324'); -- ID 4 (Novo Cliente)

INSERT INTO produtos (titulo, id_autor, id_categoria, isbn, preco, estoque) VALUES
('A Arte da Guerra', 1, 1, '978-8571860002', 35.50, 15),
('O Hobbit', 2, 2, '978-8595083162', 52.90, 10),
('1984', 3, 3, '978-8535914849', 40.00, 22),
('Sapiens: Uma Breve História da Humanidade', 4, 4, '978-8543105741', 65.00, 5);

INSERT INTO produtos (titulo, id_autor, id_categoria, isbn, preco, estoque) VALUES
('Duna', 5, 5, '978-8544102604', 75.00, 30),
('Neuromancer', 6, 5, '978-8531901844', 48.90, 25),
('Fahrenheit 451', 7, 3, '978-8535916034', 42.50, 18),
('Fundação', 8, 5, '978-8576570773', 68.00, 12);

INSERT INTO produtos (titulo, id_autor, id_categoria, isbn, preco, estoque) VALUES
('Orgulho e Preconceito', 9, 6, '978-8582850392', 45.00, 20),
('Razão e Sensibilidade', 9, 6, '978-8582850408', 45.00, 15),
('Coraline', 10, 7, '978-8535916690', 55.00, 10);

INSERT INTO pedidos (id_cliente, data_pedido, valor_total) VALUES
(1, '2025-09-29', 111.90), -- Pedido 1: João
(2, '2025-09-30', 40.00),  -- Pedido 2: Maria
(3, '2025-10-01', 120.00), -- Pedido 3: Carlos
(4, '2025-10-17', 261.00); -- Pedido 4: Ana (Pedido com 3 itens diferentes!)

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario_compra) VALUES
(1, 1, 2, 35.50), -- 2x A Arte da Guerra (71.00)
(1, 2, 1, 40.90); -- 1x O Hobbit (40.90 - Valor total do Pedido 1: 111.90. Ajustei o preco_unitario do Hobbit para ser diferente do valor atual no produto para dar um exemplo de variação)


INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario_compra) VALUES
(2, 3, 1, 40.00); -- 1x 1984 (40.00)


INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario_compra) VALUES
(3, 3, 3, 40.00); -- 3x 1984 (120.00)


INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario_compra) VALUES
(4, 5, 2, 75.00), -- 2x Duna (150.00)
(4, 9, 1, 45.00), -- 1x Orgulho e Preconceito (45.00)
(4, 11, 1, 66.00); -- 1x Coraline (66.00 - Ajustei o valor no produto para ser mais realista. Total: 261.00)