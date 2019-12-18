--SELECT * FROM CLIENTE
--SELECT * FROM FINANCIAMENTO
--SELECT * FROM PARCELA

-- QUERY 1
-- Listar todos os clientes do estado de SP que tenham mais de 60% das parcelas pagas.
--------------------------------------------------------------------------------------

SELECT C.* 
FROM Cliente C
JOIN Financiamento F ON F.IdCLiente=C.IdCliente
WHERE C.UF = 'SP' 
AND (( SELECT COUNT(1) 
       FROM Parcela P 
	   WHERE P.DataPagamento IS NOT NULL
	   AND P.IdFinanciamento=F.IdFinanciamento) * 100 ) / 
	   (SELECT COUNT(1) 
       FROM Parcela P 
	   WHERE P.IdFinanciamento=F.IdFinanciamento) > 60
     


-- QUERY 2
-- Listar os primeiros 4 clientes que tenham alguma parcela com mais de 05 dias atrasadas (Data Vencimento maior que data atual E data pagamento nula)
------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT TOP 4 C.* 
FROM Cliente C
JOIN Financiamento F ON F.IdCLiente=C.IdCliente
JOIN Parcela P ON P.IdFinanciamento=F.IdFinanciamento
WHERE  P.DataPagamento IS NULL
AND DATEADD(DAY, 5,P.DataVenvimento) < GETDATE()



-- QUERY 3
-- Listar todos os clientes que já atrasaram em algum momento duas ou mais parcelas em mais de 10 dias, e que o valor do financiamento seja maior que R$ 10.000,00
------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT DISTINCT C.* 
FROM Cliente C
JOIN Financiamento F ON F.IdCLiente=C.IdCliente
WHERE  
F.ValorTotal > 10000
AND (SELECT COUNT(1) 
     FROM Parcela P 
	 WHERE P.IdFinanciamento = F.IdFinanciamento
	 AND DATEADD(DAY, 10,P.DataVenvimento) < P.DataPagamento
	 AND P.DataPagamento IS NOT NULL
	 ) > 1

	 select * from Parcela where IdFinanciamento = 1
	 UPDATE Parcela
	 SET DataPagamento = '2019-10-12'
	 WHERE IdParcela = 3