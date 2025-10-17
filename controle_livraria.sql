
DELIMITER $$

CREATE PROCEDURE sp_criar_pedido (
    IN p_id_cliente INT,
    IN p_data_pedido DATE,
    IN p_produtos JSON
)
BEGIN
    DECLARE v_id_pedido INT;

    INSERT INTO pedidos (id_cliente, data_pedido, valor_total)
    VALUES (p_id_cliente, p_data_pedido, 0.00);

    SET v_id_pedido = LAST_INSERT_ID();

    INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario_compra)
    SELECT 
        v_id_pedido,
        JSON_UNQUOTE(JSON_EXTRACT(j.value, '$.id_produto')),
        JSON_UNQUOTE(JSON_EXTRACT(j.value, '$.quantidade')),
        JSON_UNQUOTE(JSON_EXTRACT(j.value, '$.preco_unitario'))
    FROM JSON_TABLE(p_produtos, '$[*]' COLUMNS (
        value JSON PATH '$'
    )) AS j;

    UPDATE pedidos
    SET valor_total = (
        SELECT COALESCE(SUM(quantidade * preco_unitario_compra), 0)
        FROM itens_pedido
        WHERE id_pedido = v_id_pedido
    )
    WHERE id_pedido = v_id_pedido;

    SELECT v_id_pedido AS novo_pedido_id;
END$$

DELIMITER ;

CREATE OR REPLACE VIEW vw_vendas_por_categoria AS
SELECT 
    cat.nome_categoria,
    SUM(i.quantidade * i.preco_unitario_compra) AS total_vendas,
    COUNT(DISTINCT p.id_pedido) AS total_pedidos,
    SUM(i.quantidade) AS total_itens_vendidos
FROM itens_pedido i
JOIN produtos pr ON i.id_produto = pr.id_produto
JOIN categorias cat ON pr.id_categoria = cat.id_categoria
JOIN pedidos p ON i.id_pedido = p.id_pedido
GROUP BY cat.nome_categoria
ORDER BY total_vendas DESC;

CREATE OR REPLACE VIEW vw_vendas_por_autor AS
SELECT 
    a.nome_autor,
    SUM(i.quantidade * i.preco_unitario_compra) AS total_vendas,
    COUNT(DISTINCT p.id_pedido) AS total_pedidos,
    SUM(i.quantidade) AS total_itens_vendidos
FROM itens_pedido i
JOIN produtos pr ON i.id_produto = pr.id_produto
JOIN autores a ON pr.id_autor = a.id_autor
JOIN pedidos p ON i.id_pedido = p.id_pedido
GROUP BY a.nome_autor
ORDER BY total_vendas DESC;
