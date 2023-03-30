--How many payment transactions were greater than $5.00?

SELECT COUNT(*)
FROM payment
WHERE amount > 5.00
--3618

--How many actors have a first name that starts with the letter P?

SELECT COUNT(*)
FROM actor
WHERE first_name LIKE 'P%'
--5

--How many unique districts are our customers from?

SELECT COUNT(DISTINCT(district))
FROM address
--378

--Retrieve the list of names for those distinct districts from the previous question.

SELECT DISTINCT(district)
FROM address

--How many films have a rating of R and a replacement cost between $5 and $15?

SELECT COUNT(*)
FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5.00 AND 15.00
--52

--How many films have the word Truman somewhere in the title?

SELECT COUNT(*)
FROM film
WHERE title LIKE '%Truman%'