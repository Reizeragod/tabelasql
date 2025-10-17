
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL
);

INSERT INTO produtos (titulo, autor, preco, estoque) VALUES
('A Arte da Guerra', 'Sun Tzu', 35.50, 15),
('O Hobbit', 'J.R.R. Tolkien', 52.90, 10),
('1984', 'George Orwell', 40.00, 22),
('Sapiens: Uma Breve História da Humanidade', 'Yuval Noah Harari', 65.00, 5);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO pedidos (id_produto, quantidade, data_pedido, valor_total) VALUES
(1, 2, '2025-09-29', 71.00),   
(3, 1, '2025-09-30', 40.00),   
(2, 3, '2025-10-01', 158.70);  
