-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
-- **To display no of films from each category** --
SELECT category.name, COUNT(film_category.film_id)
FROM category
JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.category_id;

-- 2. Display the total amount rung up by each staff member in August of 2005.(This question is not very clear.
-- **Displaying total amount rung(Payment) in August 2005 by each member of staff** --
-- ** Here I wanted to use CONTACT function but keeps getting an error as it is not available in SAKILA data base** -- 
SELECT first_name, last_name, SUM(payment.amount) AS total_amount
FROM staff JOIN payment ON staff.staff_id = payment.staff_id
WHERE YEAR(payment.payment_date) = 2005 AND MONTH(payment.payment_date) = 8
GROUP BY staff.staff_id;

-- 3. Which actor has appeared in the most films?
-- **Here we have to find the actor who did the max appearances** --
SELECT COUNT(film_actor.film_id), actor.first_name, actor.last_name 
FROM film_actor JOIN actor 
ON film_actor.actor_id = actor.actor_id
GROUP BY film_actor.actor_id
ORDER BY count(film_actor.film_id) DESC
LIMIT 1;

-- 4. Most active customer (the customer that has rented the most number of films)
-- **Customer who rented the highest no of flms/movies and is active** --
SELECT first_name, last_name, COUNT(*) AS 'Number of films rented'
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.
-- **Dispaly address for all the staff along with their name** --
SELECT staff.first_name, staff.last_name, address.address 
FROM staff JOIN address 
ON staff.address_id = address.address_id;

-- 6. List each film and the number of actors who are listed for that film.
SELECT film.title, COUNT(film_actor.actor_id) AS num_actors
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY film.film_id
ORDER BY num_actors DESC;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
-- **Showing the total amount paid by each customer and display with their last name in an descending order** --
SELECT customer.last_name, SUM(payment.amount) AS total_paid
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY payment.customer_id
ORDER BY customer.last_name;

-- 8. List number of films per category.
-- **It gives the same output as Question number 1** -- 
SELECT category.Name, COUNT(film_category.film_id) AS 'Number of Films'
FROM category
JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.name;



