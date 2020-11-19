DROP TABLE Department_Employee Cascade;
DROP TABLE Department_Manager Cascade;
DROP TABLE Departments Cascade;
DROP TABLE Employees Cascade;
DROP TABLE Salaries Cascade;
DROP TABLE Titles Cascade;

-- -- Create a table for each file with code extracted from our ERD
CREATE TABLE Department_Employee (
    emp_no int   NOT NULL,
    dept_no VARCHAR(10)   NOT NULL
);

CREATE TABLE Departments (
    dept_no VARCHAR(10)   NOT NULL,
    dept_name VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Employees (
    emp_no int   NOT NULL,
    title_id VARCHAR(10)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(40)   NOT NULL,
    last_name VARCHAR(40)   NOT NULL,
    gender VARCHAR(3)   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Department_Manager (
    dept_no VARCHAR(10)   NOT NULL,
    emp_no int   NOT NULL
);

CREATE TABLE Salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL
);

CREATE TABLE Titles (
    title_id VARCHAR(20)   NOT NULL,
    title VARCHAR(40)   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

-- Change the database datestyle to US in order to read our files correctly

ALTER DATABASE "Employee" SET datestyle TO "ISO, MDY";

-- Establish the relationship between tables as provided by our ERD

ALTER TABLE Department_Employee ADD CONSTRAINT "fk_Department_Employee_emp_no" FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Department_Employee ADD CONSTRAINT fk_Department_Employee_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Employees ADD CONSTRAINT "fk_Employees_title_id" FOREIGN KEY(title_id)
REFERENCES Titles (title_id);

ALTER TABLE Department_Manager ADD CONSTRAINT "fk_Department_Manager_dept_no" FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Department_Manager ADD CONSTRAINT "fk_Department_Manager_emp_no" FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Salaries ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);
