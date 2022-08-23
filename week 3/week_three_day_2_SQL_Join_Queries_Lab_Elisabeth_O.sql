#Which actor has appeared in the most films?
use sakila;
select first_name, last_name, count(film_id) as count from film_actor join actor on film_actor.actor_id = actor.actor_id group by actor.actor_id order by count desc limit 1;

#Most active customer (the customer that has rented the most number of films)
select * from customer;
select * from rental;
select * from inventory;
select * from payment;

select first_name, last_name, count(rental_id) from customer c join rental r on c.customer_id = r.customer_id
where active=1 
group by c.customer_id
order by count(rental_id) 
desc
limit 1;

#List number of films per category.
select * from category; 
select * from film_category;
select name, count(film_id) from category c join film_category fc on c.category_id=fc.category_id 
group by name 
order by name;

# Display the first and last names, as well as the address, of each staff member.
select * from staff ;
select * from address;
select first_name, last_name, address from staff s join address a on s.address_id = a.address_id;

# Display the total amount rung up by each staff member in August of 2005.
select * from staff ;
select * from payment;

select first_name, last_name, sum(amount) from staff s join payment p on s.staff_id = p.staff_id
where payment_date between "2005-08-00 00:00:00" and "2005:08:31 23:59:59"
group by s.staff_id
order by sum(amount) 
desc;

# List each film and the number of actors who are listed for that film.
select * from film_actor ;
select * from film;

select title, count(actor_id) from film f join film_actor fa on f.film_id = fa.film_id
group by title
order by count(actor_id) desc;

# Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
# List the customers alphabetically by last name.
 select * from payment;
select first_name, last_name, sum(amount) from payment p join customer c on p.customer_id = c.customer_id
group by c.customer_id
order by last_name ;

# Which is the most rented film? The answer is Bucket Brotherhood.
# This query might require using more than one join statement. Give it a try.
select * from rental;
select * from film;
select * from inventory;


select title, count(title) from inventory i
join rental r on r.inventory_id = i.inventory_id 
join film f  on f.film_id = i.film_id 
group by title 
order by count(title) desc limit 1;

 




