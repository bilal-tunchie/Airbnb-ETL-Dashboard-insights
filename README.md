# 🏠 Airbnb Data Analysis – ETL to Power BI

## 📌 Project Overview
This project demonstrates an end-to-end ETL (Extract, Transform, Load) pipeline built to prepare Airbnb data for Power BI dashboards and business insights.
The goal of this project is to transform raw Airbnb data into clean, standardized, and business-ready datasets using SQL Server, then consume the data in Power BI for visualization and analysis.

[Data Flow](https://samsung-crm.com/mena/KSA/251225_LC/Data-Flow.jpg) 


## 📂 Data Source
- Dataset: Riyadh Airbnb
- Source: Kaggle
- Data Engineer: [Mohammed Alsubaie](https://www.kaggle.com/datasets/mohammedalsubaie/riyadh-airbnb)


## 🔁 ETL Architecture
The ETL process follows a structured data flow:
Source → SQL Server → Power BI

## 1️⃣ Extract
- Raw CSV files downloaded from Kaggle
- Loaded into SQL Server as raw tables
- Stored as-is with no transformations
- Batch processing using full load & truncate/insert


## 2️⃣ Transform
Data cleaning and transformation were performed entirely using SQL, including:
- ✔️ Checking and fixing column data types
- ✔️ Handling missing values (NULLs)
- ✔️ Standardizing values and formats
- ✔️ Creating property categories (Studio, Apartment, Hotel, etc.)
- ✔️ Filtering out invalid or inconsistent records
- ✔️ Renaming columns for clarity
- ✔️ Trimming and cleaning text fields
- ✔️ Removing unnecessary columns
- ✔️ Merging and appending related tables
- ✔️ Normalizing nested price items
- ✔️ Validating business logic (rooms, beds, revenue calculations)
The result is a set of cleaned and standardized tables ready for analytics.

[Data Transform](https://samsung-crm.com/mena/KSA/251225_LC/Data-Transformation.jpg)


## 3️⃣ Load
- Final datasets exposed as SQL Views
- Views represent business-ready data
- No additional load required
- Optimized for Power BI consumption


## 🧱 Data Model
- Flat and aggregated tables
- Fact-style table


## 📊 Power BI
- Coming soon


## 🛠 Tools & Technologies
- SQL Server
- SQL (ETL & Data Transformation)
- Power BI
- Kaggle
- GitHub


## 🎯 Key Learning Outcomes
- Building a real-world ETL pipeline
- Preparing data specifically for BI tools
- Applying data cleaning best practices
- Translating raw data into business-ready datasets
- Designing analytics-friendly SQL views


## 📌 Next Steps
- Enhance dashboards with advanced DAX measures
- Add time-based analysis
- Optimize performance with indexing
- Expand dataset with additional Airbnb attributes


## 🙌 Credits
- Dataset: Kaggle
- Analysis & ETL: Bilal Mohamed [Bilal Mohamed](https://www.linkedin.com/in/bilal-mohamed-909b95201/) 
- Data Engineer: [Mohammed Alsubaie](https://www.kaggle.com/datasets/mohammedalsubaie/riyadh-airbnb)



## 📂 Repository Structure
```
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.drawio                      # Draw.io file shows all different techniquies and methods of ETL
│   ├── data_architecture.drawio        # Draw.io file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                # Draw.io file for the data flow diagram
│   ├── data_models.drawio              # Draw.io file for data models (star schema)
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
└── requirements.txt                    # Dependencies and requirements for the project
```
---
