DROP DATABASE IF EXISTS Testing_System;
CREATE DATABASE Testing_System;
USE Testing_System;

CREATE TABLE Department(
	DepartmentID		TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DepartmentName		VARCHAR(30) NOT NULL
);

CREATE TABLE `Position`(
	PositionID 			TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	PositionName		VARCHAR(30) NOT NULL
);
CREATE TABLE `Account`(
	AccountID			INT AUTO_INCREMENT PRIMARY KEY,
    Email				VARCHAR(30) NOT NULL,
    Username			VARCHAR(30) NOT NULL,
    Fullname			VARCHAR(30) NOT NULL,
    DepartmentID		TINYINT UNSIGNED,
	PositionID			TINYINT UNSIGNED,
    CreateDate			VARCHAR(30),
    FOREIGN KEY ( DepartmentID) REFERENCES Department(DepartmentID) ON DELETE CASCADE,
    FOREIGN KEY ( PositionID) REFERENCES `position`(positionID) ON DELETE CASCADE
); 
CREATE TABLE `Group`(
	GroupID				TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    GroupName			VARCHAR(50) NOT NULL,
	CreateID			INT NOT NULL,
	CreatDate			VARCHAR(30)
);
CREATE TABLE GroupAccount(
	GroupID				TINYINT UNSIGNED NOT NULL,
    AccountID			INT NOT NULL,
    JoinDate			VARCHAR(30),
    FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID) ON DELETE CASCADE,
    FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID) ON DELETE CASCADE
);
CREATE TABLE TypeQuestion(
	TypeID 				TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    TypeName			VARCHAR(50)
);
CREATE TABLE CategoryQuestion(
	CategoryID			TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CategoryName		VARCHAR(50)
);
CREATE TABLE Question(
	QuestionID			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Content				VARCHAR(50),
    CategoryID			TINYINT UNSIGNED,
    TypeID				TINYINT UNSIGNED,
    CreatorID			INT,
    CreateDate			VARCHAR(30),
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID) ON DELETE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID) ON DELETE CASCADE
);
CREATE TABLE Answer(
	AnswerID			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Content				VARCHAR(50),
    QuestionID			INT,
    IsCorrect			ENUM('Đúng','Sai'),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID) ON DELETE CASCADE
);
CREATE TABLE Exam(
	ExamID				TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Code`				INT,
    Title				VARCHAR(50),
    CategoryID			INT,
    Duration			INT,
    CreatorID			INT,
    CreateDate			VARCHAR(30)
);
CREATE TABLE ExamQuestion(
	ExamID				TINYINT UNSIGNED NOT NULL,
    QuestionID			INT,
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID) ON DELETE CASCADE,
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID) ON DELETE CASCADE
);
INSERT INTO department (departmentName)
VALUE   ('Tài chính'),
		('Nhân sự'),
		('Giám đốc'),
		('Phó giám đốc'),
		('Bảo an');
INSERT INTO position (positionName)
VALUE 	('Giám đốc'),
		('Thư kí'),
		('phó giám đốc'),
        ('Bảo vệ'),
        ('Nhân viên');
INSERT INTO `account`(Email, Username, Fullname, departmentID, positionID, createdate)
VALUE 	('1' , 'A' , 'qwe', '1', '1', '06-01-2018'),
		('2' , 'B' , 'asd', '2', '2', '06-01-2018'),
        ('3' , 'C' , 'zxc', '3', '3', '06-01-2018'),
        ('4' , 'D' , 'vbn', '4', '4', '06-01-2018'),
        ('5' , 'E' , 'tyu', '5', '5', '06-01-2018');
INSERT INTO `group`(GroupName, CreateID, CreatDate)
VALUE 	('1', '1', '06-01-2018'),
		('2', '2', '06-01-2018'),
        ('3', '3', '06-01-2018'),
        ('4', '4', '06-01-2018'),
        ('5', '5', '06-01-2018');
INSERT INTO GroupAccount(groupID, accountID, joindate)
VALUE	('1', '1', '06-01-2018'),
		('2', '2', '06-01-2018'),
        ('3', '3', '06-01-2018'),
        ('4', '4', '06-01-2018'),
        ('5', '5', '06-01-2018');
INSERT INTO typequestion(typename)
VALUE 	('Very Easy'),
		('Easy'),
        ('Normal'),
        ('Hard'),
        ('Very Hard');
INSERT INTO categoryquestion(categoryName)
VALUE	('Java'),
		('NET'),
        ('SQL'),
        ('Postman'),
        ('Ruby');
INSERT INTO question(content, categoryID, TypeID, creatorID, createdate)
VALUE	('Tên là gì?', '1', '1', '1', '06-01-2018' ),
		('Nhà ở đâu?', '2', '2', '2', '06-01-2018' ),
        ('Ăn gì chưa?', '2', '2', '2', '06-01-2018' ),
        ('Có bồ chưa?', '1', '1', '1', '06-01-2018' ),
        ('Làm bồ nhé?', '1', '1', '1', '06-01-2018' );
INSERT INTO answer(content, questionID, Iscorrect)
VALUE	('Trần Đức Hiếu', '1', 'Đúng'),
		('Hải Phòng', '2', 'Đúng'),
        ('Ăn rồi', '3', 'Đúng'),
        ('Chưa', '4', 'Sai'),
        ('Chịu thôi', '5', 'Đúng');
INSERT INTO Exam(`code`, title, categoryID, duration, creatorID, createdate)
VALUE	('1', 'A' ,'1', '30', '1', '06-01-2018'),
		('2', 'B' ,'2', '30', '2', '06-01-2018'),
        ('3', 'C' ,'3', '30', '3', '06-01-2018'),
        ('4', 'D' ,'4', '30', '4', '06-01-2018'),
        ('5', 'E' ,'5', '30', '5', '06-01-2018');
INSERT INTO Examquestion(ExamID, questionID)
VALUE	('1', '1'),
		('2', '2'),
        ('3', '3'),
        ('4', '4'),
        ('5', '5');
SELECT * FROM department;
SELECT * FROM position;
SELECT * FROM `account`;
SELECT * FROM `group`;
SELECT * FROM typequestion;
SELECT * FROM categoryquestion;
SELECT * FROM question;
SELECT * FROM answer;
SELECT * FROM Exam;
SELECT * FROM Examquestion;
SELECT * FROM groupaccount;