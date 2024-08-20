DECLARE
emp_rec employees%ROWTYPE;
BEGIN
SELECT * INTO emp_rec
FROM employees emp
WHERE emp.employee_id = &employee_number;
INSERT INTO employees_retired VALUES (emp_rec.employee_id, emp_rec.first_name, emp_rec.last_name, emp_rec.email, emp_rec.hire_date, SYSDATE,
emp_rec.job_id);
COMMIT;
END;
