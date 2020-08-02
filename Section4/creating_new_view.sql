-- SQL-ON-DEMAND Creating new view using select

IF EXISTS(select * FROM sys.views where name = 'carsView')
DROP VIEW carsView
GO
CREATE VIEW carsView AS
SELECT * 
FROM OPENROWSET(
        BULK 'abfss://azureudemeycoursefs@azureudemeycourseadls.dfs.core.windows.net/car_dataset_s3.csv',
        FORMAT = 'CSV', 
        FIELDTERMINATOR =',', 
        ROWTERMINATOR = '\n'
    )
WITH (
	 Car_Name nvarchar(30),
	 Year nvarchar(30),
	 Selling_Price nvarchar(30),
	 Present_Price nvarchar(30),
	 Kms_Driven nvarchar(30),
	 Fuel_Type nvarchar(30),
	 Seller_Type nvarchar(30),
	 Transmission nvarchar(30),
	 Owner nvarchar(30)
) AS [r]
