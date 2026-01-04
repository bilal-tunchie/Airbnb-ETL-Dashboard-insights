🏠 Airbnb Data Analysis – ETL to Power BI
📌 Project Overview
This project demonstrates an end-to-end ETL (Extract, Transform, Load) pipeline built to prepare Airbnb data for Power BI dashboards and business insights.
The goal of this project is to transform raw Airbnb data into clean, standardized, and business-ready datasets using SQL Server, then consume the data in Power BI for visualization and analysis.
⸻
📂 Data Source
• Dataset: Airbnb listings data
• Source: Kaggle
• Data Engineer: Mohamed (Shoutout for preparing and publishing the dataset 🙌)
⸻
🔁 ETL Architecture
The ETL process follows a structured data flow:
Source → SQL Server → Power BI
1️⃣ Extract
• Raw CSV files downloaded from Kaggle
• Loaded into SQL Server as raw tables
• Stored as-is with no transformations
• Batch processing using full load & truncate/insert
⸻
2️⃣ Transform
Data cleaning and transformation were performed entirely using SQL, including:
• ✔️ Checking and fixing column data types
• ✔️ Handling missing values (NULLs)
• ✔️ Standardizing values and formats
• ✔️ Creating property categories (Studio, Apartment, Hotel, etc.)
• ✔️ Filtering out invalid or inconsistent records
• ✔️ Renaming columns for clarity
• ✔️ Trimming and cleaning text fields
• ✔️ Removing unnecessary columns
• ✔️ Merging and appending related tables
• ✔️ Normalizing nested price items
• ✔️ Validating business logic (rooms, beds, revenue calculations)
The result is a set of cleaned and standardized tables ready for analytics.
⸻
3️⃣ Load
• Final datasets exposed as SQL Views
• Views represent business-ready data
• No additional load required
• Optimized for Power BI consumption
⸻
🧱 Data Model
• Flat and aggregated tables
• Fact-style tables for pricing and revenue
• Derived columns for:
• Total revenue
• Fees and discounts
• Nights and pricing metrics
⸻
📊 Power BI
• SQL Server connected directly to Power BI
• Data consumed from final views
• Dashboards focus on:
• Revenue analysis
• Pricing breakdowns
• Property categorization
• Data quality validation
• Business insights
⸻
🛠 Tools & Technologies
• SQL Server
• SQL (ETL & Data Transformation)
• Power BI
• Kaggle
• GitHub
⸻
🎯 Key Learning Outcomes
• Building a real-world ETL pipeline
• Preparing data specifically for BI tools
• Applying data cleaning best practices
• Translating raw data into business-ready datasets
• Designing analytics-friendly SQL views
⸻
📌 Next Steps
• Enhance dashboards with advanced DAX measures
• Add time-based analysis
• Optimize performance with indexing
• Expand dataset with additional Airbnb attributes
⸻
🙌 Credits
• Dataset: Kaggle
• Data Engineer: Mohamed
• Analysis & ETL: Bilal Mohamed
⸻
