CREATE TABLE Books(
	Book_ID SERIAL PRIMARY KEY,
	Title VARCHAR(100),
	Author VARCHAR(100),
	Genre VARCHAR(50),
	Published_Year INT,
	Price NUMERIC(10, 2),
	Stock INT
);

CREATE TABLE Customers(
	Customer_ID SERIAL PRIMARY KEY,
	Name VARCHAR(100),
	Email VARCHAR(100),
	City VARCHAR(50),
	Phone VARCHAR(15),
	Country VARCHAR(150)
);

CREATE TABLE Orders(
	Order_ID SERIAL PRIMARY KEY,
	Customer_ID INT REFERENCES Customers(Customer_ID),
	Book_ID INT REFERENCES Books(Book_ID),
	Order_Date DATE,
	Quantity INT,
	Total_Amount NUMERIC(10, 2)
);

SELECT*FROM Books;
SELECT*FROM Customers;
SELECT*FROM Orders;

1)--import data into books table
COPY Books(Book_ID, Title, Author,Genre, Published_Year, Price, Stock)
FROM 'C:/Users/gaura/Downloads/Books.csv'WITH
DELIMITER ','
CSV HEADER;

2)--import data into customers table
COPY Customers(Customer_ID, Name,Email, Phone, City, Country)
FROM 'C:/Users/gaura/Downloads/Customers.csv'WITH
DELIMITER ','
CSV HEADER;

3)--import data into orders table
COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
FROM 'C:\Users\gaura\Downloads\Orders.csv'WITH
DELIMITER ','
CSV HEADER;

4)--RETRIVE ALL BOOKS IN THE "fiction" genre:
SELECT*FROM Books
WHERE Genre = 'Fiction';


5)--Fine Books published after the year 1950:
SELECT*FROM Books
WHERE Published_Year>1950;


6)--List All the records form the Canada:
SELECT*FROM Customers
WHERE country='Canada';


7)--Show orders placed in november 2023:
SELECT*FROM Orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';


8)--Retrives the total stock of books available:
SELECT SUM(stock) AS Total_stock
FROM Books;


9)--find the details of the most expencive books:
SELECT*FROM Books
ORDER BY Price DESC LIMIT 1;


10)--show all customers who ordered more than 1 quantity of  book:
SELECT*FROM Orders
WHERE quantity>1;


11)--retrive all orders where the total amount exeeds $20:
SELECT*FROM Orders
WHERE Total_amount>20;


12)-- List all genre available in the books table:
SELECT DISTINCT Genre FROM Books;


13)--Find the books with the lowest stock:
SELECT*FROM Books
ORDER BY stock ASC LIMIT 1;


14)--Calculate the total revenue generated from all orders:
SELECT SUM(total_amount) AS Revenue
FROM Orders;


				--ADVANCED QUERIES

1)--Retrive the total number of books sold for each genre:
SELECT b.Genre, SUM(o.Quantity) as Total_books 
FROM Orders o
JOIN Books b ON o.Book_ID = b.Book_ID
GROUP BY b.genre;


2)--find the avarage price of books in the "Fantasy" genre:
SELECT AVG(Price) AS Average_price
FROM Books
WHERE genre='Fantasy';


3)--List customers who have placed at least 2 orders:
SELECT o.customer_id, c.name, COUNT(o.Order_id) AS ORDER_COUNT
FROM Orders o
JOIN Customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT (Order_id)>=2;


4)--Find the most frequently ordered book:
SELECT o Book_id,b.title, COUNT(o.order_id) AS ORDER_COUNT
FROM Orders o
JOIN Books b  ON o.Book_id=b.Book_id
GROUP BY b.Book_id, b.title
ORDER BY Order_COUNT DESC;


5)--show the top 3 most expensive books sold by each author:
SELECT*FROM Books
WHERE genre='Fantasy'
ORDER BY price DESC LIMIT 3;


6)--Retrive the total number of books sold by each authore:
SELECT b.author, SUM(o.quantity) AS Total_book_sold
FROM Books b
JOIN Orders o ON o.book_id=b.book_id
GROUP BY b.author;


7)--List the cities where customer spent over $30 are located:
SELECT DISTINCT c.city, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id=c.customer_id
WHERE o.total_amount > 30;


8)--Find the customer who spent the most on orders:
SELECT c.customer_id, c.name, SUM(o.total_amount) AS Total_spent
FROM Orders o
JOIN Customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_spent DESC LIMIT 1;


9)-- calculate the stock remaining after fullfilling all the orders:
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS order_quantity,
  b.stock-COALESCE(SUM(o.quantity),0) AS remaining_quantity
FROM books b
LEFT JOIN Orders o ON b.book_id=o.book_id
GROUP BY b.book_id;









