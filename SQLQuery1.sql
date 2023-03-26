













--creating a simple table
CREATE TABLE EmpTable (
	EmpId NUMERIC (3),
	EmpName VARCHAR (20),
	Salary NUMERIC (8,2) -- total length is 8 & after decimal 2 digits
);

SELECT *
FROM EmpTable;

INSERT INTO EmpTable
VALUES (100, 'Ram', 8000);

INSERT INTO EmpTable (EmpId, EmpName, Salary)
VALUES (101, 'Shyam', 8500);

INSERT INTO EmpTable (EmpName, Salary, EmpId)
VALUES ('Shyam', 8500, 101);

INSERT INTO EmpTable (EmpId, EmpName)
VALUES (102, 'Sita');

SELECT *
FROM Emptable;


CREATE TABLE Department (
	DeptId NUMERIC (2) PRIMARY KEY, -- column wide constraint
	DeptName VARCHAR (20) NOT NULL
);




SELECT *
FROM Department;

INSERT INTO Department
VALUES (10, 'IT');

CREATE TABLE Employee (
	EmpId NUMERIC (3),
	FirstName VARCHAR (20) NOT NULL,
	LastName VARCHAR (20) NOT NULL,
	MobileNo VARCHAR (10),
	Salary NUMERIC (8,2),
	CitizenId VARCHAR (10),
	DeptId NUMERIC (2),
	CONSTRAINT pk_Employee_EmpId PRIMARY KEY (EmpId),
	CONSTRAINT un_Employee_CitizenId UNIQUE (CitizenId),
	CONSTRAINT ch_Employee_Salary CHECK (Salary > 0),
	CONSTRAINT fk_Employee_DeptId FOREIGN KEY (DeptId)
		REFERENCES Department (DeptId)
);


INSERT INTO Employee
VALUES (101, 'Ram', 'Shrestha', '422', 8000, 'C101', 10);

SELECT * 
FROM Employee;

SELECT *
FROM Department;

INSERT INTO Department
VALUES (NULL, 'HR');
--error: NULL cannot be inserted into DeptId being PK

INSERT INTO Department
VALUES (10, 'HR');
--violation of PK on DeptId as DeptId 10 is already in the table.


INSERT INTO Employee (EmpId, FirstName, MobileNo, Salary, CitizenId, DeptId)
VALUES (102, 'Shyam', '9898765670', 40000, 'C102', 10);
--error: cannot insert NULL into LastName column due to NOT NULL constraint


INSERT INTO Employee (EmpId, FirstName, LastName, MobileNo, Salary, CitizenId, DeptId)
VALUES (102, 'Shyam', 'Sharma', '9898765670', 40000, 'C101', 10);
--error: cannot insert duplicate value 'C101' in CitizenId due to unique key constraint





INSERT INTO Employee (EmpId, FirstName, LastName, MobileNo, Salary, CitizenId, DeptId)
VALUES (102, 'Shyam', 'Sharma', '9898765670', 0, 'C102', 10);
--error: value 0 conflicts with the check constraint condition (Salary > 0).
INSERT INTO Employee (EmpId, FirstName, LastName, MobileNo, Salary, CitizenId, DeptId)
VALUES (102, 'Shyam', 'Sharma', '9898765670', -1, 'C102', 10);
--error: value 0 conflicts with the check constraint condition (Salary > 0).

INSERT INTO Employee (EmpId, FirstName, LastName, MobileNo, Salary, CitizenId, DeptId)
VALUES (102, 'Shyam', 'Sharma', '9898765670', 50000, 'C102', 10);
--all columns included in the INSERT statement

INSERT INTO Employee (EmpId, FirstName, LastName)
VALUES (103, 'Sita', 'Sharma');
--only PK and NOT NULL columns are included in the INSERT statement

SELECT *
FROM Employee;

INSERT INTO Employee (EmpId, FirstName, LastName, MobileNo, Salary, CitizenId, DeptId)
VALUES (104, 'Gita', 'Sharma', '9888765670', 55000, 'C104', 20);
--error: cannot insert value '20' in DeptId due to FK constraint 
--as this value does not exist in DeptId (PK) column in Department.

INSERT INTO Department (DeptId, DeptName)
VALUES (20, 'HR');





CREATE TABLE StudentTest (
	RollNo NUMERIC (3),
	FirstName VARCHAR (20),
	LastName VARCHAR (20),
	City NUMERIC (20),
	UniRegId VARCHAR (20),
	ProgramId VARCHAR (4)
);

SELECT *
FROM StudentTest;





ALTER TABLE StudentTest
ADD Street VARCHAR (20);

ALTER TABLE StudentTest
ADD PhoneNo VARCHAR (10);


ALTER TABLE StudentTest
ALTER COLUMN City VARCHAR (20);


CREATE TABLE ProgramTest (
	ProgramId VARCHAR (4) PRIMARY KEY,
	Program VARCHAR (25),
	CreditHour NUMERIC (2)
);

SELECT *
FROM ProgramTest;


ALTER TABLE StudentTest
ADD CONSTRAINT fk_StudentTest_ProgramId FOREIGN KEY (ProgramId)
	REFERENCES ProgramTest (ProgramId);

INSERT INTO ProgramTest
VALUES ('P1', 'BSc CSIT', 64),
	('P2', 'BCA', 64),
	('P3', 'BBM', 60),
	('P4', 'BBA', 56);

SELECT *
FROM ProgramTest;

CREATE TABLE Student (
	RollNo NUMERIC PRIMARY KEY,
	StudentName VARCHAR (20) NOT NULL,
	PhoneNo VARCHAR (10),
	DOB DATE,
	EnrollDATE DATE,
	Program VARCHAR (20) DEFAULT 'BasicCourse'
);
SELECT *
FROM Student;


INSERT INTO Student
VALUES (1, 'Ram', '9898787890', '1990-01-01', '2022-06-01', 'BSc CSIT');
INSERT INTO Student (RollNo, StudentName, PhoneNo, DOB, EnrollDATE)
VALUES (2, 'Shyam', '9898787890', '1990-01-01', '2022-06-01');

CREATE TABLE Student1 (
	RollNo NUMERIC CONSTRAINT pk_Student1_RollNo PRIMARY KEY,
	StudentName VARCHAR (20) NOT NULL,
	PhoneNo VARCHAR (10),
	DOB DATE,
	EnrollDATE DATE,
	Program VARCHAR (10) CONSTRAINT df_Student1_Program DEFAULT 'BasicCourse'
);

SELECT *
FROM Student1;

INSERT INTO Student (RollNo, StudentName, PhoneNo, DOB, EnrollDATE, Program)
VALUES (3, 'Hari', '9898787990', '1990-01-01', '2022-06-01', NULL);

SELECT *
FROM Student;


ALTER TABLE Student
ADD CONSTRAINT df_Student_EnrollDATE DEFAULT (GETDATE()) FOR EnrollDATE;
INSERT INTO Student (RollNo, StudentName, PhoneNo, DOB, Program)
VALUES (4, 'Sita', '9898787990', '1990-01-01', NULL);



CREATE TABLE Student2 (
	RollNo NUMERIC (3) IDENTITY (1,1) PRIMARY KEY,
	StudentName VARCHAR (20)
);

INSERT INTO Student2 (StudentName)
VALUES ('Ram'),
	('Shyam'),
	('Sita'),
	('Gita');

SELECT * 
FROM Student2;

SELECT *
FROM Student;



DELETE FROM Student;

SELECT *
FROM Student;



DELETE FROM Student2;

INSERT INTO Student2 (StudentName)
VALUES ('Nikhil');

SELECT *
FROM Student2;

TRUNCATE TABLE Student2;

SELECT *
FROM Student2;


INSERT INTO Student2 (StudentName)
VALUES ('Prakash Rochak');

SELECT *
FROM Student2;


DROP TABLE Student;

SELECT *
FROM Student;