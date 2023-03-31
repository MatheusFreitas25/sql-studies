------------------------------------------------------------------------------
/*

JOINS -> ALLOW US TO COMBINE INFORMATION FROM MULTIPLE TABLES

OVERVIEW ->
	ALIAS -> AS
	INNER JOIN
	OUTER JOIN
	FULL JOIN
	UNION

*/
------------------------------------------------------------------------------

------------------------------------------------------------------------------
--AS -> ALLOW US TO RENAME COLUMNS NAMES(ONLY ON QUERY) // HAPPENS AT THE VERY END
------------------------------------------------------------------------------

SELECT amount AS rental_price
FROM payment

SELECT SUM(amount) AS net_revenue
FROM payment

--ERROR:column "total_spend" does not exist. /HAPPENS AT THE VERY END
SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING SUM(total_spend) > 100

--OK!
SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100

------------------------------------------------------------------------------
/*

INNER JOIN -> WILL RESULT WITH THE SET OF RECORDS THAT MATCH IN BOTH TABLES

Table order WON'T MATTER IN AN INNER JOIN
IF WE RUN ONLY JOIN, POSTGRESQL WILL TREAT IT AS AN INNER JOIN

*/
------------------------------------------------------------------------------

SELECT * FROM tableA
INNER JOIN tableB
ON tableA.col_match = tableB.col_match

SELECT customer.first_name, customer.last_name, payment.payment_id FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id

SELECT c.first_name, c.last_name, p.payment_id FROM payment AS p
INNER JOIN customer AS C
ON p.customer_id = c.customer_id

------------------------------------------------------------------------------
/*
OUTER JOIN -> THERE ARE FRE DIFFERENT TYPES OF OUTER JOINS

THEY WILL ALLLOW US TO SPECIFY HOW TO DEAL WITH VALUES ONLY PRESENT IN ONE OF THE TABLE BEING JOINED

FULL OUTER JOIN/OUTER JOIN:

GRABS EVERYTHING, EVEN DIFFERENT ROWS -> IT PUTS NULL WHERE DATA DOESN'T LINK

SELECT *
FROM registrations
FULL OUTER JOIN logins
ON registrations.name = logins.name

GET ROWS UNIQUE TO EITHER TABLE

SELECT *
FROM TableA
FULL OUTER JOIN TableB
ON TableA.col_match = TableB.col_match
WHERE TableA.id IS null OR TableB.id is NULL

LEFT OUTER JOIN/LEFT JOIN:

RESULTS IN THE SET OF RECORDS THAT ARE IN THE LEFT TABLE, IF THERE IS NO MATCH WITH THE RIGHT TABLE,
THE RESULTS ARE NULL.

SELECT * FROM TableA -> left table/ ORDER MATTER
LEFT OUTER JOIN TableB
ON TableA.col_match = Tableb.col_match

SELECT * FROM TableA -> left table/ ORDER MATTER
LEFT OUTER JOIN TableB
ON TableA.col_match = Tableb.col_match
WHERE TableB.col_match IS NULL -> ONLY WHAT EXITS IN LEFT TABLE

RIGHT OUTER JOIN:
ESSENTIALLY THE SAME AS A LEFT JOIN, EXCEPT THE TABLE ARE SWTICHED
THIS WOULD BE THE SAME AS SWITCHING TABLE ORDER IN A LEFT OUTER JOIN

UNION
*/
------------------------------------------------------------------------------

SELECT c.customer_id, p.customer_id, c.first_name, p.payment_id
FROM customer AS c
FULL OUTER JOIN payment AS p
ON c.customer_id = p.customer_id

SELECT c.customer_id, p.customer_id, c.first_name, p.payment_id FROM customer AS c
FULL OUTER JOIN payment AS p
ON c.customer_id = p.customer_id
WHERE c.customer_id IS null OR p.customer_id IS null

SELECT film.film_id, film.title, inventory.inventory_id, inventory.store_id FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id

SELECT film.film_id, film.title, inventory.inventory_id, inventory.store_id FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS NULL

SELECT f.film_id, f.title, i.inventory_id, i.store_id FROM film AS f
RIGHT JOIN inventory AS i
ON f.film_id = i.film_id
WHERE f.film_id IS NULL

------------------------------------------------------------------------------
--UNION -> COMBINES THE RESULTS OF TWO OR MORE SELECT STATEMENTS INTO A SINGLE RESULT SET
------------------------------------------------------------------------------

SELECT column_names from Table1
UNION
SELECT column_names from Table2
