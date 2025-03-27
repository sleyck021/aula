CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

DELIMITER //

CREATE PROCEDURE inserir_cliente(
    IN p_nome VARCHAR(100), 
    IN p_email VARCHAR(100), 
    IN p_telefone VARCHAR(20)
)
BEGIN
    INSERT INTO clientes (nome, email, telefone) 
    VALUES (p_nome, p_email, p_telefone);
END //

CREATE PROCEDURE inserir_usuario(
    IN p_usuario VARCHAR(50), 
    IN p_senha VARCHAR(255)
)
BEGIN
    INSERT INTO usuarios (usuario, senha) 
    VALUES (p_usuario, p_senha);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE selecionar_clientes()
BEGIN
    SELECT * FROM clientes;
END //

CREATE PROCEDURE selecionar_usuarios()
BEGIN
    SELECT * FROM usuarios;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE atualizar_cliente(
    IN p_id INT, 
    IN p_nome VARCHAR(100), 
    IN p_email VARCHAR(100), 
    IN p_telefone VARCHAR(20)
)
BEGIN
    UPDATE clientes 
    SET nome = p_nome, email = p_email, telefone = p_telefone 
    WHERE id = p_id;
END //

CREATE PROCEDURE atualizar_usuario(
    IN p_id INT, 
    IN p_usuario VARCHAR(50), 
    IN p_senha VARCHAR(255)
)
BEGIN
    UPDATE usuarios 
    SET usuario = p_usuario, senha = p_senha 
    WHERE id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE deletar_cliente(IN p_id INT)
BEGIN
    DELETE FROM clientes WHERE id = p_id;
END //

CREATE PROCEDURE deletar_usuario(IN p_id INT)
BEGIN
    DELETE FROM usuarios WHERE id = p_id;
END //

DELIMITER ;