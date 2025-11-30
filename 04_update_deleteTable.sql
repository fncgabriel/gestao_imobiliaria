PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

-------------------------------------------===== UPDATEs =====-------------------------------------------------------------
----------------------------Atualizar status de um imóvel para 'vendido' após fechamento de contrato-----------------------
UPDATE Imovel
SET status = 'vendido'
WHERE id_imovel = 1; -- ajuste o id conforme o banco

----------------------------------- Corrigir telefone de um cliente específico (exemplo)-----------------------------------
UPDATE Cliente
SET telefone = '51900009900'
WHERE nome = 'Thiago Ramos';


---------------------------------------------===== DELETEs =====----------------------------------------------------------
------------------------------------Remover visitas muito antigas (antes de 2024)------------------------------------------
DELETE FROM Visita
WHERE data_visita < '2024-01-01';

------------------------------------Remover imóveis marcados como 'removido' (regra de negócio)----------------------------
DELETE FROM Imovel
WHERE status = 'removido';

COMMIT;
