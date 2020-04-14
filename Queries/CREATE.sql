USE flowersdb

CREATE TABLE Flower
(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE Plantation
(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] NVARCHAR(50) NOT NULL,
	[Address] NVARCHAR(50) NOT NULL
)

CREATE TABLE PlantationFlower
(
	PlantationId INT FOREIGN KEY REFERENCES Plantation(Id) NOT NULL,
	FlowerId INT FOREIGN KEY REFERENCES Flower(Id) NOT NULL,
	Amount INT NOT NULL
	PRIMARY KEY(PlantationId, FlowerId)
)

CREATE TABLE Supply
(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	PlantationId INT FOREIGN KEY REFERENCES Plantation(Id) NOT NULL,
	WarehouseId INT FOREIGN KEY REFERENCES Warehouse(Id) NOT NULL,
	SheduledDate DATE NOT NULL,
	ClosedDate DATE NOT NULL,
	[Status] NVARCHAR(50) NOT NULL
)

CREATE TABLE SupplyFlower
(
	SupplyId INT FOREIGN KEY REFERENCES Supply(Id) NOT NULL,
	FlowerId INT FOREIGN KEY REFERENCES Flower(Id) NOT NULL,
	Amount INT NOT NULL
	PRIMARY KEY(SupplyId, FlowerId)
)

CREATE TABLE Warehouse
(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] NVARCHAR(50) NOT NULL,
	[Address] NVARCHAR(50) NOT NULL
)

CREATE TABLE WarehouseFlower
(
	WarehouseId INT FOREIGN KEY REFERENCES Warehouse(Id) NOT NULL,
	FlowerId INT FOREIGN KEY REFERENCES Flower(Id) NOT NULL,
	Amount INT NOT NULL
	PRIMARY KEY(WarehouseId, FlowerId)
)