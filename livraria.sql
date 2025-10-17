
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

INSERT INTO clientes (nome, email) VALUES
('João da Silva', 'joao.silva@ufms.br'),
('Maria Oliveira', 'maria.oliveira@ufms.br'),
('Carlos Souza', 'carlos.souza@ufms.br');

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    categoria VARCHAR(100), -- Coluna adicionada
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL
);

-- Registros Iniciais (Existentes)
INSERT INTO produtos (titulo, autor, categoria, preco, estoque) VALUES
('A Arte da Guerra', 'Sun Tzu', 'Estratégia', 35.50, 15),
('O Hobbit', 'J.R.R. Tolkien', 'Fantasia', 52.90, 10),
('1984', 'George Orwell', 'Distopia', 40.00, 22),
('Sapiens: Uma Breve História da Humanidade', 'Yuval Noah Harari', 'Não-Ficção', 65.00, 5);


INSERT INTO produtos (titulo, autor, categoria, preco, estoque) VALUES
('Duna', 'Frank Herbert', 'Ficção Científica', 75.00, 30),
('Neuromancer', 'William Gibson', 'Ficção Científica', 48.90, 25),
('Fahrenheit 451', 'Ray Bradbury', 'Distopia', 42.50, 18),
('Fundação', 'Isaac Asimov', 'Ficção Científica', 68.00, 12);


CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL, 
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,

    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) 
);

-- =======================================================
-- Usando a nova estrutura e incluindo pedidos da nova coleção.
-- =======================================================
INSERT INTO pedidos (id_cliente, id_produto, quantidade, data_pedido, valor_total) VALUES

(1, 1, 2, '2025-09-29', 71.00),     
(2, 3, 1, '2025-09-30', 40.00),     
(3, 3, 3, '2025-10-01', 120.00),    

(1, 5, 1, '2025-10-15', 75.00),     
(2, 6, 2, '2025-10-16', 97.80),     
(3, 8, 1, '2025-10-16', 68.00);     