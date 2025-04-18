select * from customer;
select * from lease;
select * from payment;
select * from vehicle;
/*Question1*/
select * from vehicle;
UPDATE vehicle SET dailyRate = 68 WHERE make = 'Mercedes';

/*Question2*/
select * from Payment;
DELETE FROM Payment
WHERE leaseID IN (SELECT leaseID FROM Lease Where customerID =10);

/*Question3*/
alter table payment rename column paymentDate to transactionDate;

/*Question4*/
select * from customer where email='michael@example.com';

/*Question5*/
select * from Lease
where customerID = 3 and endDate >= curdate();

/*Question6*/
SELECT * FROM Payment p
JOIN Lease l ON p.leaseID =l.leaseID
JOIN Customer c ON l.customerID = c.customerID
WHERE c.phoneNumber = '555-456-7890' and '555-234-5678';
select * from customer;

/*Question7*/
SELECT AVG(dailyRate) AS avg_daily_rate, count(*) AS active_cars
FROM Vehicle
WHERE status = 1;

/*Question8*/
select * from vehicle order by dailyrate DESC LIMIT 1;
select * from vehicle;

/*Question9*/
SELECT * FROM Vehicle v
JOIN Lease l ON v.carID = l.carID
WHERE l.customerID = 3;
 
/*Question10*/
SELECT * FROM Lease ORDER BY endDate DESC LIMIT 1;

/*Question11*/
SELECT * FROM Payment WHERE YEAR(transactionDate) = 2023;

/*Question12*/
SELECT * FROM Customer c
LEFT JOIN Lease l ON c.customerID = l.customerID
LEFT JOIN Payment p ON l.leaseID = p.leaseID
WHERE p.paymentID IS NULL;

/*Question13*/
SELECT v.make, v.model, SUM(p.amount) AS total_payments
FROM Vehicle v
JOIN Lease l ON v.carID = l.carID
JOIN Payment p ON l.leaseID = p.leaseID
GROUP BY v.make, v.model;

/*Question14*/
SELECT c.customerID, c.firstName, c.lastName, SUM(p.amount) AS total_spent
FROM Customer c
JOIN Lease l ON c.customerID = l.customerID
JOIN Payment p ON l.leaseID = p.leaseID
GROUP BY c.customerID;

/*Question15*/
SELECT l.leaseID, l.startDate, l.endDate, v.make, v.model, v.year
FROM Lease l
JOIN Vehicle v ON l.carID = v.carID;

/*Question16*/
SELECT l.leaseID, l.startDate, l.endDate, c.firstName, c.lastName, v.make, v.model
FROM Lease l
JOIN Customer c ON l.customerID = c.customerID
JOIN Vehicle v ON l.carID = v.carID
WHERE l.endDate >= CURDATE();

/*Question17*/
SELECT c.customerID, c.firstName, c.lastName, SUM(p.amount) AS total_spent
FROM Customer c
JOIN Lease l ON c.customerID = l.customerID
JOIN Payment p ON l.leaseID = p.leaseID
GROUP BY c.customerID
ORDER BY total_spent DESC
LIMIT 1;

/*Question18*/
SELECT v.carID, v.make, v.model, v.year, l.startDate, l.endDate, c.firstName, c.lastName
FROM Vehicle v
LEFT JOIN Lease l ON v.carID = l.carID
LEFT JOIN Customer c ON l.customerID = c.customerID;
