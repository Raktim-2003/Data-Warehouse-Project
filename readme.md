# 📊 Data Warehouse and Analytics Project

A hands-on Data Engineering and Data Analytics project focused on building a modern SQL-based Data Warehouse using a three-layer Medallion Architecture (Bronze, Silver, and Gold).

The project demonstrates how raw data from CRM and ERP source systems can be ingested, cleaned, transformed, integrated, and structured into an analytical data model to generate meaningful business insights.

## 🏗️ Data Architecture

This project follows the **Medallion Architecture**, consisting of three layers:

**Bronze → Silver → Gold**

Each layer serves a specific purpose in the data processing pipeline.

### 🥉 Bronze Layer – Raw Data Ingestion

The Bronze Layer stores raw data directly from the source systems without applying major transformations.

**Key Operations:**
- Imported raw CSV datasets from CRM and ERP systems.
- Loaded source data into MySQL database tables.
- Preserved the original structure of the source data.
- Organized raw data for further processing.

**Objective:** Maintain source data in its original form and establish the foundation for the data warehouse.

### 🥈 Silver Layer – Data Cleaning & Transformation

The Silver Layer focuses on improving data quality, consistency, and reliability.

**Key Operations:**
- Handled NULL values and missing data.
- Cleaned inconsistent and duplicate records.
- Standardized data formats and values.
- Converted integer-based date values into appropriate date formats.
- Applied data cleansing and transformation techniques.
- Prepared structured datasets for analytical processing.

**Objective:** Transform raw datasets into clean, standardized, and reliable data.

### 🥇 Gold Layer – Business-Ready Data Modeling

The Gold Layer contains the final transformed datasets, structured for analytical queries and reporting.

**Key Operations:**
- Designed Fact Tables and Dimension Tables.
- Implemented Star Schema data modeling.
- Integrated cleaned CRM and ERP data.
- Organized business-ready datasets.
- Performed analytical SQL queries to generate business insights.

**Objective:** Provide a structured data model that supports business intelligence, reporting, and data-driven decision-making.

## 🔄 ETL Pipeline Workflow

The project follows an end-to-end ETL workflow:

1. **Extract:** Collect raw datasets from CRM and ERP CSV files.
2. **Load:** Import source data into the Bronze Layer.
3. **Transform:** Clean, standardize, and process data in the Silver Layer.
4. **Model:** Build Fact and Dimension Tables in the Gold Layer.
5. **Analyze:** Execute analytical SQL queries to identify business trends and insights.

## 🎯 Project Objectives

The primary objective is to develop a centralized Data Warehouse that integrates data from multiple source systems and makes it suitable for analytical reporting.

The project focuses on:

- Understanding modern Data Warehouse Architecture.
- Implementing ETL pipelines using SQL.
- Integrating CRM and ERP datasets.
- Improving data quality through cleansing and standardization.
- Designing dimensional data models.
- Performing SQL-based business analysis.

## 📈 Analytical Focus Areas

The Gold Layer supports analytical exploration in the following areas:

- **Customer Behavior:** Understanding customer information and purchasing patterns.
- **Product Performance:** Evaluating product-related sales performance.
- **Sales Trends:** Analyzing sales performance and identifying business trends.

## 🛠️ Technologies & Tools

| Category | Technology |
|---|---|
| Database | MySQL |
| Query Language | SQL |
| Data Sources | CSV Files |
| Architecture | Medallion Architecture |
| Data Engineering | ETL Pipeline |
| Data Modeling | Star Schema |
| Modeling Components | Fact Tables & Dimension Tables |
| Version Control | Git & GitHub |

## 📁 Repository Structure


```text
ETL_PROJECT/
├── Dataset/
│   ├── source_crm/
│   │   ├── cust_info.csv
│   │   ├── prd_info.csv
│   │   └── sales_details.csv
│   └── source_erp/
│       ├── CUST_AZ12.csv
│       ├── LOC_A101.csv
│       └── PX_CAT_G1V2.csv
│
├── Quarry/
│   ├── bronze/
│   │   ├── create_crm_tables.sql
│   │   ├── create_erp_tables.sql
│   │   ├── load_crm_tables.sql
│   │   └── load_erp_table.sql
│   ├── silver/
│   │   ├── create_crm_table.sql
│   │   ├── create_erp_tables.sql
│   │   ├── transfrom_load_crm_table.sql
│   │   └── transfrom_load_erp_table.sql
│   ├── gold/
│   │   └── gold_dim_fact.sql
│   └── init.sql
│
├── .gitignore
└── README.md
```

---


## 💡 Key Learnings

Through this project, I gained practical experience in:

- Building a multi-layer Data Warehouse.
- Understanding ETL pipeline development.
- Working with CRM and ERP source data.
- Writing SQL queries for data transformation.
- Handling missing values and inconsistent records.
- Performing data type conversions and standardization.
- Designing Fact and Dimension Tables.
- Implementing Star Schema modeling.
- Preparing structured data for business analysis.

## 🚀 Future Enhancements

- Automate the ETL workflow.
- Implement advanced data quality checks.
- Optimize SQL queries and database performance.
- Build interactive dashboards using Power BI.
- Explore advanced analytical techniques.

## 📚 Learning Reference & Acknowledgment

This project was developed as a practical learning implementation inspired by the **Data Warehouse and Analytics Project by Data With Baraa**.

Special thanks to **Baraa Khatib Salkini (Data With Baraa)** for the educational tutorials, project guidance, and resources that helped me understand modern Data Warehouse concepts and implementation.


## 👨‍💻 About Me

I am a Computer Science and Engineering graduate specializing in Data Science, with a background in Web Development and a growing focus on Data Analytics and Data Engineering.

My journey began with software and web development, where I developed a strong foundation in programming, problem-solving, and building applications. Over time, my interest evolved towards working with data, uncovering meaningful insights, and transforming raw information into actionable business intelligence.

Currently, I am focused on strengthening my expertise in SQL, Python, data analysis, data visualization, and data warehousing while building practical projects to solve real-world problems.

**Technical Focus:** SQL | Python | Excel | Power BI | Data Analytics | Data Warehousing

**Connect With Me:**
- GitHub: [Your GitHub Profile](https://github.com/yourusername)
- LinkedIn: [Your LinkedIn Profile](https://linkedin.com/in/yourusername)
---

⭐ If you find this project useful or interesting, feel free to explore the repository!