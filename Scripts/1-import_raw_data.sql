/*
===============================================================================
Script Purpose:
    This script import the data using bulk method.
	Then creates Gold Table with unique id for each row. 
    The Gold Table represents the first uncleaned data, to being the tranformation for (Star Schema).
===============================================================================
*/

-- =============================================================================
-- Create Dimension: gold.dim_customers
-- =============================================================================

USE MyDatabase;

-- Silver table (Import raw data)
uu

CREATE TABLE airbnb.Silver (
    property_id       NVARCHAR(50),
    name_             NVARCHAR(255) COLLATE Arabic_CI_AI,
    bathrooms         DECIMAL(10, 2),
    bedrooms          INT,
	beds              INT,
    city              NVARCHAR(50),
	isSuperhost       NVARCHAR(50),
    lat               DECIMAL(38, 10),
    lng               DECIMAL(38, 10),
	persons           INT,
	reviewsCount      INT,
	rating            DECIMAL(10, 2),
	property_type     NVARCHAR(50),
	owner_Id          INT,
	address_          NVARCHAR(255),
	amenityIds        NVARCHAR(max),
	cancelPolicy      NVARCHAR(255),
	price_items       NVARCHAR(max),
	check_in          NVARCHAR(255),
	check_out         NVARCHAR(255)
);
GO

BULK INSERT airbnb.Silver
FROM 'C:\Users\b.abdulwahab\Downloads\archive\airbnb_full.txt'
WITH (
    FIELDTERMINATOR = '	',  -- The delimiter used in CSV file
    ROWTERMINATOR = '\n',   -- The row terminator (usually newline)
    FIRSTROW = 2,            -- Skips the header row in the CSV
	CODEPAGE = '65001'
);

SELECT * FROM airbnb.Silver;


-- Gold table (Import raw data) with identifing unique id for each row
IF OBJECT_ID('airbnb.Gold', 'U') IS NOT NULL
    DROP TABLE airbnb.Gold;
GO

CREATE TABLE airbnb.Gold (
	id INT PRIMARY KEY IDENTITY(1,1),
    property_id       NVARCHAR(50),
    name_             NVARCHAR(100),
    bathrooms         DECIMAL(10, 2),
    bedrooms          INT,
	beds              INT,
    city              NVARCHAR(50),
	isSuperhost       NVARCHAR(50),
    lat               DECIMAL(38, 10),
    lng               DECIMAL(38, 10),
	persons           INT,
	reviewsCount      INT,
	rating            DECIMAL(10, 2),
	property_type     NVARCHAR(50),
	owner_Id          INT,
	address_          NVARCHAR(255),
	amenityIds        NVARCHAR(max),
	cancelPolicy      NVARCHAR(255),
	price_items       NVARCHAR(max),
	check_in          NVARCHAR(255),
	check_out         NVARCHAR(255)
);
GO


INSERT INTO airbnb.Gold (
    property_id,
    name_,
    bathrooms,
    bedrooms,
	beds,
    city,
	isSuperhost,
    lat,
    lng,
	persons,
	reviewsCount,
	rating,
	property_type,
	owner_Id,
	address_,
	amenityIds,
	cancelPolicy,
	price_items,
	check_in,
	check_out
)

SELECT 
	property_id,
    name_,
    bathrooms,
    bedrooms,
	beds,
    city,
	isSuperhost,
    lat,
    lng,
	persons,
	reviewsCount,
	rating,
	property_type,
	owner_Id,
	address_,
	amenityIds,
	cancelPolicy,
	price_items,
	check_in,
	check_out
FROM (
	SELECT * FROM airbnb.Silver
)t

SELECT * FROM airbnb.Gold;


