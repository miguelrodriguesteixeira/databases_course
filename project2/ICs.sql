--------- ICs.SQL -------------
-- (RI-1) Nenhum empregado pode ter menos de 18 anos de idade
CREATE OR REPLACE FUNCTION VerificarIdadeEmployee()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM employee WHERE date_part('year', age(bdate)) < 18) THEN
        RAISE EXCEPTION 'Nenhum empregado pode ter menos de 18 anos de idade.';
    END IF;

    RETURN NEW;
END;
$$;

-- Trigger para disparar a verificação de idade do empregado antes de inserir ou atualizar um registro
CREATE TRIGGER VerificarIdadeEmployeeTrigger
BEFORE INSERT OR UPDATE ON employee
FOR EACH ROW
EXECUTE FUNCTION VerificarIdadeEmployee();
----------------------------------------------------------------------------

-- (RI-2) Um 'Workplace' é obrigatoriamente um 'Office' ou 'Warehouse' mas não pode ser ambos
CREATE OR REPLACE FUNCTION VerificarWorkplace()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF (NEW.address IN (SELECT address FROM office)) THEN
        IF (NEW.address IN (SELECT address FROM warehouse)) THEN
            RAISE EXCEPTION 'Um Workplace não pode ser um Office e Warehouse simultaneamente.';
        END IF;
    ELSE
        IF (NEW.address NOT IN (SELECT address FROM warehouse)) THEN
            RAISE EXCEPTION 'Um Workplace deve ser um Office ou Warehouse.';
        END IF;
    END IF;
    RETURN NEW;
END;
$$;

-- Trigger para disparar a verificação do tipo de Workplace antes de inserir ou atualizar um registro
CREATE TRIGGER  VerificarWorkplaceTrigger
BEFORE INSERT OR UPDATE ON workplace
FOR EACH ROW
EXECUTE FUNCTION  VerificarWorkplace();

----------------------------------------------------------------------------

-- (RI-3) Uma 'Order' tem de figurar obrigatoriamente em 'Contains'.
CREATE OR REPLACE FUNCTION VerificarOrderContains()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM contains WHERE order_no = NEW.order_no) THEN
        RAISE EXCEPTION 'Uma ''Order'' tem de figurar obrigatoriamente em ''Contains''.';
    END IF;
    RETURN NEW;
END;
$$;

-- Trigger para disparar a verificação de uma Order em Contains antes de inserir ou atualizar um registro
CREATE TRIGGER VerificarOrderContainsTrigger
BEFORE INSERT OR UPDATE ON orders
FOR EACH ROW
EXECUTE FUNCTION VerificarOrderContains();
