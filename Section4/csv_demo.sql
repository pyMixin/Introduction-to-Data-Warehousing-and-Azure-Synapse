--READING CSV FILE FROM ADLS USING SQL ON DEMAND
--OPENROWSET USING CVS FORMAT
SELECT  *   FROM OPENROWSET(
          BULK  'abfss://azureudemycoursefs@azureudemycourseadls.dfs.core.windows.net/datasets_33080_1320127_car data.csv', 
          FORMAT  =   'CSV', 
          FIELDTERMINATOR  = ',', 
          ROWTERMINATOR  =   '\n'     
) WITH (
  [Car_Name] VARCHAR (100)  COLLATE Latin1_General_BIN2, 
  [Year] smallint, 
  [Selling_Price] VARCHAR (100)  COLLATE Latin1_General_BIN2, 
  [Present_Price] VARCHAR (100)  COLLATE Latin1_General_BIN2, 
  [Kms_Driven] bigint, 
  [Fuel_Type] VARCHAR (100)  COLLATE Latin1_General_BIN2, 
  [Seller_Type VARCHAR (100)  COLLATE Latin1_General_BIN2, 
  [Transmission] VARCHAR (100)  COLLATE Latin1_General_BIN2, 
  [Owner] VARCHAR (100)  COLLATE Latin1_General_BIN2
)  AS [r] 
WHERE  
  Car_Name ='ritz' AND year=2014
