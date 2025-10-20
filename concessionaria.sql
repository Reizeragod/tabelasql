-- 1. CRIAÇÃO DAS TABELAS ESTRUTURAIS 

-- 1.1 Tabela CARGOS 
CREATE TABLE cargos (
    id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    nome_cargo VARCHAR(100) NOT NULL UNIQUE,
    departamento VARCHAR(100) NOT NULL
);

-- 1.2 Tabela CLIENTES 
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(255) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    nome_contato VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(255) UNIQUE
);

-- 1.3 Tabela FORNECEDORES 
CREATE TABLE fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(255) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(255)
);

-- 1.4 Tabela PROMOCOES_SAZONAIS 
CREATE TABLE promocoes_sazonais (
    id_promocao INT AUTO_INCREMENT PRIMARY KEY,
    nome_promocao VARCHAR(150) NOT NULL,
    periodo_inicio DATE NOT NULL,
    periodo_fim DATE NOT NULL,
    tipo_desconto ENUM('Porcentagem', 'ValorFixo') NOT NULL,
    valor_desconto DECIMAL(5, 2) NOT NULL,
    status ENUM('Ativa', 'Inativa')
);

-- 2.1 Tabela FUNCIONARIOS 
CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_contratacao DATE NOT NULL,
    id_cargo INT NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    status ENUM('Ativo', 'Férias', 'Licença') NOT NULL,
    porcentagem_comissao DECIMAL(4, 2) DEFAULT 0.00, 
    
    FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo)
);

-- 2.2 Tabela PEÇAS 
CREATE TABLE pecas (
    id_peca INT AUTO_INCREMENT PRIMARY KEY,
    nome_peca VARCHAR(255) NOT NULL,
    codigo_sku VARCHAR(50) UNIQUE NOT NULL,
    descricao TEXT,
    preco_custo DECIMAL(10, 2) NOT NULL,
    preco_venda DECIMAL(10, 2) NOT NULL,
    estoque_atual INT NOT NULL DEFAULT 0,
    localizacao_prateleira VARCHAR(50)
);

-- 2.3 Tabela VEICULOS 
CREATE TABLE veiculos (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) UNIQUE NOT NULL,
    marca VARCHAR(100),
    modelo VARCHAR(100),
    ano YEAR,
    km_atual INT NOT NULL,
    id_cliente INT NOT NULL, 

    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- 3.1 Tabela VENDAS 
CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL, 
    data_venda DATETIME NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    id_promocao INT, 

    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES funcionarios(id_funcionario),
    FOREIGN KEY (id_promocao) REFERENCES promocoes_sazonais(id_promocao)
);

-- 3.2 Tabela ITENS_VENDA 
CREATE TABLE itens_venda (
    id_item_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    id_peca INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario_vendido DECIMAL(10, 2) NOT NULL, 

    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_peca) REFERENCES pecas(id_peca),
    UNIQUE (id_venda, id_peca)
);

-- 3.3 Tabela MOVIMENTACAO_ESTOQUE 
CREATE TABLE movimentacao_estoque (
    id_movimento INT AUTO_INCREMENT PRIMARY KEY,
    id_peca INT NOT NULL,
    tipo_movimento ENUM('ENTRADA', 'SAIDA') NOT NULL,
    quantidade INT NOT NULL,
    data_movimento DATETIME NOT NULL,
    id_responsavel INT, 
    id_fornecedor INT,  
    
    FOREIGN KEY (id_peca) REFERENCES pecas(id_peca),
    FOREIGN KEY (id_responsavel) REFERENCES funcionarios(id_funcionario),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);

-- 3.4 Tabela REVISOES 
CREATE TABLE revisoes (
    id_revisao INT AUTO_INCREMENT PRIMARY KEY,
    id_veiculo INT NOT NULL,
    data_revisao DATE NOT NULL,
    km_revisao INT NOT NULL,
    km_proxima_revisao INT,
    consultor_responsavel INT NOT NULL, 
    servicos_realizados TEXT,
    valor_servico DECIMAL(10, 2),
    
    FOREIGN KEY (id_veiculo) REFERENCES veiculos(id_veiculo),
    FOREIGN KEY (consultor_responsavel) REFERENCES funcionarios(id_funcionario)
);

-- 4.1. Cargos e Departamentos 
INSERT INTO cargos (nome_cargo, departamento) VALUES
('Gerente Geral', 'Gestão'), 
('Especialista de RH', 'RH'), 
('Consultor de Vendas Sênior', 'Vendas'), 
('Vendedor Júnior', 'Vendas'), 
('Consultor Técnico (Oficina)', 'Oficina'), 
('Mecânico Chefe', 'Oficina'), 
('Chefe de Estoque', 'Estoque'), 
('Assistente de Estoque', 'Estoque'), 
('Recepcionista/Portaria', 'Portaria'); 

-- 4.2. Funcionários 
INSERT INTO funcionarios (nome, sobrenome, cpf, data_contratacao, id_cargo, salario, status, porcentagem_comissao) VALUES
('Geraldo', 'Costa', '11122233344', '2015-01-10', 1, 15000.00, 'Ativo', 0.00),  -- ID 1: Gerente
('Julia', 'Almeida', '11122233355', '2020-03-01', 2, 5000.00, 'Ativo', 0.00),   -- ID 2: RH
('Ricardo', 'Vaz', '22233344455', '2018-05-15', 3, 6000.00, 'Ativo', 5.00),    -- ID 3: Vendedor Sênior
('Paula', 'Dias', '33344455566', '2023-11-20', 4, 3000.00, 'Ativo', 2.50),     -- ID 4: Vendedor Júnior
('Mário', 'Lopes', '44455566677', '2019-08-10', 5, 5500.00, 'Ativo', 0.00),   -- ID 5: Consultor Oficina
('Paulo', 'Machado', '55566677788', '2017-06-25', 6, 7000.00, 'Ativo', 0.00),  -- ID 6: Mecânico Chefe
('Carlos', 'Santos', '66677788899', '2024-01-05', 7, 4000.00, 'Ativo', 0.00),  -- ID 7: Chefe Estoque
('Lia', 'Ribeiro', '77788899900', '2024-02-01', 9, 2500.00, 'Ativo', 0.00),    -- ID 8: Portaria
('André', 'Oliveira', '88899900011', '2023-04-10', 8, 3500.00, 'Ativo', 0.00), -- ID 9: Assistente Estoque
('Carina', 'Gomes', '99900011122', '2022-09-01', 3, 6200.00, 'Ativo', 4.50);  -- ID 10: Vendedor Sênior

-- 4.3. Clientes 
INSERT INTO clientes (razao_social, cnpj, nome_contato, telefone, email) VALUES
('MS DIESEL LOGÍSTICA S.A.', '01.234.567/0001-89', 'Roberto Silva', '6733001100', 'contato@msdiesel.com'), -- ID 1
('TRANSPORTE RÁPIDO LTDA', '89.765.432/0001-50', 'Ana Paula', '6733001101', 'frota@transrapido.com');        -- ID 2

-- 4.4. Fornecedores 
INSERT INTO fornecedores (razao_social, cnpj, telefone, email) VALUES
('PEÇAS BRASIL S.A.', '10.000.000/0001-10', '1140001000', 'pecasbr@forne.com'),      -- ID 1
('PNEUS MASTER', '20.000.000/0001-20', '1140001001', 'pneusm@forne.com'),            -- ID 2
('ÓLEO EXCELÊNCIA LTDA', '30.000.000/0001-30', '1140001002', 'oleoex@forne.com'),     -- ID 3
('FREIOS SEGUROS', '40.000.000/0001-40', '1140001003', 'freios@forne.com'),          -- ID 4
('ACESSÓRIOS LUXO', '50.000.000/0001-50', '1140001004', 'acessorios@forne.com');     -- ID 5

-- 4.5. Peças 
INSERT INTO pecas (nome_peca, codigo_sku, preco_custo, preco_venda, estoque_atual, localizacao_prateleira) VALUES
('Filtro de Óleo - Volvo FH', 'FV001', 50.00, 95.00, 50, 'A1-01'),  -- ID 1
('Pastilha de Freio Dianteira', 'PFD05', 120.00, 250.00, 30, 'B2-05'), -- ID 2
('Pneu 295/80 R22.5', 'PN001', 800.00, 1500.00, 100, 'C3-01'),      -- ID 3
('Lâmpada Farol H4', 'LH002', 15.00, 35.00, 200, 'A1-05'),           -- ID 4
('Óleo Diesel 15W40 (Galão)', 'OD1540', 250.00, 450.00, 40, 'D4-10'); -- ID 5

-- 4.6. Promoções Sazonais
INSERT INTO promocoes_sazonais (nome_promocao, periodo_inicio, periodo_fim, tipo_desconto, valor_desconto, status) VALUES
('Natal das Peças', '2025-12-01', '2025-12-31', 'Porcentagem', 15.00, 'Ativa'),
('Festa Junina do Pneu', '2026-06-01', '2026-06-30', 'ValorFixo', 50.00, 'Inativa');

-- 4.7. Veículos 
INSERT INTO veiculos (placa, marca, modelo, ano, km_atual, id_cliente) VALUES
('ABC1A23', 'VOLVO', 'FH 540', 2024, 15000, 1), -- ID 1
('DEF4B56', 'VOLVO', 'FH 540', 2024, 12000, 1); -- ID 2

-- 4.8. Movimentação de Estoque 
-- Entrada: Peça 1 (Filtro) do Fornecedor 1, Responsável: Chefe Estoque (ID 7)
INSERT INTO movimentacao_estoque (id_peca, tipo_movimento, quantidade, data_movimento, id_responsavel, id_fornecedor) VALUES
(1, 'ENTRADA', 50, '2025-10-10 09:00:00', 7, 1); 
-- Saída: Peça 2 (Pastilha) para a Oficina, Responsável: Assistente Estoque (ID 9)
INSERT INTO movimentacao_estoque (id_peca, tipo_movimento, quantidade, data_movimento, id_responsavel, id_fornecedor) VALUES
(2, 'SAIDA', 5, '2025-10-15 14:30:00', 9, NULL); 

-- 4.9. Vendas
-- Venda 1: Cliente 1 para o Vendedor 3 - Venda Grande
INSERT INTO vendas (id_cliente, id_vendedor, data_venda, valor_total, id_promocao) VALUES
(1, 3, '2025-10-17 10:00:00', 1700.00, 1); -- ID 1: Usando Promoção Natal

-- Venda 2: Cliente 2 para a Vendedora 4 
INSERT INTO vendas (id_cliente, id_vendedor, data_venda, valor_total, id_promocao) VALUES
(2, 4, '2025-10-17 11:30:00', 350.00, NULL); -- ID 2: Sem Promoção

-- 4.10. Itens de Venda 
-- Itens da Venda 1
INSERT INTO itens_venda (id_venda, id_peca, quantidade, preco_unitario_vendido) VALUES
(1, 3, 1, 1500.00), -- 1 Pneu
(1, 1, 2, 100.00);  -- 2 Filtros (Preço unitário antes do desconto)

-- Itens da Venda 2
INSERT INTO itens_venda (id_venda, id_peca, quantidade, preco_unitario_vendido) VALUES
(2, 2, 1, 250.00), -- 1 Pastilha
(2, 4, 3, 35.00);  -- 3 Lâmpadas

-- 4.11. Revisões 
-- Revisão 1: Veículo 1, Consultor 5 
INSERT INTO revisoes (id_veiculo, data_revisao, km_revisao, km_proxima_revisao, consultor_responsavel, servicos_realizados, valor_servico) VALUES
(1, '2025-09-01', 15000, 45000, 5, 'Troca de Óleo, Filtros e Alinhamento.', 850.00);

-- Revisão 2: Veículo 2, Consultor 5
INSERT INTO revisoes (id_veiculo, data_revisao, km_revisao, km_proxima_revisao, consultor_responsavel, servicos_realizados, valor_servico) VALUES
(2, '2025-10-05', 12000, 42000, 5, 'Check-up completo de suspensão.', 300.00);

-- Consulta simples
SELECT 
    id_peca, 
    nome_peca, 
    estoque_atual
FROM 
    pecas
ORDER BY 
    id_peca;