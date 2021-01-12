DROP DATABASE IF EXISTS	fresher;
CREATE DATABASE 	fresher;
USE fresher;

-- Exercise 1:Design a table
CREATE TABLE Trainee (
		TraineeID 				INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        Full_name 				VARCHAR(30),
        Birth_Date				DATE NOT NULL,
        Gender	  				VARCHAR(10), 
        ET_IQ	  				TINYINT UNSIGNED NOT NULL,
        ET_Gmath  				TINYINT UNSIGNED NOT NULL,
        ET_English				TINYINT UNSIGNED NOT NULL,
        Training_Class			MEDIUMINT UNSIGNED NOT NULL,
        Evaluation_Notes		TEXT
);

-- Exercise 2: Data Types
CREATE TABLE Exercise2(
		ID 				INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        `Name`			VARCHAR(30) NOT NULL,
        `Code`			VARCHAR(5) NOT NULL,
        ModifiedDate	DATETIME
);

-- Exercise 2: Data Types(2)
CREATE TABLE Exercise3(
		ID				INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        `Name`			VARCHAR(30) NOT NULL,
        BirthDate		Date,
        Gender			Bit,
        IsDeleteFlag	Bit
);



-- Question 1: Thêm ít nhất 10 bản ghi vào table
INSERT INTO Trainee(   Full_name,				Birth_Date,	  	 	Gender,	 	  	ET_IQ,			ET_Gmath,			ET_English,			Training_Class,		Evaluation_Notes)
VALUE 			   ('Trần Hồng Diện',			'1990-06-20',		'Male',			 10,		      11,		  			31,		 		  1,				  'Ổn'		),
				   ('Lê Ngọc Bảo',				'1996-03-04',		'Male',			 13,		      15,		  			38,		 		  2,				  'Ổn'		),
                   ('Nguyễn Văn Bách',			'1995-08-04',		'Male',			  8,		      9,		  			25,		 		  3,				  'Ổn'		),
                   ('Bùi Trung Hậu',			'1994-02-13',		'Unknow',		 16,		      15,		  			42,		 		  4,				  'Ổn'		),
                   ('Lê Thành Nam',				'1992-06-10',		'Male',			 15,		      16,		  			45,		 		  5,				  'Ổn'		),
                   ('Trần Việt Hoàng',			'1990-11-06',		'Male',			 19,		      18,		  			48,		 		  1,				  'Ổn'		),
                   ('Phạm Trang Anh',			'1992-09-29',		'Female',		  7,		      10,		  			27,		 		  2,				  'Ổn'		),
                   ('Nguyễn Đức Anh',			'1994-04-03',		'Male',			 15,		      15,		  			43,		 		  3,				  'Ổn'		),
                   ('Phạm Thị Mơ',				'1993-09-03',		'Female',		 12,		      11,		  			40,		 		  4,				  'Ổn'		),
                   ('Lê Bảo Bình',				'1996-08-21',		'Male',			 11,		      13,		  			39,		 		  5,				  'Ổn'		),
                   ('Nguyễn Thị Thảo',			'1995-07-17',		'Female',		 16,		      15,		  			44,		 		  3,				  'Ổn'		);
                   
                   
                   
-- question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau: tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)
SELECT Full_name,length(Full_name), Birth_Date, Gender , ET_IQ, ET_Gmath, ET_English, Training_Class
	FROM Trainee
    WHERE length(Full_name) = (SELECT max(length(Full_name)) from Trainee);
    
    
--    question 2 + 4: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau 
SELECT Full_name, month(Birth_Date) as 'Month'
	FROM Trainee
    WHERE ET_IQ + ET_Gmath >=20
    AND ET_IQ >=8
    AND	ET_Gmath>=8
    AND ET_English >=18
    ORDER BY  month(Birth_Date);
    
    
 -- Question 5: xóa thực tập sinh có TraineeID = 3  
DELETE 
	FROM Trainee
    WHERE TraineeID = 3;
    
    
-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật thông tin vào database
UPDATE Trainee
SET Training_Class = 2
WHERE 
TraineeID = 5;
SELECT * FROM Trainee;