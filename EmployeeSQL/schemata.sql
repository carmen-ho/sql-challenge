DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees_info;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS managers;
DROP TABLE IF EXISTS employees;

CREATE TABLE titles (
    title_id VARCHAR (30) NOT NULL PRIMARY KEY, --FOREIGN KEY,
    title VARCHAR(30) NOT NULL
);

CREATE TABLE employees_info (
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR (30) NOT NULL, --FOREIGN KEY,
    birth_date DATE NOT NULL,
    first_name VARCHAR (30) NOT NULL,
    last_name VARCHAR (30) NOT NULL,
    sex VARCHAR (10) NOT NULL,
    hire_date DATE NOT NULL,
	FOREIGN KEY(emp_title_id) REFERENCES titles (title_id)
);


CREATE TABLE salaries (
    emp_no INT NOT NULL PRIMARY KEY,
    salary INT NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees_info (emp_no)
);


CREATE TABLE departments (
    dept_no VARCHAR (30) NOT NULL PRIMARY KEY,
    dept_name VARCHAR (30) NOT NULL
);


CREATE TABLE managers (
    dept_no VARCHAR (30) NOT NULL, --PRIMARY KEY, --FOREIGN KEY,
    emp_no INT NOT NULL, --PRIMARY KEY --FOREIGN KEY
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees_info (emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE employees (
    emp_no INT NOT NULL, --PRIMARY KEY, --FOREIGN KEY,
    dept_no VARCHAR (30) NOT NULL, --PRIMARY KEY --FOREIGN KEY
	FOREIGN KEY(emp_no) REFERENCES employees_info (emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (dept_no, emp_no)
);

SELECT * FROM titles;
SELECT * FROM employees_info;
SELECT * FROM salaries;
SELECT * FROM departments;
SELECT * FROM managers;	
SELECT * FROM employees;	
