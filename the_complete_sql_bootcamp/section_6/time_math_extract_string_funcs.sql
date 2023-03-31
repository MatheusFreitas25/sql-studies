-- TIMESTAMP AND EXTRACTS
--SHOW ALL PARAMETERS
SHOW ALL

SHOW TIMEZONE

--ACTUAL TIME
SELECT NOW()

-- SAME INFORMATION AS A STRING
SELECT TIMEOFDAY()

SELECT CURRENT_DATE

/*
EXTRACT() -> ALLOWS YOU TO "EXTRACT" OR OBTAIN A SUB-COMPONENT OF A DATE VALUE
 YEAR, MONTH, DAY, WEEK, QUARTER -> EXTRACT(YEAR FROM date_col)
AGE() -> AGE(date_col)
TO_CHAR() -> TO_CHAR(date_col. 'mm-dd-yyyy')
*/

SELECT DISTINCT(TO_CHAR(payment_date, 'MONTH')) FROM payment

SELECT COUNT(EXTRACT('DOW' FROM payment_date)) FROM payment
WHERE EXTRACT('DOW' FROM payment_date) = '1'


--MATHEMATICAL FUNCTIONS AND OPERATORS(CHECK DOC)

--STRING FUNCTIONS(CHECK DOC())

SELECT LENGTH(first_name) FROM customer

SELECT first_name || ' ' || last_name AS full_name FROM customer

SELECT UPPER(first_name) || ' ' || UPPER(last_name) AS full_name FROM customer

SELECT LOWER(first_name) || ' ' || UPPER(last_name) AS full_name FROM customer

SELECT LOWER(LEFT(first_name,1)) || ' ' || UPPER(last_name) AS full_name FROM customer --RETURN FIRST N CHARACTERS IN THE STRING

SELECT LOWER(LEFT(first_name, -1)) || ' ' || UPPER(last_name) AS full_name FROM customer --IF NEGATIVE RETURN ALL BUT LAST N CHARACTERS

SELECT LOWER(LEFT(first_name, -5)) || ' ' || UPPER(last_name) AS full_name FROM customer
