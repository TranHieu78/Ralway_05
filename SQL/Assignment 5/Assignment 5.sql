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
						('2' , 		'B' , 		'Hoàng Thái Hạnh', 		'4', 		'2', 		'2021-03-05'),
						('3' , 		'C' , 		'Hồ Bá Nhật', 			'8', 		'4', 		'2020-03-07'),
						('4' ,		'D' , 		'Nguyễn Văn Bách', 		'6', 		'3', 		'2021-03-08'),
						('5' ,		'E' , 		'Phạm Thị Hoa', 		'5', 		'4', 		'2020-03-10'),
						('6' ,		'F' , 		'Lê Thành Nam', 		'8', 		'2', 		'2020-04-05'),
						('7' ,		'G' , 		'Trần Thành Việt', 		'6', 		'3', 		'2021-04-07'),
						('8' ,		'H' , 		'Lê Việt Hoàng', 		'8', 		'4', 		'2020-04-07'),
						('9' , 		'J' , 		'Phạm Thị Mơ', 			'6', 		'3', 		'2020-04-09'),
						('10' , 	'K' , 		'Nguyễn Văn Minh', 		'2', 		'4', 		'2021-04-01');
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
        ('8', 	'8', 	'2020-04-08'),
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
VALUE	('Câu hỏi về Java',		'1',		'1',		'1',		'2020-04-05'),
		('Câu Hỏi về PHP',		'2',		'2',		'2', 		'2020-04-06'),
        ('Hỏi về C#',			'2',		'2',		'2',		'2020-04-06'),
        ('Hỏi về Ruby',			'1',		'1',		'1',		'2020-04-06'),
        ('Hỏi về Postman', 		'1', 		'1', 		'4', 		'2020-04-06'),
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


-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
		CREATE OR REPLACE VIEW NV_Sale AS
			SELECT `account`.AccountID, `account`.Fullname, `account`.Username, `account`.Email, `account`.PositionID, department.DepartmentName
				FROM `account`
				JOIN department ON department.DepartmentID = `account`.DepartmentID
                WHERE department.departmentName = "sale";
SELECT *
	FROM NV_Sale;
    
    
-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE OR REPLACE VIEW NV_Group AS
	SELECT `account`.AccountID, `account`.Fullname, `account`.Username, `account`.Email, `account`.PositionID, `account`.DepartmentID, count(groupaccount.GroupID) AS Number_Of_Group
    FROM `account`
	JOIN groupaccount ON groupaccount.AccountID =  `account`.AccountID
    GROUP BY groupaccount.AccountID
    HAVING count(groupaccount.GroupID) = ( SELECT max(E)
												FROM ( SELECT count(groupaccount.GroupID) AS E
														FROM groupaccount
                                                        GROUP BY AccountID) AS t1 );
SELECT *
	FROM NV_Group;
    

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 4 từ được coi là quá dài) và xóa nó đi
CREATE OR REPLACE VIEW Content AS
SELECT Content
FROM question
WHERE length(Content) - length(REPLACE(Content,' ','')) + 1 >= 4;

SELECT *
	FROM Content;

DELETE 
	FROM question
    WHERE length(Content) - length(REPLACE(Content,' ','')) + 1 >= 4;

    
    
-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE OR REPLACE VIEW NV_department AS
SELECT department.DepartmentName, count(`account`.DepartmentID) AS Number_of_People
	FROM department
    JOIN `account` ON `account`.DepartmentID = department.DepartmentID
    GROUP BY department.DepartmentName
    HAVING count(`account`.DepartmentID) = (	SELECT max(e)
													FROM (	SELECT count(`account`.DepartmentID) AS e
															FROM `account`
                                                            GROUP BY `account`.DepartmentID) t1 );
SELECT *
	FROM NV_department;


-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
CREATE OR REPLACE VIEW Question_Nguyen AS
SELECT question.Content, `account`.Fullname
	FROM question
    JOIN `account` ON question.CreatorID = `account`.AccountID
    WHERE substring_index(`account`.Fullname, ' ', 1) = 'Nguyễn';
    
SELECT *
	FROM Question_Nguyen;
    

    
    