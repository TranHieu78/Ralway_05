USE adventureworks;

-- Exercise 1: Subquery
-- Question 1: Viết 1 query lấy thông tin "Name" từ bảng Production.Product có name của ProductSubcategory là 'Saddles'.
SELECT p.`Name`
FROM product p
JOIN productsubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
WHERE psc.`Name` = 'Saddles';

 
-- Question 2: Thay đổi câu Query 1 để lấy được kết quả sau. 
SELECT p.`Name`
FROM product p
JOIN productsubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
WHERE p.`Name` LIKE "%BO%";

-- Question 3: Viết câu query trả về tất cả các sản phẩm có giá rẻ nhất (lowest ListPrice) và Touring Bike (nghĩa là ProductSubcategoryID = 3)
SELECT product.ProductID, product.`name`,  product.ListPrice AS 'giá'
FROM	product
WHERE product.ListPrice = ( SELECT min(t1.ListPrice) 
								FROM	(SELECT product.ProductID, product.`Name`, product.ListPrice
												FROM product 
												JOIN productsubcategory ON product.ProductSubcategoryID = productsubcategory.ProductSubcategoryID
												WHERE productsubcategory.`Name` = 'Touring Bikes'
												GROUP BY product.ProductID
												ORDER BY  product.`Name`) t1 )
GROUP BY product.ProductID;

-- Exercise 2: JOIN nhiều bảng
-- Question 1: Viết query lấy danh sách tên country và province được lưu trong AdventureWorks2008sample database.
SELECT countryregion.Name AS 'Country', stateprovince.Name AS ' Province'
FROM countryregion
JOIN stateprovince ON stateprovince.CountryRegionCode = countryregion.CountryRegionCode;


-- Question 2: Tiếp tục với câu query trước và thêm điều kiện là chỉ lấy country Germany và Canada
SELECT countryregion.Name AS 'Country', stateprovince.Name AS ' Province'
FROM countryregion
JOIN stateprovince ON stateprovince.CountryRegionCode = countryregion.CountryRegionCode
WHERE countryregion.Name IN ('Germany', 'Canada')
ORDER BY countryregion.Name;


-- Question 3: Từ bảng SalesPerson, chúng ta lấy cột BusinessEntityID (là định danh của người sales), Bonus and the SalesYTD (là đã sale được bao nhiêu người trong năm nay) Từ bảng SalesOrderHeader, chúng ta lấy cột SalesOrderID OrderDate
SELECT salesorderheader.SalesOrderID, salesorderheader.OrderDate, salesperson.SalesPersonID, salesperson.SalesPersonID AS 'BusinessEntityID' ,salesperson.Bonus, salesperson.SalesYTD
FROM salesorderheader
JOIN salesperson ON salesperson.SalesPersonID = salesorderheader.SalesPersonID;


-- Question 4: Sử dụng câu query ở question 3, thêm cột JobTitle and xóa cột SalesPersonID và BusinessEntityID.
SELECT salesorderheader.SalesOrderID, salesorderheader.OrderDate, employee.Title AS 'Jobtitle' ,salesperson.Bonus, salesperson.SalesYTD
FROM salesperson
JOIN salesorderheader ON salesperson.SalesPersonID = salesorderheader.SalesPersonID
JOIN employee ON salesperson.SalesPersonID = employee.EmployeeID;