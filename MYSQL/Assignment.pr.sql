create database TechShop;
use TechShop;

CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address varchar(30)
);
desc Customers;
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES
(100, 'Rohan', 'Deshmukh', 'rohan123@email.com', '7890123456', 'Jaipur'),
(101, 'Jane', 'Smith', 'jane.smith@email.com', '9876543210', 'Chennai'),
(103, 'Sachin', 'Patil', 'sachinpatil@email.com', '9501234567', 'Pune'),
(104, 'Pooja', 'Raman', 'pujaraman@email.com', '8901221105', 'Bangalore'),
(105, 'Kiran', 'Singh', 'kiransingh@email.com', '9632585621', 'Mumbai'),
(106, 'David', 'Miller', 'david.miller@email.com', '9519511594', 'Kolkata'),
(107, 'Vismay', 'Wagh', 'vismaywagh@email.com', '8888232321', 'Chennai'),
(108, 'Farah', 'Moore', 'farahmoore@email.com', '7854442222', 'Chennai'),
(109, 'Anjali', 'Sharma', 'anjali@email.com', '7778889999', 'Mumbai'),
(110, 'Vishal', 'Raj', 'vishalraj@email.com', '9991112222', 'Bangalore');
SELECT * FROM Customers;

CREATE TABLE Products(
	ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price Decimal(10,2)
);
desc Products;
INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES
(1, 'Laptop', 'High-performance laptop', 95000),
(2, 'Smartphone', 'Latest model smartphone', 60000),
(3, 'Tablet', '10-inch display tablet', 30000),
(4, 'Headphones', 'Noise-canceling headphones', 1900),
(5, 'Smartwatch', 'Wearable fitness tracker', 14000),
(6, 'Monitor', '24-inch HD monitor', 240000),
(7, 'Keyboard', 'Mechanical keyboard', 8000),
(8, 'Mouse', 'Wireless mouse', 4900),
(9, 'Printer', 'All-in-one printer', 170000),
(10, 'External Hard Drive', '1TB portable storage', 12000);
SELECT * FROM Products;

CREATE TABLE Orders(
	OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate date,
    TotalAmount Decimal(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
desc Orders;
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(10001, 100, '2024-04-01', 90000),
(10002, 101, '2024-04-02', 12800),
(10003, 103, '2024-04-03', 69900),
(10004, 104, '2024-04-03', 48020),
(10005, 105, '2024-04-05', 39980),
(10006, 106, '2024-04-06', 19000),
(10007, 107, '2024-04-07', 14000),
(10008, 108, '2024-04-08', 24500),
(10009, 109, '2024-04-09', 88500),
(10100, 110, '2024-04-10', 49500);
SELECT * FROM Orders;


CREATE TABLE OrderDetails (
	OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
desc OrderDetails;
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 10001, 1, 20),
(2, 10002, 2, 55),
(3, 10003, 3, 800),
(4, 10004, 4, 70),
(5, 10005, 5, 850),
(6, 10006, 6, 540),
(7, 10007, 7, 430),
(8, 10008, 8, 30),
(9, 10009, 9, 40),
(10, 10100, 10, 590);
SELECT * FROM OrderDetails;


CREATE TABLE Inventory (
	InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate date,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
desc Inventory;
INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES
(2001, 1, 50, '2024-04-01'),
(2002, 2, 100, '2024-04-02'),
(2003, 3, 75, '2024-04-03'),
(2004, 4, 40, '2024-04-04'),
(2005, 5, 60, '2024-04-05'),
(2006, 6, 120, '2024-04-06'),
(2007, 7, 90, '2024-04-07'),
(2008, 8, 30, '2024-04-08'),
(2009, 9, 45, '2024-04-09'),
(2010, 10, 30, '2024-04-10');
SELECT * FROM Inventory;


/* Question 1 */
select FirstName,LastName,Email from Customers;

/* Question 2 */
SELECT orders.OrderID, orders.OrderDate, customers.FirstName, customers.LastName
FROM Orders orders
JOIN Customers customers ON orders.CustomerID = customers.CustomerID;

/* Question 3 */
INSERT INTO Customers
VALUES (111,'Raj','Roy','rajroy@example.com', 9638522589,'Tamilnadu');
select * from customers;

/* Question 4 */
UPDATE Products
SET Price = Price * 1.10;

/* Question 5 */
DELETE FROM Orders WHERE OrderID =10100;
select * from orders;
DELETE FROM OrderDetails WHERE OrderID =10100;
select * from orderDetails;

/* Question 6 */
INSERT INTO Orders (orderID, CustomerID, OrderDate. TotalAmount)
VALUES(10010, 110, '2024-04-10',25000);
select * from orders;

/* Question 7 */
UPDATE Customers 
SET Email = 'deshmukh@example.com', Address = 'Lonavala' 
WHERE CustomerID = 100;
select * from cutomers;

/* Question 8 */
UPDATE Orders o
	SET TotalAmount = (
    SELECT SUM(p.Price * od.Quantity)
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE od.OrderID = o.OrderID
);

/* Question 9*/
DELETE FROM OrderDetails 
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 104);
select * from orderdetails;

/* Question 10  */
INSERT INTO Products (ProductID,ProductName,Description,Price)
VAlUES(11,'Earbuds','LatestModel',90000);
select * from products;

/* Question 11 */
ALTER TABLE Orders ADD COLUMN Status VARCHAR(20);
UPDATE Orders
SET STATUS = 'Shipped'
WHERE OrderID between 10001 and 10010;
select * from orders;

/* Question 12*/
ALTER TABLE Customers ADD COLUMN OrderCount  INT;
UPDATE Customers c
SET OrderCount = (
	SELECT COUNT(*) FROM Orders o WHERE o.CustomerID = c.CustomerID
);

/*TASK 3*/

/*Question 1*/
SELECT o.OrderID, o.OrderDate, c.FirstName, c.LastName, c.Email
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

/*Question 2*/
SELECT p.ProductName, SUM(od.Quantity * p.Price) AS TotalRevenue
From OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalRevenue DESC;

/*Question 3*/
SELECT DISTINCT c.CustomerID, concat(c.FirstName, ' ',c.LastName) as 'FullName',
c.Email, c.Phone
FROM Customers cross
JOIN Orders o ON c.CustomerID = o.CustomerID;

/*Question 4*/
SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantityOrdered DESC
LIMIT 1;

/*Question 5*/
SELECT p.ProductName, p.Description as 'Categories'
FROM Products p;

/*Question 6*/
SELECT c.CustomerID, concat(c.FirstName,' ',c.LastName) as 'FullName',AVG(o.TotalAmount) AS AvgOrderValue
FROM Orders o
JOIN Customers c ON o.CustomerID = C.CustomerID
GROUP BY c.CustomerID;

/*Question 7*/
SELECT o.OrderID, c.FirstName, c.LastName, o.TotalAmount From Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
ORDER BY o.TotalAmount DESC LIMIT 1;

/*Question 8*/
SELECT p.ProductName, COUNT(od.OrderID) AS OrderCount
From OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName ORDER BY OrderCount DESC;

/*Question 9*/
SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName,c.Email, c.Phone
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
JOIN orderdetails od ON o.OrderID = od.OrderID
JOIN products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Laptop';

/*Question 10*/
SELECT SUM(O.TotalAmount) AS TotalRevenue
FROM Orders o
WHERE o.OrderDate BETWEEN '2024-01-01' AND '2024-04-06';


/*TASK 4*/
/*Question 1*/
SELECT c.CustomerID, concat(c.FirstName,c.Lastname) as 'FullName'
FROM Customers c
WHERE c.CustomerID NOT IN(SELECT DISTINCT CustomerID FROM Orders);

/*Question 2*/
SELECT COUNT(*) AS TotalProducts FROM Products;

/*Question 3*/
SELECT SUM(o.TotalAmount) AS TotalRevenue FROM Orders o;

/*Question 4*/
SELECT p.ProductName, AVG(od.Quantity) AS AvgQuantityOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.productname='Laptop'
GROUP BY p.ProductName;

/*Question 5*/
SELECT customerID, SUM(o.TotalAmount) AS CustomerRevenue
FROM Orders o WHERE o.CustomerID = 101;

/*Question 6*/
SELECT c.CustomerID, CONCAT(c.FirstName, ' ',c.LastName) AS CustomerName, CONCAT(o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, CustomerName
ORDER BY TotalOrders DESC
LIMIT 1;

/*Question 7*/
SELECT p.ProductName, SUM(od.Quantity) AS total_quantity_ordered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY total_quantity_ordered DESC
LIMIT 1;

/*Question 8*/
SELECT c.CustomerID, concat(c.FirstName,' ',c.LastName) as 'FullName',
(SELECT SUM(od.Quantity * p.Price) FROM OrderDetails od
JOIN Producta p ON od.ProductID = p.ProductID
WHERE od.OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = c.CustomerID))
AS total_spent FROM Customers c ORDER BY total_spent DESC;

/*Question 9*/
SELECT AVG(TotalAmount) AS AverageOrderValue FROM Orders;

/*Question 10*/
SELECT c.CustomerID, concat(c.FirstName,' ',c.LastName) as 'FullName', COUNT(o.OrderID) AS TotalOrders
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;
