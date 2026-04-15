# Bakery-database-management-system
SQL-based bakery database for handling orders, customers, products, and inventory with structured queries

---

## Features
- Store and manage customer information  
- Track orders and order details  
- Manage products and pricing  
- Handle inventory and ingredients  
- Run queries for sales insights and reporting  

---

## 🛠️ Tech Stack
- SQL (microsoft sql server)
- Relational Database Design  
- ERD (Entity Relationship Diagram)  
 
---

## 🧱 Database Structure

Main tables include:
- Customers  
- Orders  
- Order_Items  
- Products  

---

## 📊 Example Queries

```sql
-- Total sales
SELECT SUM(total_price) FROM Orders;

-- Most popular products
SELECT product_id, COUNT(*) AS total_orders
FROM Order_Items
GROUP BY product_id
ORDER BY total_orders DESC;
