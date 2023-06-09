--1. Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.

SELECT staff_id, customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY staff_id, customer_id
HAVING SUM(amount) > 110

--The answer should be customers 187 and 148.

--2. How many films begin with the letter J?

SELECT COUNT(title)
FROM film
WHERE title LIKE 'J%'

--The answer should be 20.

--3. What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?

SELECT first_name, last_name, customer_id, address_id
FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1

--The answer is Eddie Tomlin