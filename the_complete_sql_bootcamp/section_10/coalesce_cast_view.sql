--COALESCE FUNCTION ACCEPTS AN UNLIMITED NUMBER OF ARGUMENTS
--IT RETURNS THER ARGUMENT THAT IS NOT NULL. IF ALL ARE NULL, THE COALESCE RETURN NULL
--USEFUL IN TABLES WITH NULL VALUES

SELECT item, (price- COALESCE(discount,0)) -- SE TIVER VALOR NULL CONSIDERA 0
AS final FROM table

--CAST -> CONVERT ONE DATA TYPE TO ANOTHER

SELECT CAST('5' AS INTEGER)

SELECT CAST(date AS TIMESTAMP)
FROM table

--NOT ALL TABLE CAN BE CONVERTED
SELECT CAST('five' AS TIMESTAMP)
FROM table

SELECT CAST(inventory_id AS NUMERIC) FROM rental

SELECT CAST(inventory_id AS CHAR) FROM rental

--NULLIF -> TAkES 2 inputs and returns NULL if both are equal, oterwise it returns the first argument passed

SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END) /
NULLIF(SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END), 0) -- IF SUM(X...) == 0 IT RECEIVES 0
) AS department_ratio
FROM depts

--VIEWS -> 
/*
SPECIFIC COMBINATION OF TABLES AND CONDITIONS THAT YOU USE QUITE OFTEN

INSTEAD OF HAVING TO PERFORM THE SAME QUERY OVER AND OVER AGAIN AS A STARTING POINT
TOU CAN CREATE A VIEW TO QUICKLY SEE THIS QUERY WITH SIMPLE CALLL

*/


CREATE VIEW customer_info AS
SELECT c.first_name, c.last_name, a.address FROM customer AS c
INNER JOIN address AS a
ON c.address_id = a.address_id

SELECT * FROM customer_info

CREATE OR REPLACE VIEW customer_info AS
SELECT c.first_name, c.last_name, a.address, a.district FROM customer AS c
INNER JOIN address AS a
ON c.address_id = a.address_id

SELECT * FROM customer_info

DROP VIEW IF EXISTS customer_info

ALTER VIEW customer_info RENAME TO c_info