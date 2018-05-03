--Useful SQL command
--Get what you deserve
SELECT Company, OrderNumber FROM Orders ORDER BY Company DESC, OrderNumber ASC

INSERT INTO Persons (LastName, Address) VALUES ('Wilson', 'Champs-Elysees')

UPDATE Person SET Address = 'Zhongshan 23', City = 'Nanjing' WHERE LastName = 'Wilson'
DELETE FROM Person WHERE LastName = 'Wilson' 

SQL Server 的语法：
SELECT TOP number|percent column_name(s)
FROM table_name

SELECT TOP 2 * FROM Persons
SELECT TOP 50 PERCENT * FROM Persons

MySQL 和 Oracle 中的 SQL SELECT TOP 是等价的
MySQL 语法
SELECT column_name(s)
FROM table_name
LIMIT number
例子
SELECT *
FROM Persons
LIMIT 5
Oracle 语法
SELECT column_name(s)
FROM table_name
WHERE ROWNUM <= number

SELECT * FROM Persons WHERE City NOT LIKE '%lon%'

SELECT * FROM Persons WHERE LastName LIKE 'C_r_er'

SELECT * FROM Persons WHERE City LIKE '[ALN]%'

SELECT * FROM Persons WHERE LastName IN ('Adams','Carter')
SELECT * FROM Persons WHERE LastName NOT BETWEEN 'Adams' AND 'Carter'

SELECT Persons.LastName, Persons.FirstName, Orders.OrderNo FROM Persons, Orders WHERE Persons.Id_P = Orders.Id_P 

SELECT Persons.LastName, Persons.FirstName, Orders.OrderNo FROM Persons LEFT JOIN Orders ON Persons.Id_P=Orders.Id_P ORDER BY Persons.LastName
SELECT E_Name FROM Employees_China UNION SELECT E_Name FROM Employees_USA

SELECT Persons.LastName,Orders.OrderNo INTO Persons_Order_Backup FROM Persons INNER JOIN Orders ON Persons.Id_P=Orders.Id_P

CREATE TABLE Persons
(
Id_P int,
LastName varchar(255),
FirstName varchar(255),
Address varchar(255),
City varchar(255)
)

SELECT Customer,SUM(OrderPrice) FROM Orders
GROUP BY Customer
HAVING SUM(OrderPrice)<2000

SELECT DISTINCT Email from Person GROUP BY Email HAVING COUNT(Person.Email) > 1