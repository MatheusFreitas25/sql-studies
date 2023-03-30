------------------------------------------------------------------------------
--Basic SELECT
------------------------------------------------------------------------------

--SELECT ALL FROM CUSTOMER LIMIT 10
SELECT * FROM customer limit 10

--SELECT ALL CUSTOMERS EMAILS
SELECT first_name, last_name, email FROM customer

------------------------------------------------------------------------------
--DISTINCT -> SELECT DISTINCT VALUES IN THE SPECIFIC COLUMN
------------------------------------------------------------------------------

--SELECT DISTINCT TITLES
SELECT DISTINCT(title) FROM film

--SELECT DISTINCT RELEASE_YEAR
SELECT DISTINCT(release_year) FROM film

--SELECT DISTINCT RENTAL RATES
SELECT DISTINCT(rental_rate) FROM film

--SELECT DISTINCT RATING
SELECT DISTINCT(rating) FROM film

------------------------------------------------------------------------------
--COUNT -> NUMBER OF INPUT ROWS THAT MATCH A SPECIFIC CONDITION
------------------------------------------------------------------------------

--COUNTER NUMBER OF ROWS
SELECT COUNT(*) FROM payment

--HOW MANY UNIQUE AMOUNTS ARE THERE?
SELECT COUNT(DISTINCT(amount)) FROM payment

------------------------------------------------------------------------------
--SELECT WHERE -> CONDITIONS ON COLUMNS YOU WANT TO RETURN

--SELECT C1, C2
--FROM TABLE
--WHERE CONDITIONS
------------------------------------------------------------------------------

--HOW MANY CUSTOMERS HAVE THE FIRST NAME JARED?
SELECT COUNT(*)
FROM customer
WHERE first_name = 'Jared'

--EMAIL FOR THE CUSTOMER WITH THE NAME = Nancy Thomas
SELECT email
FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas'

--DESCRIPTION OF THE MOVIE Outlaw Hanky
SELECT title, description
FROM film
WHERE title = 'Outlaw Hanky'

--PHONE NUMBER OF THE CUSTOMER WHO LIVES AT '259 Ipoh Drive'
SELECT phone
FROM address
WHERE address = '259 Ipoh Drive'

------------------------------------------------------------------------------
--ORDER BY -> SORT ROWS BASED ON A COLUMN VALUE (END OF A QUERY) (ASC/DESC)
------------------------------------------------------------------------------

SELECT store_id, first_name, last_name
FROM customer
ORDER BY store_id ASC, first_name DESC

------------------------------------------------------------------------------
--LIMIT -> LIMIT THE NUMBER OF ROWS RETURNED FOR A QUERY (LAST ARGUMENT)
------------------------------------------------------------------------------

SELECT *
FROM payment
WHERE amount != 0.00
ORDER BY amount ASC
lIMIT 10

--WHAT ARE THE CUSTOMER IDS OF THE FIRST 10 CUSTOMERS WHO CREATED A PAYMENT?

SELECT customer_id
FROM payment
ORDER BY payment_date ASC
LIMIT 10

-- 5 SHORTEST MOVIES(RUNTIME)

SELECT title, length
FROM film
ORDER BY length ASC
LIMIT 5

-- COUNT MOVIES THAT IS 50 MINUTES OR LESS

SELECT COUNT(DISTINCT(title))
FROM film
WHERE length <= 50

------------------------------------------------------------------------------
--BETWEEN -> match a value against a range of values
--BETWEEN low AND high / NOT BETWEEN -> CAN ALSO BE USED WITH DATES
------------------------------------------------------------------------------

--CAREFUL = includes day 14 but it doesn't include day 16(it only count until 00:00)
SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-14' AND '2007-02-16'
ORDER BY payment_date ASC


------------------------------------------------------------------------------
--IN -> CREATE A CONDITION in / not in
------------------------------------------------------------------------------

SELECT COUNT(*)
FROM payment
WHERE amount IN (0.99, 1.98, 1.99)

SELECT COUNT(*)
FROM payment
WHERE amount NOT IN (0.99, 1.98, 1.99)

SELECT payment_id, amount
FROM payment
WHERE amount IN (0.99, 1.98, 1.99)
ORDER BY payment_id ASC, amount ASC

SELECT *
FROM customer
WHERE first_name IN ('John', 'Jake', 'Julie')

SELECT *
FROM customer
WHERE first_name NOT IN ('John', 'Jake', 'Julie')

------------------------------------------------------------------------------
--LIKE AND ILIKE -> NOT LIKE
--LIKE -> CASE SENSITIVE
--ILIKE -> CASE-INSENSITIVE
--WHE CAN COMBINE: ''_HER% = Cheryl, Theresa...
-- % -> MATCH ANY SEQUENCE OF CHARACTERS
-- _ -> MATCHES ANY SINGLE CHARACTER _ -> 1 CHARACTER __ -> 2
------------------------------------------------------------------------------

SELECT COUNT(*)
FROM customer
WHERE first_name LIKE 'J%'

SELECT COUNT(*)
FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%'

SELECT COUNT(*)
FROM customer
WHERE first_name ILIKE 'j%' AND last_name ILIKE 's%'


SELECT *
FROM customer
WHERE first_name LIKE '%er%'

SELECT *
FROM customer
WHERE first_name LIKE '_er%'

SELECT *
FROM customer
WHERE first_name LIKE 'A%'
ORDER BY last_name

SELECT *
FROM customer
WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%'
ORDER BY last_name