USE flowersdb

SELECT [Name] FROM Plantation;

SELECT Plantation.[Id],Plantation.[Name],Plantation.[Address], Flower.[Name],PlantationFlower.[Amount] 
	FROM dbo.Plantation,dbo.Flower,dbo.PlantationFlower
		WHERE Flower.[Id] = PlantationFlower.[FlowerId] AND PlantationFlower.[PlantationId] = Plantation.[Id];

SELECT Flower.[Id] , Flower.[Name],(SELECT COUNT(Plantation.[Id]) 
	FROM Plantation,PlantationFlower 
	WHERE  Flower.[Id] = PlantationFlower.[FlowerId] AND PlantationFlower.[PlantationId] = Plantation.[Id] ) AS 'Plantation number' FROM Flower;
	
SELECT Flower.[Id] , Flower.[Name],(SELECT COUNT(Plantation.[Id]) 
	FROM Plantation,PlantationFlower 
	WHERE   PlantationFlower.[Amount] > 1000 AND Flower.[Id] = PlantationFlower.[FlowerId] AND PlantationFlower.[PlantationId] = Plantation.[Id]) AS'Plantation number' FROM Flower; 

SELECT Flower.[Id], Flower.[Name], SupplyFlower.Amount
FROM Plantation, Flower, SupplyFlower
WHERE Plantation.[Name] = 'Altwood'

SELECT Supply.Id AS 'Supply ID', Plantation.[Name] AS 'Plantation name',Warehouse.[Name] AS 'Warehouse name',Supply.ScheduledDate FROM Supply,Plantation,Warehouse
	WHERE Supply.[Status] LIKE '%Closed%'AND Supply.WarehouseId = Warehouse.Id AND Supply.PlantationId = Plantation.Id AND 
		Supply.ClosedDate BETWEEN CAST(DATEADD(MONTH, -1, GETDATE()) AS DATE)  AND  CAST(GETDATE() AS DATE)