--MOST COMMON AGGREGATE FUNCTIONS: AVG(), COUNT(), MAX(), MIN(), SUM()

SELECT AVG(replacement_cost) FROM film

SELECT COUNT(film_id) FROM film

SELECT COUNT(*) FROM film

SELECT MAX(replacement_cost) FROM film

SELECT MIN(replacement_cost) FROM film

SELECT SUM(replacement_cost) FROM film


--GROUP BY -> ALLOWS US TO AGGREGATE COLUMNS PER SOME CATEGORY
SELECT staff_id, customer_id, SUM(amount) AS sum_amount
FROM payment
GROUP BY staff_id, customer_id
ORDER BY SUM(amount)

SELECT DATE(payment_date), SUM(amount)
FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC

--HAVING -> FILTER AFTER AN AGG HAS ALREADY TAKEN PLACE
--WE CAN'T USE WHERE TO FILTER BASED OFF OF AGG RESULTS, BECAUSE THOSE HAPPEN AFTER A WHERE IS EXECUTED

SELECT company, SUM(sales)
FROM finance_table
WHERE company != 'Google'
GROUP BY company
HAVING SUM(sales) > 1000 --AFTER GROUP BY, HAVING ALLOW US TO USE THE AGG RESULT AS FILTER ALONG WITH GROUP BY

SELECT customer_id, SUM(amount)
FROM payment
WHERE customer_id NOT IN (184,87,477)
GROUP BY customer_id
HAVING SUM(amount) > 100

SELECT store_id, COUNT(customer_id)
FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300
