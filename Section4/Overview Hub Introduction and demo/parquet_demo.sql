--READING PARQUET FILE FROM ADLS USING SQL ON DEMAND
SELECT * FROM
 OPENROWSET(BULK 'abfss://azureudemycoursefs@azureudemycourseadls.dfs.core.windows.net/sample.parquet', format= 'parquet') as rows
