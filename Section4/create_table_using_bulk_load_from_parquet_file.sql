--create table in sqlpool using bulk load from parquet file

IF NOT EXISTS (SELECT * FROM sys.objects WHERE NAME = 'cars_data' AND TYPE = 'U')
CREATE TABLE dbo.cars_data
	(
	 Car_Name nvarchar(30),
	 Year nvarchar(30),
	 Selling_Price nvarchar(30),
	 Present_Price nvarchar(30),
	 Kms_Driven nvarchar(30),
	 Fuel_Type nvarchar(30),
	 Seller_Type nvarchar(30),
	 Transmission nvarchar(30),
	 Owner nvarchar(30)
	)
WITH
	(
	DISTRIBUTION = ROUND_ROBIN,
	 CLUSTERED COLUMNSTORE INDEX
	 -- HEAP
	)
GO

--Uncomment the 4 lines below to create a stored procedure for data pipeline orchestration​                 
--CREATE PROC bulk_load_cars_data
--AS
--BEGIN
COPY INTO dbo.cars_data
(Car_Name 1, Year 2, Selling_Price 3, Present_Price 4, Kms_Driven 5, Fuel_Type 6, Seller_Type 7, Transmission 8, Owner 9)
FROM 'https://azureudemeycourseadls.dfs.core.windows.net/azureudemeycoursefs/cars_data.parquet'
WITH
(
	FILE_TYPE = 'PARQUET'
	,MAXERRORS = 0
	,COMPRESSION = 'snappy'
	,IDENTITY_INSERT = 'OFF'
)
--END
GO

SELECT TOP 100 * FROM cars_data
GO
