# Pewlett Hackard Analysis

## Overview of the analysis: Explain the purpose of the new analysis.
The purpose of the analysis is to understand which employees will be retiring soon and be prerpared for this upcoming "Silver Tsunami".

## Results: Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.

- There are 72,458 positions that would be part of the "Silver Tsunami"
- There are 1,549 employees for the mentorship program
- Senior Engineer and Senior Staff are the two main positions whith more employees that would be leaving the company in the silver tsunami.
- There is no major impact on the manager position

![Retiring Titles](https://github.com/bernardinoe/Pewlett-Hackard-Analysis/blob/main/RetiringImage.PNG)


## Summary: Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
There are 7 different roles that need filled, the biggest impact is concetrated in two roles. 
- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
No, there are only 1,549 which i believe is not enough compared to the total employees leaving.
- I would use the following query to understand and compare the previous group of people retiring

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	tt.title,
	tt.from_date,
	tt.to_date
INTO previous_retirement
FROM employees as e
	INNER JOIN titles as tt
	ON (e.emp_no = tt.emp_no)
WHERE e.birth_date BETWEEN '1948-01-01' AND '1951-12-31'
ORDER BY emp_no ASC;

- I would expand the mentorship program by increasing the range of birth date. BY adding one extra year, there are almost 20K available mentors.

SELECT DISTINCT ON (e.emp_no)
	e.emp_no, 
	e.first_name,
	e.last_name,
	e.birth_date,
	d.from_date,
	d.to_date,
	tt.title
INTO mentorship_eligibility
FROM employees as e
	INNER JOIN dept_emp as d
	 	ON (e.emp_no = d.emp_no)
	INNER JOIN titles as tt
	 	ON (e.emp_no = tt.emp_no)
WHERE (d.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1964-01-01' AND '1965-12-31')
ORDER BY e.emp_no;