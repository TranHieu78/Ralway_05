DROP DATABASE IF EXISTS Testing_System;
CREATE DATABASE Testing_System;
USE Testing_System;

CREATE TABLE Department(
	DepartmentID		TINYINT  ,
    DepartmentName		VARCHAR(30)
);

CREATE TABLE `Position`(
	PositionID 			TINYINT  ,
	PositionName		VARCHAR(30)
);
CREATE TABLE `Account`(
	AccountID			INT  ,
    Email				VARCHAR(30),
    Username			VARCHAR(30),
    Fullname			VARCHAR(30),
    DepartmentID		TINYINT,
	PositionID			TINYINT,
    CreateDate			DATE
);
CREATE TABLE `Group`(
	GroupID				TINYINT  ,
    GroupName			VARCHAR(50),
	CreateID			INT,
	CreatDate			DATE
);
CREATE TABLE GroupAccount(
	GroupID				TINYINT ,
    AccountID			INT ,
    JoinDate			Date
);
CREATE TABLE TypeQuestion(
	TypeID 				TINYINT  ,
    TypeName			VARCHAR(50)
);
CREATE TABLE CategoryQuestion(
	CategoryID			TINYINT  ,
    CategoryName		VARCHAR(50)
);
CREATE TABLE Question(
	QuestionID			INT   ,
    Content				VARCHAR(50),
    CategoryID			TINYINT,
    TypeID				TINYINT,
    CreatorID			INT,
    CreateDate			Date
);
CREATE TABLE Answer(
	AnswerID			INT  ,
    Content				VARCHAR(50),
    QuestionID			INT,
    IsCorrect			BOOLEAN
);
CREATE TABLE Exam(
	ExamID				TINYINT  ,
    `Code`				INT,
    Title				VARCHAR(50),
    CategoryID			INT,
    Duration			INT,
    CreatorID			INT,
    CreateDate			Date
);
CREATE TABLE ExamQuestion(
	ExamID				TINYINT,
    QuestionID			INT
);