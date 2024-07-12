SELECT * FROM bank_loan_data;

--SUMMARY
--1.
SELECT COUNT(id) AS Total_Loan_Applications FROM bank_loan_data;

SELECT COUNT(id) AS MTD_Total_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT COUNT(id) AS PMTD_Total_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

--2. 
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data;

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

--3.
SELECT SUM(total_payment) AS Total_Amount_Received FROM bank_loan_data;

SELECT SUM(total_payment) AS MTD_Total_Amount_Received FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT SUM(total_payment) AS PMTD_Total_Amount_Received FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

--4.
SELECT ROUND(AVG(int_rate), 4) * 100 AS Avg_Interest_Rate FROM bank_loan_data;

SELECT ROUND(AVG(int_rate), 4) * 100 AS MTD_Avg_Interest_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT ROUND(AVG(int_rate), 4) * 100 AS PMTD_Avg_Interest_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

--5.
SELECT ROUND(AVG(dti), 4) * 100 AS Avg_DTI FROM bank_loan_data;

SELECT ROUND(AVG(dti), 4) * 100 AS MTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT ROUND(AVG(dti), 4) * 100 AS PMTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

--------------------------------------------------------------------
SELECT * FROM bank_loan_data;

SELECT loan_status FROM bank_loan_data;

--1.
SELECT
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END ) * 100 )
	/
	COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data;

--2.
SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

--3.
SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

--4.
SELECT SUM(total_payment) AS Good_Loan_Total_Received_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

---------------------------------------------------------------------------------
--1.
SELECT
	(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END ) * 100 )
	/
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data;

--2.
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off';

--3.
SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off';

--4.
SELECT SUM(total_payment) AS Bad_Loan_Total_Received_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off';

--LOAN STATUS
SELECT
        loan_status,
        COUNT(id) AS Total_Loan_Applications,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status;

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS PMTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status;

------------------------------------------------------------
--OVERVIEW
--1. MONTH
SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date); --COUNT(id) DESC

--2. STATE
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state; --COUNT(id) DESC

--3. TERM
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term; --COUNT(id) DESC

--4. EMPLOYEE LENGTH
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY COUNT(id) DESC; --emp_length

--5. PURPOSE
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose; --COUNT(id) DESC

--6. HOME OWNERSHIP
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership; --COUNT(id) DESC

SELECT 
	home_ownership,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE grade = 'A' AND address_state = 'CA'
GROUP BY home_ownership
ORDER BY COUNT(id) DESC; --home_ownership

------------------------------------------------------------
--GRID
SELECT * FROM bank_loan_data;


