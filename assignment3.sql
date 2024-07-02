
use emp_272


SELECT 
    e.deptid,
    d.dept_name,
    AVG(e.salary) AS Avrgsal,
    SUM(e.salary) AS Totalsal,
    MIN(e.salary) AS Minsalary,
    MAX(e.salary) AS Maxsalary
FROM 
    Emp3 e 
INNER JOIN 
    dept1 d ON e.deptid = d.deptid
GROUP BY 
    e.deptid, 
    d.dept_name
HAVING 
    SUM(e.salary) >= 2 * AVG(e.salary) 
    AND MAX(e.salary) >= 3 * MIN(e.salary);



-------------------------------------------------------------------------------------------------------2

CREATE TRIGGER t1
ON emp4
AFTER INSERT
AS
BEGIN
	update emp4
	SET eligible_date = DATEADD(DAY, 15, DATEADD(MONTH, 3, DATEADD(YEAR, 1, date_of_join)))
	update emp4
	SET Payment_date =  DATEADD(DAY, 1, EOMONTH(eligible_date))
    UPDATE emp4
    SET Age = dbo.age_cal(e.date_of_birth, e.Payment_date)
    FROM emp4 e
END;


CREATE FUNCTION dbo.age_cal(@dob DATE, @pay DATE)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @Days INT, @years INT, @months INT, @d INT;
    DECLARE @age VARCHAR(100);

    SET @Days = DATEDIFF(DAY, @dob, @pay);
    SET @years = DATEDIFF(YEAR, @dob, @pay);
    SET @months = DATEDIFF(MONTH, @dob, @pay) % 12;
    SET @d = (@Days % 365) % 30;
    SET @age = CAST(@years AS VARCHAR(3)) + ' years, ' + CAST(@months AS VARCHAR(3)) + ' months, ' + CAST(@d AS VARCHAR(3)) + ' days';

    RETURN @age;
END;
---------------------------------------------------------------------------------3


WITH service_calculations AS (
    SELECT 
        emp_id, 
        emp_name, 
        service_type,
        emp_type,
        date_of_join,
        date_of_birth,
        DATEDIFF(YEAR, date_of_join, GETDATE()) AS service_years,
		CASE 
		    WHEN service_type = 1 AND emp_type = 1 THEN DATEADD(YEAR, 60, date_of_birth)
			WHEN service_type = 1 AND emp_type = 2 THEN DATEADD(YEAR, 55, date_of_birth)
			WHEN service_type = 1 AND emp_type = 3 THEN DATEADD(YEAR, 55, date_of_birth)
			WHEN service_type IN (2, 3, 4) THEN DATEADD(YEAR, 65, date_of_birth)
			ELSE NULL
		END AS RETIREMENT
    FROM employee_4
),

eligible_list AS(
	select *,
	DATEDIFF(YEAR, GETDATE(),RETIREMENT) AS Service_left
	from service_calculations
	)

select * from eligible_list     WHERE (
        (service_type = 1 AND emp_type = 1 AND service_years >= 10 AND Service_left >= 15 AND GETDATE() < RETIREMENT)
        OR 
        (service_type = 1 AND emp_type = 2 AND service_years >= 12 AND Service_left >= 14 AND GETDATE() < RETIREMENT)
        OR
        (service_type = 1 AND emp_type = 3 AND service_years >= 12 AND Service_left >= 12 AND GETDATE() < RETIREMENT)
        OR
        ((service_type IN (2, 3, 4)) AND service_years >= 15 AND Service_left >= 20 AND GETDATE() < RETIREMENT)
    )


------------------------------------------------------------------------------------------------------------4

WITH age_service_calculations AS (
    SELECT 
        emp_id, 
        emp_name, 
        service_type,
        service_status,
        center,
        date_of_join,
        date_of_birth,
        DATEDIFF(YEAR, date_of_birth, GETDATE()) AS age_years,
        DATEDIFF(MONTH, date_of_birth, GETDATE()) % 12 AS age_months,
        DATEDIFF(YEAR, date_of_join, GETDATE()) AS service_years,
        DATEDIFF(MONTH, date_of_join, GETDATE()) % 12 AS service_months
    FROM employee_5
),
aggregated_data AS (
    SELECT 
        service_type,
        service_status,
        MAX(age_years) AS max_age_years,
        MAX(age_months) AS max_age_months,
        MIN(age_years) AS min_age_years,
        MIN(age_months) AS min_age_months,
        AVG(age_years) AS avg_age_years,
        AVG(age_months) AS avg_age_months,
        MAX(service_years) AS max_service_years,
        MAX(service_months) AS max_service_months,
        MIN(service_years) AS min_service_years,
        MIN(service_months) AS min_service_months,
        AVG(service_years) AS avg_service_years,
        AVG(service_months) AS avg_service_months
    FROM age_service_calculations
    GROUP BY service_type, service_status
)
SELECT 
    service_type,
    service_status,
    center,
    CONCAT(max_age_years, ' years, ', max_age_months, ' months') AS max_age,
    CONCAT(min_age_years, ' years, ', min_age_months, ' months') AS min_age,
    CONCAT(FLOOR(avg_age_years), ' years, ', FLOOR(avg_age_months), ' months') AS avg_age,
    CONCAT(max_service_years, ' years, ', max_service_months, ' months') AS max_service,
    CONCAT(min_service_years, ' years, ', min_service_months, ' months') AS min_service,
    CONCAT(FLOOR(avg_service_years), ' years, ', FLOOR(avg_service_months), ' months') AS avg_service
FROM aggregated_data;

---------------------------------------------------------------------------------------------------------5


SELECT *
FROM Employee_5
WHERE EXISTS (
    SELECT 1
    FROM (
        SELECT value AS Name
        FROM STRING_SPLIT(emp_name, ' ')
    ) AS Names
    WHERE LEN(Names.Name) > 1 AND LEFT(Names.Name, 1) = RIGHT(Names.Name, 1)
)
