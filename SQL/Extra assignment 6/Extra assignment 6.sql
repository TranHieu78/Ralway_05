DROP DATABASE IF EXISTS Manager;
CREATE DATABASE Manager;
USE Manager;

CREATE TABLE Employee(
		EmployeeID					INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        EmployeeLastName			VARCHAR(10) NOT NULL,
        EmployeeFirstName			VARCHAR(10) NOT NULL,
        EmployeeHireName			VARCHAR(10) NOT NULL,
        EmployeeStatus				VARCHAR(30) NOT NULL,
        SupervisorID				INT UNSIGNED,
        SodalsecurityNumber			INT UNSIGNED NOT NULL
);

CREATE TABLE Project(
		ProjectID					INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        ManagerID					INT UNSIGNED NOT NULL UNIQUE,
        ProjectName					VARCHAR(30) NOT NULL,
        ProjectStartDate			DATE NOT NULL,
        ProjectDescription			VARCHAR(30),
        ProjectDetailt				VARCHAR(100) NOT NULL,
        ProjectCompledOn			DATE,
		FOREIGN KEY ( ManagerID) REFERENCES Employee(EmployeeID) ON DELETE CASCADE
);

CREATE TABLE Project_Modules(
		ModuleID						INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        ProjectID						INT UNSIGNED NOT NULL,
        EmployeeID						INT UNSIGNED NOT NULL,
        ProjectModuleDate				DATE NOT NULL,
        ProjectModuleCompledOn			DATE NOT NULL,
        ProjectModuleDescription		VARCHAR(30),
        FOREIGN KEY ( EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE CASCADE,
        FOREIGN KEY ( ProjectID) REFERENCES Project(ProjectID) ON DELETE CASCADE
);

CREATE TABLE Work_Done(
		WorkDoneID				INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        EmployeeID				INT UNSIGNED NOT NULL,
        ModuleID				INT UNSIGNED NOT NULL,
        WorkDoneDate			DATE UNIQUE,
        WorkDoneDescription		VARCHAR(30),
        WorkDoneStatus			ENUM('Đã hoàn thành','Chưa hoàn thành'),
        FOREIGN KEY ( EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE CASCADE,
        FOREIGN KEY ( ModuleID) REFERENCES Project_Modules(ModuleID) ON DELETE CASCADE
);

INSERT INTO Employee(EmployeeLastName,			EmployeeFirstName,			EmployeeHireName,			EmployeeStatus,			SupervisorID,			SodalsecurityNumber)
VALUES				(	'Hiếu',						'Trần',						'Đức',						'đang làm',				2,						0708),
					(	'Hạnh',						'Hoàng',					'Thái',						'đang làm',				3,						1604),
                    (	'Nguyên',					'Trần',						'Khôi',						'Rảnh',					2,						0802);

INSERT INTO Project(ManagerID,		ProjectName,		ProjectStartDate,		ProjectDescription,		ProjectDetailt,			ProjectCompledOn)
VALUES				(1,					'a',				'2020-03-08',				'nice',			'chuẩn bị thêm',		'2020-09-06'),
					(2,					'b',				'2020-12-18',				'nice',			'chuẩn bị thêm',		'2021-02-13'),
                    (3,					'c',				'2020-11-26',				'nice',			'chuẩn bị thêm',		'2021-01-20');
                    
INSERT INTO Project_Modules(ProjectID,		EmployeeID,		ProjectModuleDate,		ProjectModuleCompledOn,		ProjectModuleDescription)
VALUES						(	1,				1,				'2020-11-12',			'2021-01-03',					'Hơi chậm'),
							(	2,				2,				'2020-12-20',			'2021-02-01',					'Hơi chậm'),
                            (	3,				3,				'2020-12-02',			'2020-12-15',						'Ổn');

INSERT INTO Work_Done(EmployeeID		,ModuleID,		WorkDoneDate,		WorkDoneDescription,		WorkDoneStatus)
VALUES				(	1,					3,				'2020-12-16',			'OK',				'Đã hoàn thành'),
					(	2,					2,				'2021-02-02',			'OK',				'Đã hoàn thành'),
                    (	3,					2,				NULL,					'Bad',				'Chưa hoàn thành');
                    
                    
                    
                    
-- Viết stored procedure (không có parameter) để Remove tất cả thông tin
-- project đã hoàn thành sau 3 tháng kể từ ngày hiện. In số lượng record đã
-- remove từ các table liên quan trong khi removing (dùng lệnh print)


DROP PROCEDURE IF EXISTS Remove_Project;
DELIMITER $$

CREATE PROCEDURE  Remove_Project()
BEGIN
	DECLARE V_Delete INT;
	DELETE
    FROM project
    WHERE (MONTH(CURRENT_DATE - INTERVAL 3 MONTH) - MONTH(ProjectCompledOn)) < 3;
    
	SELECT ROW_COUNT() INTO V_Delete;
    SELECT V_Delete;
    
END$$
      
DELIMITER ;

Call Remove_Project();



-- Viết stored procedure (có parameter) để in ra các module đang được thực hiện

DROP PROCEDURE IF EXISTS Working_Module;
DELIMITER $$

CREATE PROCEDURE  Working_Module(IN NHAP ENUM('Đã hoàn thành','Chưa hoàn thành'))
BEGIN
	SELECT P.ModuleID,	P.ProjectID,	P.EmployeeID, P.ProjectModuleDescription
    FROM	project_modules P
    JOIN 	work_done		W on W.ModuleID =  P.ModuleID
    WHERE 	WorkDoneStatus = NHAP;
    
END$$
      
DELIMITER ;

call manager.Working_Module('chưa hoàn thành');


-- Viết hàm (có parameter) trả về thông tin 1 nhân viên đã tham gia làm mặc
-- dù không ai giao việc cho nhân viên đó (trong bảng Works)

DROP FUNCTION IF EXISTS Working_Module;
DELIMITER $$

CREATE FUNCTION	Inf_User(NHAP )





