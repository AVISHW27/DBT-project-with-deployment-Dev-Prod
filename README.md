# 🚀 Modern Data Pipeline: dbt & Databricks (Dev/Prod Deployment)

A complete, end-to-end data transformation and modeling pipeline built using **dbt (Data Build Tool)** and **Databricks Unity Catalog**. This project showcases modern data engineering patterns, including medallion architecture (`bronze`, `silver`, `gold`), Slowly Changing Dimensions (SCD Type 2) tracking via snapshots, source declarations, modular macros, and secure Git deployment.

---

## 🏗️ Architecture & Environment Overview

* **Cloud Platform**: Databricks (Serverless Starter Warehouse)
* **Catalogs & Schemas**: 
  * `dbt_development` & `dbt_production`
  * **Bronze Layer**: Raw ingested data (`sales`, `items`, dimensions/facts)
  * **Silver Layer**: Cleaned, deduplicated intermediate models
  * **Gold Layer**: Production-ready data models and historical tracking snapshots
* **Transformation Engine**: dbt Core with the `dbt-databricks` adapter
* **Version Control**: Git & GitHub with security best practices (Secret protection compliance)

---

## 📂 Project Directory Structure

```text
DBT_Project/
├── analyses/           # Ad-hoc analytical queries
├── macros/             # Reusable Jinja-based custom SQL snippets
├── models/             # Transformation layers (Bronze & Silver)
│   ├── bronze/         # Source definitions & raw ingest models
│   └── properties.yml  # Documentation and data tests
├── snapshots/          # SCD Type 2 tracking configurations (e.g., gold_items)
├── seeds/              # Static reference CSV seed files
├── dbt_project.yml     # Core project configurations
└── profiles.yml        # Local workspace connection configurations (Git-ignored)
```

---

## 🔑 Key Technical Highlights

1. **Medallion Architecture Implementation**:
   * Structured data flow from raw ingestion (`bronze`) through intermediate standardization (`silver`) up to business-level aggregates and history (`gold`).
2. **SCD Type 2 Tracking (Snapshots)**:
   * Configured timestamp-based snapshots to maintain historical audit trails for attributes (such as item updates and categorical shifts) while avoiding primary key conflicts in underlying sources.
3. **Modular & Reusable Code (Jinja Macros)**:
   * Leveraged Jinja scripting inside the `macros/` folder to adhere to DRY (Don't Repeat Yourself) principles across models and snapshots.
4. **Environment Separation**:
   * Setup explicit `dev` and `prod` targets in `profiles.yml` to safely promote code changes across development and production catalogs.

---

## ⚙️ Getting Started & Local Setup

### 1. Prerequisites
Ensure you have Python installed along with the dbt Databricks adapter:
```bash
pip install dbt-databricks
```

### 2. Configure Your Profile (`profiles.yml`)
Set up your local connection profile pointing to your Databricks workspace:
```yaml
DBT_Project:
  outputs:
    dev:
      catalog: dbt_development
      host: <your-workspace-host>.cloud.databricks.com
      http_path: /sql/1.0/warehouses/<your-warehouse-id>
      schema: bronze
      threads: 1
      token: <your-databricks-token>
      type: databricks

    prod:
      catalog: dbt_production
      host: <your-workspace-host>.cloud.databricks.com
      http_path: /sql/1.0/warehouses/<your-warehouse-id>
      schema: bronze
      threads: 1
      token: <your-databricks-token>
      type: databricks
  target: dev
```

### 3. Running dbt Commands
* **Test connection**: `dbt debug`
* **Run models**: `dbt run`
* **Execute snapshots**: `dbt snapshot`

---

## 🛡️ Security & Git Best Practices
* **Secret Management**: Connection profiles containing sensitive tokens (`profiles.yml`) are strictly omitted from tracking via `.gitignore` to prevent unauthorized access and pass GitHub push protection checks.

---

## 👨‍💻 Author
**Avishkar**  
*Data Engineering & Modern Data Stack Practitioner*
