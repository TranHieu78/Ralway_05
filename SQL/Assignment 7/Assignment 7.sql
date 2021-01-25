DROP DATABASE IF EXISTS Testing_System;
CREATE DATABASE Testing_System;
USE Testing_System;

CREATE TABLE Department(
	DepartmentID		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    DepartmentName		VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE `Position`(
	PositionID 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	PositionName		VARCHAR(30) NOT NULL UNIQUE
);
CREATE TABLE `Account`(
	AccountID			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email				VARCHAR(30) NOT NULL UNIQUE,
    Username			VARCHAR(30) NOT NULL UNIQUE,
    Fullname			VARCHAR(30) NOT NULL,
    Gender				VARCHAR(30),
    DepartmentID		TINYINT UNSIGNED,
	PositionID			TINYINT UNSIGNED,
    CreateDate			DATE,
    FOREIGN KEY ( DepartmentID) REFERENCES Department(DepartmentID) ON DELETE CASCADE,
    FOREIGN KEY ( PositionID) REFERENCES `position`(positionID) ON DELETE CASCADE
); 
CREATE TABLE `Group`(
	GroupID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName			VARCHAR(50) NOT NULL UNIQUE,
	CreatorID			INT UNSIGNED NOT NULL,
	CreatDate			DATE,
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)  ON DELETE CASCADE
);
CREATE TABLE GroupAccount(
	GroupID				TINYINT UNSIGNED NOT NULL,
    AccountID			INT UNSIGNED,
    JoinDate			DATE,
    FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID) ON DELETE CASCADE,
    FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID) ON DELETE CASCADE,
    PRIMARY KEY(GroupID, AccountID)
);
CREATE TABLE TypeQuestion(
	TypeID 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName			ENUM('Essay', 'Multiple-Choice')
);
CREATE TABLE CategoryQuestion(
	CategoryID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName		VARCHAR(50) UNIQUE KEY
);
CREATE TABLE Question(
	QuestionID			INT AUTO_INCREMENT PRIMARY KEY,
    Content				VARCHAR(50),
    CategoryID			TINYINT UNSIGNED,
    TypeID				TINYINT UNSIGNED,
    CreatorID			INT UNSIGNED,
    CreateDate			DATE,
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID) ON DELETE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID) ON DELETE CASCADE,
    FOREIGN KEY	(CreatorID) REFERENCES `Account`(AccountID) ON DELETE CASCADE
);
CREATE TABLE Answer(
	AnswerID			INT AUTO_INCREMENT PRIMARY KEY,
    Content				VARCHAR(50),
    QuestionID			INT,
    IsCorrect			BIT ,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID) ON DELETE CASCADE
);
CREATE TABLE Exam(
	ExamID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code`				VARCHAR(30),
    Title				VARCHAR(50),
    CategoryID			TINYINT UNSIGNED,
    Duration			TINYINT UNSIGNED,
    CreatorID			INT UNSIGNED,
    CreateDate			DATE,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID) ON DELETE CASCADE,
    FOREIGN KEY	(CreatorID) REFERENCES `Account`(AccountID) ON DELETE CASCADE
    );
CREATE TABLE ExamQuestion(
	ExamID				TINYINT UNSIGNED NOT NULL,
    QuestionID			INT,
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID) ON DELETE CASCADE,
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID) ON DELETE CASCADE,
    PRIMARY KEY (ExamID, QuestionID)
);
INSERT INTO department (departmentName)
VALUE   ('Waiting Room'),
		('Nhân sự'),
		('Giám đốc'),
		('Phó giám đốc'),
        ('Marketing'),
        ('Sale'),
        ('Bán Hàng'),
        ('Kỹ thuật'),
        ('Tư vấn khách hàng'),
		('Bảo an');
INSERT INTO position (positionName)
VALUE 	('Dev'),
		('Tesy'),
        ('Scrum Master'),
        ('PM');
INSERT INTO `account`	(Email, 						Username, 					Fullname, 			Gender		,departmentID, positionID, 	createdate)
VALUE 					('admin@gmail.com' , 		'Hieu.Tranduc' , 			'Trần Đức Hiếu', 		'Male',			'3', 		'1', 		'2020-03-05'),
						('2' , 						'Hanh.HoangThai' , 			'Hoàng Thái Hạnh', 		'Female',			'4', 		'2', 		'2021-01-22'),
						('3' , 						'Nhat.Hoba' , 				'Hồ Bá Nhật', 			'Female',			'8', 		'4', 		'2020-03-07'),
						('4' ,						'Bach.Nguyenbach' , 		'Nguyễn Văn Bách', 		'UNkonw',		'6', 		'3', 		'2021-01-23'),
						('5' ,						'Hoa.PhamThi' , 			'Phạm Thị Hoa', 		'Female',			'5', 		'4', 		'2020-03-10'),
						('6' ,						'Nam.LeThanh' , 			'Lê Thành Nam', 		'Male',			'8', 		'2', 		'2020-04-05'),
						('7' ,						'Viet.TranThanh' , 			'Trần Thành Việt', 		'Male',			'6', 		'3', 		'2021-04-07'),
						('8' ,						'Hoang.LeViet' , 			'Lê Việt Hoàng', 		'Male',			'8', 		'4', 		'2020-04-07'),
						('9' , 						'Mo.PhamThi' , 				'Phạm Thị Mơ', 			'Female',			'6', 		'3', 		'2020-04-09'),
						('10' , 					'Minh.NguyenVan' , 			'Nguyễn Văn Minh', 		'Male',			'2', 		'4', 		'2021-04-01');
INSERT INTO `group`(GroupName, CreatorID, CreatDate)
VALUE 	('VTI Sale 01', '1', '2020-03-05'),
		('VTI Sale 02', '2', '2020-03-07'),
        ('VTI Sale 03', '3', '2020-03-09'),
        ('VTI Creator', '4', '2020-03-10'),
        ('5VTI Marketing 01', '5', '2020-03-28'),
        ('Management' , 8 ,'2020-04-08'),
        ('Chat with love',   9, '2020-04-09'),
        ('Vi Ti Ai',   10, '2020-04-10');
INSERT INTO GroupAccount(groupID, accountID, joindate)
VALUE	('1',	'1',	'2020-03-07'),
		('2', 	'1', 	'2020-03-09'),
        ('3', 	'1', 	'2020-03-10'),
        ('1', 	'4', 	'2020-03-28'),
        ('1', 	'5', 	'2020-04-06'),
        ('1', 	'6', 	'2020-04-07'),
        ('1', 	'8', 	'2020-04-08'),
        ('6', 	'8', 	'2020-04-08'),
        ('4', 	'9', 	'2020-04-09'),
        ('5', 	'8', 	'2020-04-10');
INSERT INTO typequestion(typename)
VALUE 	('Essay'),
		('Multiple-Choice');
	
INSERT INTO categoryquestion(categoryName)
VALUE	('Java'),
		('NET'),
        ('SQL'),
        ('Postman'),
        ('Ruby'),
        ('C++'),
        ('C sharp'),
        ('ADO.NET'),
        ('ASP.NET'),
        ('PHP');
        
        
INSERT INTO question(content, categoryID, TypeID, creatorID, createdate)
VALUE	('Câu hỏi về Java',		'1',		'1',		'1',		'2021-01-05'),
		('Câu Hỏi về PHP',		'2',		'2',		'2', 		'2021-01-06'),
        ('Hỏi về C#',			'2',		'2',		'2',		'2020-12-06'),
        ('Hỏi về Ruby',			'1',		'1',		'1',		'2020-04-06'),
        ('Câu Hỏi về Post', 	'1', 		'1', 		'4', 		'2020-05-06'),
        ('Hỏi về ADO.NET', 		'3',  		'2',  		'6', 		'2020-01-06'),
        ('Hỏi về ASP.NET',		'2',  		'1', 		'7',		'2020-04-06'),
        ('Hỏi về C++',			'8',   		'1',		'8',		'2020-01-07'),
        ('Câu Hỏi về SQL',		'4',   		'2', 		'9',		'2020-08-07'),
        ('Hỏi về Python',		'7',   		'1',  		'10',		'2020-04-07'),
        ('Hỏi về sdees',		'7',   		'1',  		'10',		'2020-04-07');
        
        
INSERT INTO answer(content, questionID, Iscorrect)
VALUE	('Trả lời 1', 		'1', 		0	),
		('Trả lời 2', 		'1', 		1	),
        ('Trả lời 3', 		'1', 		0	),
        ('Trả lời 4', 		'1', 		1	),
        ('Trả lời 5', 		'2', 		1	),
        ('Trả lời 6', 		'3', 		1	),
        ('Trả lời 7', 		'4', 		0	),
        ('Trả lời 8', 		'8', 		0	),
        ('Trả lời 9', 		'9', 		1	),
        ('Trả lời 10', 		'10', 		1	);
        
        
INSERT INTO Exam(`code`, title, categoryID, duration, creatorID, createdate)
VALUE	('VTIQ001'		, 'Đề thi C#'			,	1			,	60		,   '5'			,'2019-04-05'),
		('VTIQ002'		, 'Đề thi PHP'			,	10			,	60		,   '2'			,'2019-04-05'),
        ('VTIQ003'		, 'Đề thi C++'			,	9			,	120		,   '2'			,'2019-04-07'),
		('VTIQ004'		, 'Đề thi Java'			,	6			,	60		,   '3'			,'2021-01-22'),
		('VTIQ005'		, 'Đề thi Ruby'			,	5			,	120		,   '4'			,'2021-01-23'),
        ('VTIQ006'		, 'Đề thi Postman'		,	3			,	60		,   '6'			,'2021-01-24'),
        ('VTIQ007'		, 'Đề thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
        ('VTIQ008'		, 'Đề thi Python'		,	8			,	60		,   '8'			,'2018-04-07'),
		('VTIQ009'		, 'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2018-04-07'),
        ('VTIQ010'		, 'Đề thi ASP.NET'		,	7			,	90		,   '10'		,'2018-04-08');
        
        
INSERT INTO Examquestion(ExamID, 	questionID)
VALUE					(	1	,		1		),
						(	1	,		2		), 
						(	1	,		3		), 
						(	1	,		4		), 
						(	1	,		5		), 
						(	1	,		6		), 
						(	1	,		7		), 
						(	2	,		3		), 
						(	2	,		4		), 
						(	2	,		1		);


-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước

DROP TRIGGER IF EXISTS Question1;
DELIMITER $$

Create trigger Question1	Before INSERT 
ON `group`
For each row

Begin
	IF ((NEW.CreatDate) < date_sub(CURRENT_DATE(), INTERVAL 1 YEAR))
    THEN	
    SIGNAL SQLSTATE '45000'
    Set MESSAGE_TEXT = ' Createdate phải từ 1 năm trước đến nay';
    END IF;
End$$

 DELIMITER ;
 INSERT Into `group`(GroupName,CreatorID,CreatDate)
 VALUES ('a',1,'2018-05-05');
 
 
-- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào department "Sale" nữa, khi thêm thì hiện ra thông báo "Department "Sale" cannot add more user"

DROP TRIGGER IF EXISTS Question2;
DELIMITER $$

Create trigger Question2	Before INSERT 
ON `account`
For each row

Begin
	Declare Deparment_ID INT;
    Select DepartmentID INTO Deparment_ID
    From department
    Where DepartmentName = 'Sale';
	IF New.DepartmentID = Deparment_ID
    Then	
    signal sqlstate '45000'
    Set message_text = ' Department "Sale" cannot add more user';
    END IF;
End$$

 DELIMITER ;

INSERT Into `account`(Email, Username, Fullname, DepartmentID, PositionID, CreateDate)
Values				('â', 'e', 'sdsdsdsd', 6, 1, '2020-02-03');


 
-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user

DROP TRIGGER IF EXISTS Question3;
DELIMITER $$

Create trigger Question3 Before INSERT 
ON groupaccount
For each row

Begin
	
    IF New.GroupID in ( select GroupID
						From
						(	select GroupID, count(AccountID) 
							From groupaccount 
							GROUP BY GroupID
							Having count(AccountID)=5) t1 )
    Then	
    signal sqlstate '45000'
    Set message_text = 'Max five acc in each group';
    END IF;
End$$

 DELIMITER ;

INSERT INTO GroupAccount(groupID, accountID, joindate)
VALUE 						(1, 10, '2020-03-02') ;



-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question

DROP TRIGGER IF EXISTS Question4;
DELIMITER $$

Create trigger Question4 Before INSERT 
ON examquestion
For each row

Begin
	
    IF New.ExamID in ( select ExamID
						From
						(	select ExamID, count(QuestionID) 
							From examquestion 
							GROUP BY ExamID
							Having count(QuestionID)=10) t1 )
    Then	
    signal sqlstate '45000'
    Set message_text = 'Max Ten Quetioncc in each Exam';
    END IF;
End$$

 DELIMITER ;
 
 INSERT INTO examquestion(ExamID, QuestionID)
VALUE 						(1, 11) ;


-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là admin@gmail.com (đây là tài khoản admin, không cho phép user xóa),
-- còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông tin liên quan tới user đó

DROP TRIGGER IF EXISTS Question5;
DELIMITER $$

Create trigger Question5 Before Delete 
ON `account`
For each row

Begin

	IF OLD.email = 'admin@gmail.com'
	Then
         signal sqlstate '45000'
		Set message_text = 'Admin email ';
	END IF;

END $$

Delete From `account` WHERE Email = 'admin@gmail.com';


-- Question 6: Không sử dụng cấu hình default cho field DepartmentID của table Account, hãy tạo trigger cho phép người dùng khi tạo account không điền
-- vào departmentID thì sẽ được phân vào phòng ban "waiting Department"

DROP TRIGGER IF EXISTS Question6;
DELIMITER $$

Create trigger Question6 BEFORE INSERT 
ON `account`
For each row

Begin
	DECLARE V_de INT;
    SELECT  DepartmentID INTO V_de
    From department
    Where DepartmentName = 'Waiting Room';
	If NEW.DepartmentID is Null
    Then 
	Set NEW.DepartmentID  = V_de;
	END IF;

END $$

INSERT Into `account`(Email, Username, Fullname, DepartmentID, PositionID, CreateDate)
Values				('a', 'sd', 'sdsdsdsd', NULL, 1, '2020-02-03');


-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi
-- question, trong đó có tối đa 2 đáp án đúng.

DROP TRIGGER IF EXISTS Question7;
DELIMITER $$

Create trigger Question7 Before INSERT 
ON answer
For each row

Begin
	
    IF New.QuestionID in ( SELECT QuestionID
							From
							(select count(AnswerID) ,QuestionID
							From  answer
							GROUP BY QuestionID
							Having count(AnswerID)=4) t1 )
    OR	
     New.QuestionID IN ( SELECT QuestionID
							FROM
							(SELECT QuestionID,count(*) 
							FROM answer 
							GROUP BY QuestionID,IsCorrect  
							Having IsCorrect=1) t2 )
	Then
    signal sqlstate '45000'
    Set message_text = 'Can"t INSERT';
    END IF;
End$$

 DELIMITER ;

INSERT Into answer(Content,QuestionID,IsCorrect)
Values			('sfds', 1, 1);




--   Question 8: Viết trigger sửa lại dữ liệu cho đúng:
--   Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định  Thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database


DROP TRIGGER IF EXISTS Question8;
DELIMITER $$

Create trigger Question8 BEFORE INSERT 
ON account
FOR EACH ROW
BEGIN
	IF NEW.gender= 'nam'
    THEN 	Set NEW.gender= 'Male';
    END IF;
    
    IF NEW.gender= 'nữ'
    THEN 	Set NEW.gender= 'Female';
    END IF;
    
    IF NEW.gender= 'chưa xác định'
    THEN 	Set NEW.gender = 'UNknow';
    END IF;

END$$

 DELIMITER ;

INSERT Into `account`(Email, Username, Fullname,Gender, DepartmentID, PositionID, CreateDate)
Values				('af', 'sde', 'sdsddsdsd', 'Nam', 1,1, '2020-02-03');



-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày

DROP TRIGGER IF EXISTS Question9;
DELIMITER $$

CREATE TRIGGER Question9 BEFORE DELETE
ON exam
FOR EACH ROW

BEGIN
        IF OLD.ExamID IN (SELECT ExamID 
							FROM exam
							WHERE (CURRENT_DATE() - CreateDate) <=2) 
        THEN 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Can"t DELETE';
		END IF;
END$$

DELIMITER ;

DELETE FROM exam WHERE ExamID = 6;

 
-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các question khi question đó chưa nằm trong exam nào

-- Trigger delete
DROP TRIGGER IF EXISTS Question1001;
DELIMITER $$

CREATE TRIGGER Question1001 BEFORE DELETE 
ON question
FOR EACH ROW

BEGIN 
            
	IF OLD.QuestionID IN ( SELECT DISTINCT QuestionID
							FROM  examquestion )
    THEN 
	SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Can"t DELETE';
	END IF;
END$$

DELIMITER ;
   DELETE FROM question WHERE QuestionID = 5;
   
   
-- -- Trigger Update

DROP TRIGGER IF EXISTS Question1002;
DELIMITER $$

CREATE TRIGGER Question1002 BEFORE UPDATE 
ON question
FOR EACH ROW

BEGIN 
            
	IF OLD.QuestionID IN ( SELECT DISTINCT  QuestionID
							FROM  examquestion )
    THEN 
	SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Can"t Update';
	END IF;
END$$

DELIMITER ;

UPDATE question SET CreatorID =5 WHERE QuestionID = 5;


-- Question 12: Lấy ra thông tin exam trong đó:
-- Duration <= 30 thì sẽ đổi thành giá trị "Short time"
-- 30 < Duration <= 60 thì sẽ đổi thành giá trị "Medium time"
-- Duration > 60 thì sẽ đổi thành giá trị "Long time"

SELECT ExamID, `Code`, Title, CreatorID, CreateDate, Duration,
CASE 
	WHEN Duration <= 30 THEN 'SHORT TIME'
    WHEN  Duration <= 60 THEN 'MEDIUM TIME'
    ELSE 'LONG TIME'
END AS DurationS
FROM exam;

-- Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên
-- là the_number_user_amount và mang giá trị được quy định như sau:
-- Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
-- Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
-- Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher


SELECT g.GroupID, t1.number_of_group,
CASE
	WHEN number_of_group IS NULL THEN ' Không có thành viên'
	WHEN number_of_group <= 5 THEN 'few'
    WHEN number_of_group <= 20 THEN 'normal'
    WHEN number_of_group >20 THEN 'higher'
END AS DANH_GIA
FROM `group` g
LEFT JOIN (SELECT GroupID, count(AccountID)  AS number_of_group
			FROM groupaccount
            GROUP BY GroupID) t1 
ON g.GroupID = t1.GroupID;


-- Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào không có user thì sẽ thay đổi giá trị 0 thành "Không có User"

SELECT t1.DepartmentID, 
IF(t1.number_of_user = 0 , 'không có user', t1.number_of_user)
FROM 
( SELECT d.DepartmentID, count(AccountID) AS number_of_user
	FROM department d 
    LEFT JOIN `account` a ON d.DepartmentID = a.DepartmentID
    GROUP BY d.DepartmentID) t1

