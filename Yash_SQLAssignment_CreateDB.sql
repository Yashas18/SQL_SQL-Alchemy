-- Drop table if exists
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

CREATE TABLE departments (
  --id INT NOT NULL PRIMARY KEY,
  dept_no VARCHAR(255) PRIMARY KEY,
  dept_name VARCHAR(255)
 );

CREATE TABLE dept_emp (
  --id INT NOT NULL PRIMARY KEY,
  emp_no INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  dept_no VARCHAR(255),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  from_date DATE,
  to_date DATE
 );

CREATE TABLE employees (
  --id INT NOT NULL PRIMARY KEY,
  
  emp_no INT NOT NULL PRIMARY KEY,
  birth_date DATE,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  gender VARCHAR(255),
  hire_date DATE
 );

CREATE TABLE dept_manager (
  --id INT NOT NULL PRIMARY KEY,
  dept_no VARCHAR(255),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  emp_no INT NOT NULL PRIMARY KEY,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  from_date DATE,
  to_date DATE
  
 );

CREATE TABLE salaries (
  --id INT NOT NULL PRIMARY KEY,
  emp_no INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  salary INT NOT NULL,
  from_date DATE,
  to_date DATE
 );


CREATE TABLE titles (
  --id INT NOT NULL PRIMARY KEY,
  emp_no INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  title VARCHAR(255),
  from_date DATE,
  to_date DATE
 );
 