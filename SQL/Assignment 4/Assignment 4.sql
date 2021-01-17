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
						('4' ,		'D' , 		'Nguyễn Văn Bách', 		'10', 		'3', 		'2021-03-08'),
						('5' ,		'E' , 		'Phạm Thị Hoa', 		'5', 		'4', 		'2020-03-10'),
						('6' ,		'F' , 		'Lê Thành Nam', 		'8', 		'2', 		'2020-04-05'),
						('7' ,		'G' , 		'Trần Thành Việt', 		'2', 		'3', 		'2021-04-07'),
						('8' ,		'H' , 		'Lê Việt Hoàng', 		'8', 		'4', 		'2020-04-07'),
						('9' , 		'J' , 		'Phạm Thị Mơ', 			'8', 		'3', 		'2020-04-09'),
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
		('2', 	'2', 	'2020-03-09'),
        ('3', 	'3', 	'2020-03-10'),
        ('3', 	'4', 	'2020-03-28'),
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


-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT `account`.AccountID , `account`.Fullname, `account`.DepartmentID, department.DepartmentName
	FROM `account`
    JOIN department ON `account`.DepartmentID = department.departmentID;
    
    
-- Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT `account`.AccountID , `account`.Fullname, `account`.Username,  `account`.Email, `account`.CreateDate , `account`.DepartmentID, department.DepartmentName
	FROM `account`
    JOIN department ON `account`.DepartmentID = department.departmentID
    HAVING CreateDate > '2020-12-20';
    

-- Viết lệnh để lấy ra tất cả các developer
SELECT `account`.AccountID, `account`.Fullname, `account`.PositionID, `position`.PositionName
	FROM `account`
    JOIN `position` ON `account`.PositionID = `position`.PositionID
    HAVING PositionName = 'dev';
    
    
 -- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên  
 SELECT  `account`.DepartmentID, department.DepartmentName, count(`account`.DepartmentID) AS 'Số nhân viên'
	FROM `account`
    JOIN department ON `account`.DepartmentID = department.departmentID
	GROUP BY `account`.DepartmentID
	HAVING (count(`account`.DepartmentID) > 3);
    
    
-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT question.QuestionID, question.Content, count(examquestion.QuestionID) AS ' Số lượng'
    FROM question
	JOIN examquestion ON  question.QuestionID = examquestion.QuestionID
    GROUP BY question.QuestionID
    HAVING count(examquestion.QuestionID) = (SELECT max(e)
												FROM (SELECT count(examquestion.QuestionID) As e 
														FROM examquestion
                                                        GROUP BY examquestion.QuestionID) t1 ) ;


-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT categoryquestion.CategoryName, IF(count(question.CategoryID) is Null, 0, count(question.CategoryID)) AS ' Số câu hỏi sử dụng'
	FROM categoryquestion
	LEFT JOIN question ON categoryquestion.CategoryID = question.CategoryID
    GROUP BY categoryquestion.CategoryName;
    
    
-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT question.Content, IF(count(Examquestion.ExamID) is NULL, 0, count(Examquestion.ExamID)) AS ' Số bài thi sử dụng ' 
	FROM question
	LEFT JOIN Examquestion ON Examquestion.questionID = question.questionID
    GROUP BY question.Content;
	
    
-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT question.Content, count(answer.QuestionID) AS ' số câu trả lời ' 
	FROM question
    JOIN answer ON question.QuestionID = answer.QuestionID
    GROUP BY question.Content
	HAVING count(answer.QuestionID) = ( SELECT MAX(e) 
										FROM (SELECT  count(answer.QuestionID) AS e
													FROM answer
                                                    GROUP BY answer.QuestionID ) t1 );
                
-- Question 9: Thống kê số lượng account trong mỗi group
SELECT `group`.GroupID, count(groupaccount.GroupID) AS ' Số lượng account'
	FROM `group`
    JOIN groupaccount ON `group`.GroupID = groupaccount.GroupID
    GROUP BY groupaccount.GroupID;


-- Question 10: Tìm chức vụ có ít người nhất
SELECT t1.PositionName, min(t2) AS ' Số người'
FROM
		(	SELECT `position`.PositionName , count(`account`.PositionID) AS t2
				FROM position
				JOIN `account` ON `position`.PositionID = `account`.PositionID
				GROUP BY `account`.PositionID) AS t1;
                
                
-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
 SELECT t1.DepartmentID, t2.DepartmentName, t2.PositionID, t2.PositionName,
	if(t2.number_of_account is null , 0 ,t2.number_of_account) AS ' Số lượng'
FROM
	(SELECT 
        department.DepartmentID, `position`.PositionID
    FROM
        department 
    CROSS JOIN `position` 
    ORDER BY department.DepartmentID , `position`.PositionID) AS T1
JOIN 
 (SELECT 
	department.DepartmentID,
    department.DepartmentName,
     `position`.PositionName,
     `position`.PositionID, 
            COUNT(`account`.AccountID) AS number_of_account
    FROM
		`position`
    LEFT JOIN `account` ON `position`.PositionID = `account`.PositionID
    RIGHT JOIN department  ON `account`.DepartmentID = Department.DepartmentID
	GROUP BY department.DepartmentID,   `position`.PositionID ) AS t2
    ON t1.DepartmentID = t2.DepartmentID AND t1.PositionID = t2.PositionID
GROUP BY t1.DepartmentID, t2.PositionID
ORDER BY t1.DepartmentID, t2.PositionID;
	
-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
SELECT question.QuestionID , question.Content, typequestion.TypeName, categoryquestion.CategoryName, question.CreatorID, question.CreateDate
	FROM question
    JOIN typequestion ON typequestion.TypeID = question.TypeID
    JOIN categoryquestion ON categoryquestion.CategoryID = question.CategoryID;
    
    
-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT typequestion.TypeName, count(question.TypeID)
	FROM question
    JOIN typequestion ON typequestion.TypeID = question.TypeID
    GROUP BY question.TypeID;
    

-- Question 14 + 15:Lấy ra group không có account nào 
SELECT 	`group`.GroupName , count(groupaccount.GroupID) AS ' Số NGười'
	FROM `group`
    LEFT JOIN groupaccount ON `group`.GroupID = groupaccount.GroupID
    GROUP BY groupaccount.GroupID
    HAVING count(groupaccount.GroupID) = 0;
    

-- Question 16: Lấy ra question không có answer nào 
SELECT question.QuestionID, question.Content , count(answer.QuestionID) AS ' số câu trả lời'
	FROM question
    LEFT JOIN answer ON question.QuestionID = answer.QuestionID 
    GROUP BY question.QuestionID
    HAVING count(answer.QuestionID) = 0;
    
    
-- Question 17: a) Lấy các account thuộc nhóm thứ 1
SELECT AccountID , GroupID
	FROM groupaccount
	WHERE GroupID = 1;
    
--				b) Lấy các account thuộc nhóm thứ 2
SELECT AccountID, GroupID
	FROM groupaccount
	WHERE GroupID = 2;
    
--				c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT AccountID, GroupID
	FROM groupaccount
	WHERE GroupID = 1
UNION
SELECT AccountID, GroupID
	FROM groupaccount
	WHERE GroupID = 2;
    

-- Question 18: a) Lấy các group có lớn hơn 5 thành viên
SELECT `group`.GroupName , count(groupaccount.AccountID)
	FROM `group`
    JOIN groupaccount ON `group`.GroupID = groupaccount.GroupID
    GROUP BY groupaccount.AccountID
    HAVING count(groupaccount.AccountID) > 5;
    
--				b) Lấy các group có nhỏ hơn 7 thành viên
SELECT `group`.GroupName , count(groupaccount.AccountID)
	FROM `group`
    JOIN groupaccount ON `group`.GroupID = groupaccount.GroupID
    GROUP BY groupaccount.AccountID
    HAVING count(groupaccount.AccountID) <7;
    
--				c) Ghép 2 kết quả từ câu a) và câu b)
SELECT `group`.GroupName , count(groupaccount.AccountID) AS ' Số thành  viên'
	FROM `group`
    JOIN groupaccount ON `group`.GroupID = groupaccount.GroupID
    GROUP BY groupaccount.AccountID
    HAVING count(groupaccount.AccountID) > 5
UNION
SELECT `group`.GroupName , count(groupaccount.AccountID)
	FROM `group`
    JOIN groupaccount ON `group`.GroupID = groupaccount.GroupID
    GROUP BY groupaccount.AccountID
    HAVING count(groupaccount.AccountID) <7; 