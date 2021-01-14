DROP DATABASE IF EXISTS Extra_Assignment_4;
CREATE DATABASE Extra_Assignment_4;
USE Extra_Assignment_4;


-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu
CREATE TABLE Department(
			Department_Number 		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
            Department_Name			VARCHAR(30) NOT NULL
);

CREATE TABLE Employee(
			Employee_Number			INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
            Employee_Name			VARCHAR(30),
            Department_Number		TINYINT UNSIGNED,
            FOREIGN KEY Employee(Department_Number) REFERENCES Department(Department_Number)
);

CREATE TABLE Employee_Skill_Table(
			Employee_Number			INT UNSIGNED,
            Skill_Code				TINYINT NOT NULL,
            DateRegistered			DATE,
             FOREIGN KEY Employee_Skill_Table(Employee_Number) REFERENCES Employee(Employee_Number),
            PRIMARY KEY( Employee_Number, Skill_Code)
);


-- Question 2: Thêm ít nhất 10 bản ghi vào table

INSERT INTO Department(Department_Name)
VALUE					('Tài chính'),
						('Nhân sự'),
						('Giám đốc'),
						('Phó giám đốc'),
						('Marketing'),
						('Sale'),
						('Bán Hàng'),
						('Kỹ thuật'),
						('Tư vấn khách hàng'),
						('Bảo an');
                        
INSERT INTO Employee(Employee_Name, 	Department_Number)
VALUE				('Trần Đức Hiếu',			3),
					('Hoàng Thái Hạnh',			4),	
					('Hồ Bá Nhật',				2), 			
					('Nguyễn Văn Bách',			5), 	
					('Phạm Thị Hoa',			6),
					('Lê Thành Nam',			6), 		
					('Trần Thành Việt',			8),		
					('Lê Việt Hoàng',			6),		
					('Phạm Thị Mơ',				9), 		
					('Nguyễn Văn Minh',			6);	
                    
INSERT INTO Employee_Skill_Table(Employee_Number,		Skill_Code,			DateRegistered)
VALUE							(		1,					3,				'2020-06-08'),
								(		2,					2,				'2020-06-08'),
                                (		3,					1,				'2020-06-08'),
                                (		4,					1,				'2020-06-08'),
                                (		5,					1,				'2020-06-08'),
                                (		6,					1,				'2020-06-08'),
                                (		3,					2,				'2020-06-08'),
                                (		4,					2,				'2020-06-08'),
                                (		6,					2,				'2020-06-08'),
                                (		1,					2,				'2020-06-08');
                                
                                
                                
-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java

SELECT employee.Employee_Number , employee.Employee_Name
	FROM employee
    JOIN employee_skill_table ON employee.Employee_Number = employee_skill_table.Employee_Number
UNION 
SELECT employee.Employee_Number , employee.Employee_Name
	FROM employee
    JOIN employee_skill_table ON employee.Employee_Number = employee_skill_table.Employee_Number;
  
  
-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT department.department_Number , department.Department_Name, count(employee.Department_number) AS 'Số nhân viên'
	FROM department
    JOIN employee ON department.department_Number= employee.Department_number
    GROUP BY employee.Department_number
    HAVING count(employee.Department_number) > 3 ; 
    
    
-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.
SELECT department.Department_Name, count(employee.Department_Number) AS Number_Of_Department
		FROM department
		LEFT JOIN employee ON department.Department_Number = employee.Department_Number
		GROUP BY  department.Department_Name;


-- Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.
SELECT DISTINCT employee.Employee_Number , employee.Employee_Name, count(employee_skill_table.Skill_Code)
	FROM employee
    JOIN employee_skill_table ON employee.Employee_Number = employee_skill_table.Employee_Number
    GROUP BY employee.Employee_Number
    HAVING count(employee_skill_table.Skill_Code) > 1;



