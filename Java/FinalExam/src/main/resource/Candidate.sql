DROP DATABASE IF EXISTS Final_Exam;
CREATE DATABASE Final_Exam;
USE Final_Exam;

CREATE TABLE ExperienceCandidate(
	FirstName		VARCHAR(30) NOT NULL ,
    LastName		VARCHAR(30) NOT NULL ,
	Phone			VARCHAR(30) NOT NULL ,
	Email			VARCHAR(30) NOT NULL ,
    ExpInYear		INT UNSIGNED,
    ProSkill		VARCHAR(20)
);

CREATE TABLE FresherCandidate(
	FirstName		VARCHAR(30) NOT NULL,
    LastName		VARCHAR(30) NOT NULL,
	Phone			VARCHAR(30) NOT NULL,
	Email			VARCHAR(30) NOT NULL,
    GraduationRank	ENUM('Excellence','Good','Fair','Poor')
);


