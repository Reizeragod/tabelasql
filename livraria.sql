
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