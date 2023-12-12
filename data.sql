CREATE TABLE departments(
	dept_no VARCHAR,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

SELECT * FROM departments;
CREATE TABLE titles(
	title_id VARCHAR,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);

SELECT * FROM titles;

CREATE TABLE employees(
	emp_no INT,
	emp_title_id VARCHAR NOT NULL,
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	SEX VARCHAR NOT NULL,
	hire_date VARCHAR NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

UPDATE employees
SET birth_date = TO_DATE(birth_date, 'MM/DD/YYYY');

UPDATE employees
SET hire_date = TO_DATE(hire_date, 'MM/DD/YYYY');

ALTER TABLE employees
ALTER COLUMN birth_date TYPE DATE USING birth_date::date;

ALTER TABLE employees
ALTER COLUMN hire_date TYPE DATE USING hire_date::date;

SELECT * FROM employees;

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries; 

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp; 

CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
SELECT * FROM dept_manager;