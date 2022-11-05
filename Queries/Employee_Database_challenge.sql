-- Deliverable 1

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	tt.title,
	tt.from_date,
	tt.to_date
INTO retirement_title
FROM employees as e
	INNER JOIN titles as tt
	ON (e.emp_no = tt.emp_no)
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) 
	r.emp_no,
	r.first_name,
	r.last_name,
	r.title
INTO unique_titles
FROM retirement_title as r
WHERE r.to_date = '9999-01-01'
ORDER BY r.emp_no, r.to_date DESC;

SELECT COUNT (u.title),
	u.title
INTO retiring_titles
FROM unique_titles as u
GROUP BY u.title
ORDER BY COUNT(u.title) DESC;

-- Deliverable 2

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
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;