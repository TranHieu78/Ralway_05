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
	AccountID			INT AUTO_INCREMENT PRIMARY KEY,
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
	CreatorID			INT NOT NULL,
	CreatDate			DATE,
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);
CREATE TABLE GroupAccount(
	GroupID				TINYINT UNSIGNED NOT NULL,
    AccountID			INT NOT NULL,
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
    CreatorID			INT,
    CreateDate			DATE,
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID) ON DELETE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID) ON DELETE CASCADE
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
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID) ON DELETE CASCADE
    );
CREATE TABLE ExamQuestion(
	ExamID				TINYINT UNSIGNED NOT NULL,
    QuestionID			INT,
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID) ON DELETE CASCADE,
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID) ON DELETE CASCADE,
    PRIMARY KEY (ExamID, QuestionID)
);
INSERT INTO department (departmentName)
VALUE   ('Tài chính'),
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
INSERT INTO `account`	(Email, 	Username, 	Fullname, 			departmentID, positionID, 	createdate)
VALUE 					('1' , 		'A' , 		'Trần Đức Hiếu', 		'3', 		'1', 		'2020-03-05'),
						('2' , 		'B' , 		'Hoàng Thái Hạnh', 		'4', 		'2', 		'2020-03-05'),
						('3' , 		'C' , 		'Hồ Bá Nhật', 			'1', 		'4', 		'2020-03-07'),
						('4' ,		'D' , 		'Nguyễn Văn Bách', 		'10', 		'3', 		'2020-03-08'),
						('5' ,		'E' , 		'Phạm Thị Hoa', 		'5', 		'3', 		'2020-03-10'),
						('6' ,		'F' , 		'Lê Thành Nam', 		'2', 		'2', 		'2020-04-05'),
						('7' ,		'G' , 		'Trần Thành Việt', 		'6', 		'3', 		'2020-04-07'),
						('8' ,		'H' , 		'Lê Việt Hoàng', 		'8', 		'4', 		'2020-04-07'),
						('9' , 		'J' , 		'Phạm Thị Mơ', 			'2', 		'3', 		'2020-04-09'),
						('10' , 	'K' , 		'Nguyễn Văn Minh', 		'2', 		'3', 		'2020-04-01');
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
		('2', 	'2', 	'2020-03-09'),
        ('3', 	'3', 	'2020-03-10'),
        ('4', 	'4', 	'2020-03-28'),
        ('5', 	'5', 	'2020-04-06'),
        ('6', 	'6', 	'2020-04-07'),
        ('7', 	'7', 	'2020-04-08'),
        ('8', 	'8', 	'2020-04-08'),
        ('4', 	'9', 	'2020-04-09'),
        ('5', 	'10', 	'2020-04-10');
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
VALUE	('Câu hỏi về Java',		'1',		'1',		'1',		'2020-04-05'),
		('Câu Hỏi về PHP',		'2',		'2',		'2', 		'2020-04-06'),
        ('Hỏi về C#',			'2',		'2',		'2',		'2020-04-06'),
        ('Hỏi về Ruby',			'1',		'1',		'1',		'2020-04-06'),
        ('Hỏi về Postman', 		'1', 		'1', 		'1', 		'2020-04-06'),
        ('Hỏi về ADO.NET', 		'3',  		'2',  		'6', 		'2020-04-06'),
        ('Hỏi về ASP.NET',		'2',  		'1', 		'7',		'2020-04-06'),
        ('Hỏi về C++',			'8',   		'1',		'8',		'2020-04-07'),
        ('Hỏi về SQL',			'4',   		'2', 		'9',		'2020-04-07'),
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
        ('VTIQ008'		, 'Đề thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
		('VTIQ009'		, 'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
        ('VTIQ010'		, 'Đề thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08');
INSERT INTO Examquestion(ExamID, questionID)
VALUE					(	1	,		5		),
						(	2	,		10		), 
						(	3	,		4		), 
						(	4	,		3		), 
						(	5	,		7		), 
						(	6	,		10		), 
						(	7	,		2		), 
						(	8	,		10		), 
						(	9	,		9		), 
						(	10	,		8		);

SELECT * 
	FROM Testing_System.department;
SELECT * 
	FROM Testing_System.department 
		WHERE department.departmentName = 'Sale' ;
SELECT Fullname, length(Fullname)
	FROM `account`
		WHERE length(Fullname)= (SELECT max(length(Fullname)) FROM `account`);
SELECT Email, Username, Fullname, length(Fullname),  createdate
	FROM `account` 
		WHERE departmentID = 3
        AND length(Fullname)= (SELECT max(length(Fullname)) FROM `account`);
SELECT GroupName 
	FROM `group` 
		WHERE CreatDate < '2020-12-20';
SELECT questionID, COUNT(answerID) 
	FROM answer Group By questionID 
		HAVING COUNT(answerID)>= 4; 
SELECT ExamID 
	FROM Exam
		WHERE duration >= 60
        AND	  createdate < '2020-12-20';
SELECT *
	FROM `group`
		ORDER BY CreatDate DESC
		LIMIT 5;
SELECT COUNT(AccountID)
	FROM `account`
		WHERE DepartmentID = 2;
SELECT *
	FROM `account`
		WHERE left(Fullname, 1)= 'd'
        AND	right(Fullname, 1)= 'O';
DELETE 
	FROM exam
		WHERE CreateDate < '2020-12-20';
DELETE 
	FROM question
		WHERE substring_index(content,' ',2) = 'câu hỏi';	
SELECT * FROM question;
UPDATE account
	SET Fullname = 'Nguyễn Bá Lộc',
		Email = 'loc.nguyenba@vti.com.vn'
	WHERE AccountID = 5;
UPDATE groupaccount
	SET GroupID =4
    WHERE AccountID =5;