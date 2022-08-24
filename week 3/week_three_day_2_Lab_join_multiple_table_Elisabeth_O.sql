# Write a query to display for each store its store ID, city, and country.
select store_id, city, country from store st
join address ad on st.address_id = ad.address_id
join city ci on ad.city_id = ci.city_id
join country co on co.country_id = ci.country_id ;

# Write a query to display how much business, in dollars, each store brought in.
select st.store_id, sum(amount) from payment p
join staff s on p.staff_id = s.staff_id 
join store st on s.store_id = st.store_id
group by st.store_id;

# What is the average running time(length) of films by category?
select name, avg(length)from category c
join film_category fc on c.category_id = fc.category_id 
join film f on f.film_id = fc.film_id
group by name;


# Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)
select name, avg(length)from category c
join film_category fc on c.category_id = fc.category_id 
join film f on f.film_id = fc.film_id
group by name
order by avg(length) desc limit 5;

# Display the top 5 most frequently(number of times) rented movies in descending order.

select title, count(title) from inventory i
join rental r on r.inventory_id = i.inventory_id 
join film f  on f.film_id = i.film_id 
group by title 
order by count(title) desc limit 5;

# List the top five genres in gross revenue in descending order
select name, sum(amount) from category c
join film_category fc on c.category_id = fc.category_id 
join film f on f.film_id = fc.film_id
join inventory i on f.film_id = i.film_id 
join rental r on i.inventory_id = r.inventory_id 
join payment p on p.rental_id = r.rental_id
group by name
order by sum(amount) desc limit 5;

# Is "Academy Dinosaur" available for rent from Store 1?
select title, s.store_id from film f
join inventory i on f.film_id = i.film_id
join store s on s.store_id = i.store_id 
where title = "ACADEMY DINOSAUR" and s.store_id = 1 
order by s.store_id limit 1;


