DROP DATABASE IF EXISTS Final_Exam;
CREATE DATABASE Final_Exam;
USE Final_Exam;

CREATE TABLE 	Country(
		Country_ID						INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        Country_Name					VARCHAR(30)
);

CREATE TABLE Location(
		Location_ID				INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        Street_address			VARCHAR(30) UNIQUE NOT NULL,
        Postal_code				INT UNSIGNED NOT NULL,
        Country_ID				INT UNSIGNED NOT NULL,
        FOREIGN KEY ( Country_ID) REFERENCES Country(Country_ID) ON DELETE CASCADE
);

CREATE TABLE Employee(
		Employee_ID					INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        Full_Name					VARCHAR(30) NOT NULL,
        Email						VARCHAR(30) NOT NULL UNIQUE,
        Location_ID					INT UNSIGNED ,
		FOREIGN KEY ( Location_ID) REFERENCES Location(Location_ID) ON DELETE SET NULL
);

INSERT INTO Country	(Country_Name)
VALUES					('US'),
						('UK'),
                        ('Việt Nam');

INSERT INTO Location	(Street_address,		Postal_code,		Country_ID)
VALUES					(	'Disney',			'02553',				1),
						(	'HasiTon',			'03552',				2),
                        (	'Hải Phòng',		'02553',				3),
                        (	'Hải Dương',		'02553',				3),
                        (	'Hà Nội',			'02553',				3);
	
INSERT INTO Employee	(		Full_Name,								Email,				Location_ID)
VALUES					(	'Trần Đức Hiếu',					'157Kyn@gmail.com',				3),
						(	'Hoàng Thái Hạnh',					'Hanh@gmail.com',				5),
                        (	'Lê Bảo Bình',						'Binh@gmail.com',				3),
                        (	'Phạm Minh Nghĩa',					'Nghia@gmail.com',				4),
                        (	'Lê Văn Phú',						'Phu@gmail.com',				3),
                        (	'Kiều Mỹ Linh',						'Linh@gmail.com',				4),
                        (	'Phan Bích Ngọc',					'Ngoc@gmail.com',				3),
                        (	'Lê Thành Văn',						'Van@gmail.com',				4),
                        (	'Nguyễn Văn Hợp',					'Hop@gmail.com',				3),
                        (	'Trần Khôi Nguyên',					'nn03@gmail.com',				5);
                        
                        
                        
                        
                        
-- 2. Viết lệnh để
-- a) Lấy tất cả các nhân viên thuộc Việt nam

		SELECT e.Full_Name, e.Email, c.Country_Name
        FROM Employee e
        JOIN Location l ON e.Location_ID = l.Location_ID
        JOIN Country c ON l.Country_ID = c.Country_ID
        WHERE c.Country_Name = 'Việt Nam';

-- b) Lấy ra tên quốc gia của employee có email là "nn03@gmail.com"

	SELECT  c.Country_Name
        FROM Employee e
        JOIN Location l ON e.Location_ID = l.Location_ID
        JOIN Country c ON l.Country_ID = c.Country_ID
        WHERE e.Email = 'nn03@gmail.com';



-- c) Thống kê mỗi country, mỗi location có bao nhiêu employee đang
-- làm việc.

	SELECT c.Country_Name, l.Street_address, COUNT(e.Employee_ID) AS ' Số người đang làm tại đây'
    FROM country c 
	JOIN location l ON l.Country_ID = c.Country_ID
	LEFT JOIN employee e ON e.Location_ID = l.Location_ID
    GROUP BY c.Country_Name, l.Street_address;




-- 3. Tạo trigger cho table Employee chỉ cho phép insert mỗi quốc gia có tối đa
-- 10 employee

	DROP TRIGGER IF EXISTS MAX_Employee;
DELIMITER $$

CREATE TRIGGER MAX_Employee BEFORE INSERT 
ON employee
FOR EACH ROW

BEGIN 
	DECLARE V_country_name VARCHAR(30);
    
    SELECT t1.Country_Name INTO V_country_name
	FROM ( SELECT  c.Country_Name, COUNT(e.Employee_ID) 
				FROM country c 
				JOIN location l ON l.Country_ID = c.Country_ID
				LEFT JOIN employee e ON e.Location_ID = l.Location_ID
				GROUP BY c.Country_Name
				HAVING COUNT(e.Employee_ID) = 10) t1;
	
    
	IF NEW.Location_ID IN(	SELECT t1.Location_ID
							FROM
							(	SELECT l.Location_ID
								FROM	location l
                                JOIN 	country	c ON l.Country_ID= c.Country_ID
                                WHERE	c.Country_Name = V_country_name) t1 )
  THEN 
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Max Emplyee is 10';
END IF;
  
END$$

DELIMITER ;


INSERT INTO Employee	(		Full_Name,								Email,				Location_ID)
VALUES					(	'Hoàng Quốc Việt',					'Viet@gmail.com',				3);





-- 4. Hãy cấu hình table sao cho khi xóa 1 location nào đó thì tất cả employee ở
-- location đó sẽ có location_id = null

DELETE FROM location WHERE Location_ID =3;
SELECT * FROM employee;