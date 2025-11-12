--DROP FUNCTION IF EXISTS registrar_auditoria_salario() CASCADE;

CREATE FUNCTION registrar_auditoria_salario() 
RETURNS TRIGGER 
AS $$
BEGIN 
	INSERT INTO funcionario_auditoria(id, salario_antigo, novo_salario)
	VALUES(OLD.id, OLD.salario, NEW.salario);
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;


--DROP TRIGGER IF EXISTS trg_salario_modificado ON funcionario;

CREATE TRIGGER trg_salario_modificado
--AFTER/BEFORE e INSERT/DELETE/UPDATE OF nome_coluna ON nome_tabela
AFTER UPDATE OF salario ON Funcionario
--FOR EACH ROW / STATEMENT
FOR EACH ROW
--EXECUTE FUNCTION/PROCEDURE
EXECUTE FUNCTION registrar_auditoria_salario();