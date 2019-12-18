CREATE DATABASE FinanBlack
GO
CREATE TABLE Cliente
(
	IdCliente INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Nome VARCHAR(250) NOT NULL ,
	UF VARCHAR(2) NOT NULL,
	Celular VARCHAR(11)

)

GO

CREATE TABLE Financiamento
(
	IdFinanciamento INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	IdCLiente INT NOT NULL,
	TipoFinanciamento VARCHAR(100) NOT NULL,
	ValorTotal MONEY NOT NULL,
	DtVencimento Date NOT NULL
	CONSTRAINT ID_CLIENTE FOREIGN KEY (IdCliente) REFERENCES Cliente (IdCliente) 
)

GO

CREATE TABLE Parcela
(
	IdParcela INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	IdFinanciamento INT NOT NULL,
	NumeroParcela INT NOT NULL,
	ValorParcela MONEY NOT NULL,
	DataVencimento DATE NOT NULL,
	DataPagamento DATE
	CONSTRAINT ID_FINANCIAMENTO FOREIGN KEY (IdFinanciamento) REFERENCES Financiamento (IdFinanciamento) 
)

GO 

INSERT INTO Cliente(Nome,UF,Celular)
VALUES('Cliente 1','SP','11999989999'),
	  ('Cliente 2','RJ','11789464653'),
	  ('Cliente 3','PR','11999989235'),
	  ('Cliente 4','SC','11789466666'),
	  ('Cliente 5','SP','11789777777')

INSERT INTO Financiamento(IdCLiente,TipoFinanciamento,ValorTotal,DtVencimento)
VALUES(1,'PESSOAL JURIDICO',100000.00,'2019-08-12'),
	  (2,'PESSOAL FISICA',25000.00,'2019-08-12'),
	  (3,'CREDITO IMOBILIARIO',80000.00,'2019-08-12'),
	  (4,'CONSIGNADO',6000.00,'2019-08-12'),
	  (5,'CREDITO DIRETO',39000.00,'2019-08-12')	

INSERT INTO Parcela(IdFinanciamento,NumeroParcela,ValorParcela,DataVencimento,DataPagamento)
VALUES(1,1,25000.00,'2019-08-12','2019-08-12'),
	  (1,2,25000.00,'2019-09-12','2019-09-12'),
	  (1,3,25000.00,'2019-10-12','2019-10-05'),
	  (1,4,25000.00,'2019-11-12','2019-11-05'),
	  (1,5,25000.00,'2019-12-12','2019-12-13'),
	  (1,6,25000.00,'2020-01-12',NULL),

	  (2,1,1100.00,'2019-06-01','2019-08-12'),
	  (2,2,1100.00,'2019-07-01','2019-09-14'),
	  (2,3,1100.00,'2019-08-01','2019-10-30'),
	  (2,4,1100.00,'2019-09-01',NULL),
	  (2,5,1100.00,'2019-10-01',NULL),
	  (2,6,1100.00,'2020-11-01',NULL),
	  (2,7,1100.00,'2019-12-01',NULL),
	  (2,8,1100.00,'2020-01-01',NULL),
	  (2,9,1100.00,'2020-02-01',NULL),
	  (2,10,1100.00,'2020-03-01',NULL),
	  (2,11,1100.00,'2020-04-01',NULL),
	  (2,12,1100.00,'2020-05-01',NULL),
	  
	  (3,1,28100.00,'2019-06-01','2019-06-12'),
	  (3,2,28100.00,'2019-07-01','2019-07-14'),
	  (3,3,28100.00,'2019-08-01','2019-08-01'),
	  (3,4,28100.00,'2019-09-01','2019-09-01'),
	  (3,5,28100.00,'2019-10-01','2019-10-01'),
	  (3,6,28100.00,'2020-11-01','2020-11-01'),
	  (3,7,28100.00,'2019-12-01','2019-12-01'),
	  (3,8,28100.00,'2020-01-01',NULL),
	  (3,9,28100.00,'2020-02-01',NULL),
	  (3,10,28100.00,'2020-03-01',NULL),
	  (3,11,28100.00,'2020-04-01',NULL),
	  (3,12,28100.00,'2020-05-01',NULL)	,
	  
	  (4,1,250.00,'2019-03-01','2019-08-12'),
	  (4,2,250.00,'2019-04-01','2019-09-14'),
	  (4,3,250.00,'2019-05-01','2019-10-30'),
	  (4,4,250.00,'2019-06-01',NULL),
	  (4,5,250.00,'2019-07-01',NULL),
	  (4,6,250.00,'2020-08-01',NULL),
	  (4,7,250.00,'2019-09-01',NULL),
	  (4,8,250.00,'2019-10-01',NULL),
	  (4,9,250.00,'2019-11-01',NULL),
	  (4,10,250.00,'2019-12-01',NULL),
	  (4,11,250.00,'2020-01-01',NULL),
	  (4,12,250.00,'2020-02-01',NULL),
	  
	  (5,1,28100.00,'2019-06-01','2019-06-12'),
	  (5,2,28100.00,'2019-07-01','2019-07-14'),
	  (5,3,28100.00,'2019-08-01','2019-08-01'),
	  (5,4,28100.00,'2019-09-01','2019-09-01'),
	  (5,5,28100.00,'2019-10-01','2019-10-01'),
	  (5,6,28100.00,'2020-11-01','2020-11-01'),
	  (5,7,28100.00,'2019-12-01','2019-12-01'),
	  (5,8,28100.00,'2020-01-01','2020-01-01'),
	  (5,9,28100.00,'2020-02-01',NULL),
	  (5,10,28100.00,'2020-03-01',NULL),
	  (5,11,28100.00,'2020-04-01',NULL),
	  (5,12,28100.00,'2020-05-01',NULL)			