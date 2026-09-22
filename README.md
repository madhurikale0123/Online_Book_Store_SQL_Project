# Online_Book_Store_SQL_Project

Introduction
This project is a SQL-based database system designed to manage an online bookstore. It handles various aspects such as book inventory, customers, orders, and transactions, enabling efficient management and retrieval of bookstore data.
Database Schema Overview


The database schema comprises multiple tables, each serving a specific purpose:
1. Books

Attributes: BookID (PK), Title, Author, Genre, Price, StockQuantity
Description: Stores details about each book available in the store.

2. Customers

Attributes: CustomerID (PK), Name, Email, Phone, Address
Description: Contains information about customers registered in the system.

3. Orders

Attributes: OrderID (PK), CustomerID (FK), OrderDate, TotalAmount
Description: Records each purchase made by customers.

4. OrderDetails

Attributes: OrderDetailID (PK), OrderID (FK), BookID (FK), Quantity, PriceAtPurchase
Description: Details of books included in each order.

5. Suppliers
6. 
Attributes: SupplierID (PK), Name, ContactInfo
Description: Suppliers providing books to the store.

7. BookSuppliers

Attributes: BookID (FK), SupplierID (FK)
Description: Many-to-many relationship between books and suppliers.

Key Features

Book Management - Add, update, delete book records.
Customer Management - Register and manage customer details.
Order Processing -  Create new orders, view order history.
Inventory Tracking -  Monitor stock quantities and manage restocking.
Reporting - Generate reports on sales, inventory, and customer activities.

