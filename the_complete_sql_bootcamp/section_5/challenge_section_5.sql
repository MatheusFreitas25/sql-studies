--WHAT ARE THE EMAILS OF THE CUSTOMERS WHO LIVE IN CALIFORNIA?
SELECT address.district, customer.email FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE address.district = 'California'

--LIST OF ALL THE MOVIES "Nick Wahlberg" HAS BEEN IN
SELECT film.title, actor.first_name, actor.last_name FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE actor.first_name = 'Nick' AND actor.last_name = 'Wahlberg'