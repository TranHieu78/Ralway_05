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
    IsCorrect			BIT DEFAULT 1,
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
VALUE   ('Phòng chờ'),
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
INSERT INTO `account`	(Email, 	Username, 					Fullname, 			departmentID, positionID, 	createdate)
VALUE 					('1' , 		'Hieu.Tranduc' , 			'Trần Đức Hiếu', 		'3', 		'1', 		'2020-03-05'),
						('2' , 		'Hanh.HoangThai' , 			'Hoàng Thái Hạnh', 		'4', 		'2', 		'2021-03-05'),
						('3' , 		'Nhat.Hoba' , 				'Hồ Bá Nhật', 			'8', 		'4', 		'2020-03-07'),
						('4' ,		'Bach.Nguyenbach' , 		'Nguyễn Văn Bách', 		'6', 		'3', 		'2021-03-08'),
						('5' ,		'Hoa.PhamThi' , 			'Phạm Thị Hoa', 		'5', 		'4', 		'2020-03-10'),
						('6' ,		'Nam.LeThanh' , 			'Lê Thành Nam', 		'8', 		'2', 		'2020-04-05'),
						('7' ,		'Viet.TranThanh' , 			'Trần Thành Việt', 		'6', 		'3', 		'2021-04-07'),
						('8' ,		'Hoang.LeViet' , 			'Lê Việt Hoàng', 		'8', 		'4', 		'2020-04-07'),
						('9' , 		'Mo.PhamThi' , 				'Phạm Thị Mơ', 			'6', 		'3', 		'2020-04-09'),
						('10' , 	'Minh.NguyenVan' , 			'Nguyễn Văn Minh', 		'2', 		'4', 		'2021-04-01');
INSERT INTO `group`(GroupName, CreatorID, CreatDate)
VALUE 	('VTI Sale 01', '1', '2019-03-05'),
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
        ('3', 	'4', 	'2020-03-28'),
        ('5', 	'5', 	'2020-04-06'),
        ('6', 	'6', 	'2020-04-07'),
        ('7', 	'8', 	'2020-04-08'),
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
        ('Hỏi về Python',		'7',   		'1',  		'10',		'2020-04-07');
        
        
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
		('VTIQ004'		, 'Đề thi Java'			,	6			,	60		,   '3'			,'2020-04-08'),
		('VTIQ005'		, 'Đề thi Ruby'			,	5			,	120		,   '4'			,'2020-04-10'),
        ('VTIQ006'		, 'Đề thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
        ('VTIQ007'		, 'Đề thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
        ('VTIQ008'		, 'Đề thi Python'		,	8			,	60		,   '8'			,'2018-04-07'),
		('VTIQ009'		, 'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2018-04-07'),
        ('VTIQ010'		, 'Đề thi ASP.NET'		,	7			,	90		,   '10'		,'2018-04-08');
        
        
INSERT INTO Examquestion(ExamID, 	questionID)
VALUE					(	1	,		5		),
						(	2	,		10		), 
						(	3	,		5		), 
						(	4	,		5		), 
						(	5	,		10		), 
						(	6	,		10		), 
						(	7	,		5		), 
						(	8	,		10		), 
						(	9	,		9		), 
						(	10	,		8		);
                        
                        
-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó 
DROP PROCEDURE IF EXISTS Question1;
DELIMITER $$
CREATE PROCEDURE Question1 (IN Deparment_ID INT)
BEGIN
	SELECT d.DepartmentID, a.AccountID, a.Username, a.Fullname, a.Email
	FROM `account` a
    JOIN department d ON d.DepartmentID = a.DepartmentID
    WHERE d.DepartmentID = Deparment_ID;
END$$

DELIMITER ;



-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS Question2;
DELIMITER $$

CREATE PROCEDURE Question2 ()
BEGIN
	SELECT g.GroupName, count(ga.AccountID)
    FROM `group` g
    LEFT JOIN groupaccount ga ON g.GroupID = ga.GroupID
    GROUP BY g.GroupName;
END$$

DELIMITER ;


    
--  Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại

DROP PROCEDURE IF EXISTS Question3;
CREATE OR REPLACE VIEW t1 AS
				SELECT typequestion.TypeName, question.QuestionID, month(question.CreateDate)
				FROM question 
                JOIN typequestion ON typequestion.TypeID = question.TypeID
                WHERE month(question.CreateDate) = month(now());

DELIMITER $$

CREATE PROCEDURE Question3()
BEGIN
	SELECT  t1.TypeName, count(t1.QuestionID) 
    FROM	t1
	GROUP BY  t1.TypeName;
END $$

DELIMITER ;


-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS Question4;
DELIMITER $$

CREATE PROCEDURE Question4()
BEGIN
	SELECT typequestion.TypeID , count(question.TypeID)
	FROM question
    JOIN typequestion ON question.TypeID = typequestion.TypeID
    GROUP BY typequestion.TypeID
    HAVING count(question.TypeID) = (	SELECT MAX(Number_Of_Question)
										FROM (	SELECT count(question.TypeID) AS Number_Of_Question
												FROM 	question
                                                GROUP BY question.TypeID) e1 );
END $$

DELIMITER ;


-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
DROP PROCEDURE IF EXISTS Question5;
DELIMITER $$

CREATE PROCEDURE Question5()
BEGIN
	SELECT typequestion.TypeID ,typequestion.TypeName , count(question.TypeID)
	FROM question
    JOIN typequestion ON question.TypeID = typequestion.TypeID
    GROUP BY typequestion.TypeID
    HAVING count(question.TypeID) = (	SELECT MAX(Number_Of_Question)
										FROM (	SELECT count(question.TypeID) AS Number_Of_Question
												FROM 	question
                                                GROUP BY question.TypeID) e1 );
END $$

DELIMITER ;


-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào
DROP PROCEDURE IF EXISTS Question6;
DELIMITER $$
CREATE PROCEDURE Question6( IN Nhap Varchar(30), IN Group_OR_User ENUM('group','user'))
Begin
	IF Group_OR_User = 'group'
	THEN	 SELECT GroupName 
			 FROM `group`
             Where	GroupName Like concat('%' , Nhap ,'%');
	Else
			SELECT AccountID, Email, Username, Fullname
            From `account`	
            Where Username like concat('%' , Nhap ,'%');
	END IF;
    END$$
    
DELIMITER ;


-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ tự động gán:
-- 				username sẽ giống email nhưng bỏ phần @..mail đi
-- 				positionID: sẽ có default là developer
-- 				departmentID: sẽ được cho vào 1 phòng chờ
-- 				Sau đó in ra kết quả tạo thành công


DROP PROCEDURE IF EXISTS Question7;
DELIMITER $$

CREATE PROCEDURE Question7( IN Nhap_Fullname VARCHAR(30), IN Nhap_Email VARCHAR(40) )
BEGIN
	DECLARE V_deparment INT;
    DECLARE V_Position INT;
    
    SELECT DepartmentName INTO V_deparment
    FROM department
    WHERE DepartmentName = 'Phòng chờ';
    
    SELECT PositionName INTO V_Position
    FROM `position`
    WHERE PositionName = 'Dev';
    
	Insert  into `account` ( Email, Username, Fullname, DepartmentID, PositionID, CreateDate )
	Value				   (Nhap_Email, Substring_index(Nhap_Fullname,'@',1), Nhap_Fullname, V_deparment, V_Position, NOW());
    
    IF row_count() >0 
    Then
		Set 
END$$

DELIMITER ;

call testing_system.Question7('Phạm Văn Lê', 'Le.PhamVan@gmail.com');

     
     
-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất

DROP PROCEDURE IF EXISTS Question8;
DELIMITER $$

CREATE PROCEDURE Question8(IN Essay_OR_MultipleChoice ENUM('Essay','MultipleChoice'))
Begin
	IF Essay_OR_MultipleChoice = 'Essay'
    Then 
    select question.Content, length(question.Content)
			From question
            Group by question.Content
            Having length(question.Content) = ( select max(length(question.Content))
										From question 
										join typequestion  on typequestion.TypeID = question.TypeID
										Where typequestion.TypeName = 'Essay') ;
	Else 
    select question.Content, length(question.Content) 
			From question
            Group by question.Content
            Having length(question.Content) = ( select max(length(question.Content))
										From question 
										join typequestion  on typequestion.TypeID = question.TypeID
										Where typequestion.TypeName = 'Multiple-Choice') ;	
	END IF;																										
END $$

DELIMITER ;



-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID

DROP PROCEDURE IF EXISTS Question9;
DELIMITER $$

CREATE PROCEDURE Question9(IN ID INT)
BEGIN
	DELETE 
	FROM exam
    Where ExamID = ID;
END$$

DELIMITER ;
 
-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng store ở câu 9 để xóa)
-- Sau đó in số lượng record đã remove từ các table liên quan trong khi removing

DROP PROCEDURE IF EXISTS Question10;
DELIMITER $$

CREATE PROCEDURE Question10()
Begin
	Declare V_R_Q INT;
    Declare V_R_EQ INT;
  
	DELETE
    FROM examquestion
     Where Year(now()) - Year(CreateDate) = 3;
	SELECT ROW_count() INTO V_R_EQ;
  
  
    DELETE 
    From exam
    Where Year(now()) - Year(CreateDate) = 3;
     SELECT Row_count() Into V_R_EQ;
     
    SELECT V_R_Q, V_R_EQ;

END$$

DELIMITER ;

-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được chuyển về phòng ban default là phòng ban chờ việc
DROP PROCEDURE IF EXISTS Question11;
DELIMITER $$

CREATE PROCEDURE  Question11(IN Department_name Varchar(30))
Begin

	Update `account`
	SET	 DepartmentID = 1
	Where DepartmentID = ( Select DepartmentID 
							From department
							Where  DepartmentName = Department_name);
	
    Delete 
    From Department
    Where DepartmentName = Department_name;

END$$

DELIMITER ;

-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay

DROP PROCEDURE IF EXISTS Question12;
DELIMITER $$

CREATE PROCEDURE  Question12()
Begin
		Drop table if EXISTS `Month`;
		Create  Table `Month`(
					MonthID			TinyInt Unsigned Primary KEY
                );
		Insert INTO `Month`(MonthID)
        Value		(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);		
        
        
		Create or replace view t2 As
            Select MonthID, MONTH(CreateDate) AS MonthQ, year(CreateDate) AS yearQ
			From	`Month`, question ;
      
      Select	 t2.MonthID AS 'Tháng',
				if(t3.number_question is null, 0, t3.number_question) AS ' Số câu hỏi tạo trong năm'
        From	t2
		Left Join
				( Select t2.MonthID, count(t2.MonthQ) AS number_question
					FROM t2
                    Where t2.MonthID= t2.MonthQ
                    AND yearQ = Year(now())
                    GRoup by t2.MonthID ) AS t3 ON t2.MonthID = t3.MonthID
		Group by t2.MonthID;
      

END$$

DELIMITER ;

-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng gần đây nhất
-- (Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng") 

DROP PROCEDURE IF EXISTS Question13;
DELIMITER $$

CREATE PROCEDURE  Question13()
Begin
		Drop table if EXISTS `Month`;
		Create  Table `Month`(
					MonthID			TinyInt Unsigned Primary KEY,
                    YearID			INT Unsigned
                );
		Insert INTO `Month`(MonthID,																			YearID										   )
        Value		(MONTH(CURRENT_DATE - INTERVAL 5 MONTH),		If(MONTH(CURRENT_DATE)-MONTH(CURRENT_DATE - INTERVAL 5 MONTH)<0,Year(now())-1,Year(now())) ),
					(MONTH(CURRENT_DATE - INTERVAL 4 MONTH),		If(MONTH(CURRENT_DATE)-MONTH(CURRENT_DATE - INTERVAL 4 MONTH)<0,Year(now())-1,Year(now())) ),
                    (MONTH(CURRENT_DATE - INTERVAL 3 MONTH),		If(MONTH(CURRENT_DATE)-MONTH(CURRENT_DATE - INTERVAL 3 MONTH)<0,Year(now())-1,Year(now())) ),
                    (MONTH(CURRENT_DATE - INTERVAL 2 MONTH),		If(MONTH(CURRENT_DATE)-MONTH(CURRENT_DATE - INTERVAL 2 MONTH)<0,Year(now())-1,Year(now())) ),	 
                    (MONTH(CURRENT_DATE - INTERVAL 1 MONTH),		If(MONTH(CURRENT_DATE)-MONTH(CURRENT_DATE - INTERVAL 1 MONTH)<0,Year(now())-1,Year(now())) ),
					(MONTH(CURRENT_DATE),							Year(now())																				   ); 
                    
		Create or replace view t2 As
            Select MonthID,YearID, MONTH(CreateDate) AS MonthQ, year(CreateDate) AS yearQ
			From	`Month`, question ; 
            
		Select	 t2.MonthID AS 'Tháng',
				if(t3.number_question is null, 'không có câu hỏi nào trong tháng', t3.number_question) AS ' Số câu hỏi tạo trong năm'
        From	t2
		Left Join
				( Select t2.MonthID, count(t2.MonthQ) AS number_question
					FROM t2
                    Where t2.MonthID= t2.MonthQ
                    AND yearQ = YearID
                    GRoup by t2.MonthID ) AS t3 ON t2.MonthID = t3.MonthID
		Group by t2.MonthID;
      
DELIMITER ;

