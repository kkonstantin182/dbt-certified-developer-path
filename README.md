# 🍔 US Fast-Food Restaurant Dashboard  

## 🛠️ Technologies Used  
<p align="left">
  <img src="https://github.com/kkonstantin182/dbt-certified-developer-path/blob/main/images/bigquery_logo.png" alt="BigQuery" width="100"/>
  <img src="https://github.com/kkonstantin182/dbt-certified-developer-path/blob/main/images/dbt_logo.png" alt="dbt" width="100"/>
  <img src="https://github.com/kkonstantin182/dbt-certified-developer-path/blob/main/images/google-looker-logo.png" alt="Looker Studio" width="100"/>
</p>  

- **BigQuery** – Cloud data warehouse for storing and querying large datasets  
- **dbt** – Data transformation tool for building and managing ELT pipelines  
- **Looker Studio** – Data visualization and reporting platform  

---

## 🔍 Project Overview  
This project demonstrates an end-to-end analytics solution using **BigQuery**, **dbt**, and **Looker Studio**.  

The dataset is **synthetic restaurant data** about a US fast-food chain (orders, customers, suppliers, products, etc.), generated with [jaffle-shop-generator](https://github.com/dbt-labs/jaffle-shop-generator).  

---

## 📊 Dashboard  

👉 **Explore the live dashboard:**  
[US Fast-Food Dashboard](https://lookerstudio.google.com/reporting/9e844560-9eea-47a6-bd4e-a7345f6d5791)  

⚠️ *If some charts don’t load properly, try refreshing the page.*  

📥 Or download as PDF:  
[Dashboard PDF](https://github.com/kkonstantin182/dbt-certified-developer-path/blob/main/images/US_Jaffle_Restaurant.pdf)  

### Dashboard Pages
1. **Overview Page** – General chain-wide metrics (revenue, customers, number of products sold, etc.) with a *year filter*.  
2. **Location Page** – Same metrics broken down per location, with a filter to analyze individual restaurants.  

---

## 🔄 Data Transformation (dbt)  

The dbt project follows a **layered approach**:  

### 1. **Stage Layer**  
Primary access to source data from BigQuery. Includes type casting, renaming, and initial cleaning.  
Tables:  
- Customers (who place orders)  
- Orders (from those customers)  
- Products (food & beverages)  
- Order Items (linking orders and products)  
- Supplies (ingredients and materials)  
- Stores (where orders are fulfilled)  

<p align="center">
  <img src="https://github.com/kkonstantin182/dbt-certified-developer-path/blob/main/images/stage_layer.png" alt="Stage Layer" width="600"/>
</p>  

---

### 2. **Intermediate Layer**  
Contains auxiliary models used for joins, enrichments, and calculations.  

---

### 3. **Marts Layer**  
Final layer, modeled using a **Kimball star schema**:  
- **Fact Table:** `fct_orders`  
- **Dimensions:** `dim_customers`, `dim_locations`, `dim_products`  
- **Dashboard Table:** `looker_dashboard` – combines fact and dimension tables for efficient reporting  

<p align="center">
  <img src="https://github.com/kkonstantin182/dbt-certified-developer-path/blob/main/images/marts_layer.png" alt="Marts Layer" width="600"/>
</p>  

---  
