/*
===============================================================================
Script Purpose:
	Checking Total number of properties with price and the ones that don't have total price.  
	
	Then creating priceItems table which will be derived from Gold table (price_items column) 
		because this column is in json format with keys and values (rate, currency, total, priceItems). 

    The priceItems Table represents the price items for each property in the Fact_Table.

    It performs transformations and Pivoting from json format to normal table from the Gold table 
    to produce a clean, enriched, and business-ready dataset.
===============================================================================
*/

USE MyDatabase;

-- No total price - 1080
SELECT 
	id,
	price_items
FROM airbnb.GOLD
WHERE price_items LIKE '%None%';

-- With total price - 1280
SELECT 
	price_items,
	LEN(price_items) AS price_items_length
FROM airbnb.GOLD
WHERE price_items NOT LIKE '%None%'
ORDER BY LEN(price_items) DESC;


-- Get rate, currency, total
CREATE VIEW cleaned_priceItems AS (
	SELECT
		id,
		[rate],
		[currency],
		COALESCE([total], 0) AS total,
		[priceItems]
	FROM 
	(
		SELECT 
			id, 
			[key] ,
			[value]
		FROM(
				SELECT 
					id, 
					REPLACE( REPLACE(price_items, '''', '"')  , ': None', ': null' ) as price_items
				FROM airbnb.GOLD
	
		)j
		CROSS APPLY OPENJSON(price_items)
	) unclP
	PIVOT
	(
		MAX([value])
		FOR [key] IN ([rate], [currency], [total], [priceItems])
	) p
)

-- Create priceItems table
IF OBJECT_ID('airbnb.price_items', 'U') IS NOT NULL
    DROP TABLE airbnb.price_items;
GO

CREATE TABLE airbnb.price_items (
	id INT,
	rate INT,
	currency NVARCHAR(50)
);
GO

INSERT INTO airbnb.price_items (
	id,
	rate,
	currency
)

SELECT
	id,
	rate,
	currency
FROM cleaned_priceItems;


SELECT * FROM airbnb.price_items;