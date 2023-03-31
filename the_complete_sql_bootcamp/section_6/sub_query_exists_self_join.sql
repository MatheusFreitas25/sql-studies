--SUB_QUERY, EXISTS AND SELF JOIN

SELECT student, grade
FROM test_scores
WHERE grade > (SELECT AVG(grade) FROM test_scores)

SELECT student, grade
FROM test_scores
WHERE student iN (SELECT student FROM honor_roll_table)

--EXISTS OPERATOR IS USED TO TEST FOR EXISTENCE OF ROWS IN A SUBQUERY
--TYPICALLY A SUBQUERY IS PASSED IN THE EXISTS() FUNCTION TO CHECK IF ANY ROWS ARE RETURNED WITH THE SUBQUERY

SELECT column_name1
FROM table1
WHERE EXISTS(SELECT column_name FROM table1 WHERE condition)

SELECT title,rental_rate
FROM film
WHERE rental_rate >
(SELECT AVG(rental_rate)
 FROM film)

SELECT first_name, last_name
FROM customer AS c
WHERE EXISTS
(SELECT *
 FROM payments as p
 WHERE p.customer_id = c.customer_id
 AND amount > 11)

 SELECT c.first_name, c.last_name
 FROM customer AS c
 INNER JOIN payment p
 ON c.customer_id = p.customer_id
 WHERE p.amount > 11

 --A SELF-JOIN IS A QUERY IN WHICH A TABLE IS JOINED TO ITSELF
 --SELF-JOINS ARE USEFUL FOR COMPARING VALUES IN A COLUMN OF ROWS WITHIN THE SAME TABLE
 --IT IS NECESSARY TO USE AN ALIAS FOR THE TABLE, OTHERWISE THE TABLE NAMES WOULD BE AMBIGUOUS

 SELECT tableA.col, tableB.col
 FROM table AS tableA
 JOIN table AS tableB
 ON tableA.some_col = tableB.other_col

SELECT f1.title, f2.title, f1.title
FROM film AS f1
INNER JOIN film AS f2
ON f1.film_id != f2.film_id
AND f1.length = f2.length