--SECTION
/*
CASE
COALESCE
NULLIF
CAST
VIEWS
IMPORT AND EXPORT FUNCTIONALITY
*/

--CASE
/*
GENERAL SYNTAX

CASE
	WHEN cond1 THEN result1
	WHEN cond2 THEN result2
	ELSE some_other_result
END

*/

SELECT a,
CASE WHEN a = 1 THEN 'one'
	 WHEN a = 2 THEN 'two'
	 ELSE 'other' AS label --RELABEL
END
FROM test

SELECT a,
CASE a
	WHEN 1 THEN 'one'
	WHEN 2 THEN 'two'
    ELSE 'other' AS label
END
FROM test

SELECT customer_id,
CASE
	WHEN (customer_id <= 100) THEN 'Premium'
	WHEN (customer_id BETWEEN 100 and 200) THEN 'Plus'
	ELSE 'Normal'
END AS customer_classe --ALIAS FOR THE CASE CONDITION COLUMN
FROM customer

SELECT
SUM(
   CASE rental_rate
   WHEN 0.99 THEN 1
   ELSE 0
END) AS number_of_bargains
FROM film