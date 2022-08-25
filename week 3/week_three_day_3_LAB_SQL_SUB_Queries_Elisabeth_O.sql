#1
#How many copies of the film Hunchback Impossible exist in the inventory system?
use sakila;
select * from inventory ;
select * from film ;

select count(inventory_id) from inventory 
join film using(film_id) 
where title ="HUNCHBACK IMPOSSIBLE";

select count(inventory_id) from inventory 
where  film_id = (select film_id from film 
where title= "HUNCHBACK IMPOSSIBLE");

#2
#List all films whose length is longer than the average of all the films.
select distinct(title) from film 
where length > (select avg(length) from film) ;

#3 
# Use subqueries to display all actors who appear in the film Alone Trip.
select * from film_actor;
select * from actor;
select * from film ;

select first_name, last_name from actor 
where actor_id in (select actor_id from film_actor where 
film_id = (select film_id from film where title= "ALONE TRIP"))

#4
# Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
# Identify all movies categorized as family films.
select * from category;
select * from film_category;
select * from film ;

select title from film where 
film_id in (select film_id from film_category where category_id =(select category_id from category where name= "Family"))

#5
# Get name and email from customers from Canada using subqueries. Do the same with joins. 
# Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, 
# that will help you get the relevant information.
select * from country;
select * from address;
select * from customer;
select * from city;

select first_name, last_name, email from customer 
where address_id in (
select address_id from address where city_id in (
	select city_id from city where country_id = 
		(select country_id from country where country= "Canada")));

# join is faster only 0.00066 sec // subqueries needed 0.00006 sec more
select first_name, last_name, email from customer 
join address using (address_id)
join city using (city_id)
join country using (country_id) 
where country= "Canada";

#6
# Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films.
#  First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
select * from film_actor;
select * from actor;
select * from film ;

select title from film where 
film_id in(
select film_id from film_actor where actor_id = (
select  actor_id  from film_actor group by actor_id order by count(actor_id) desc limit 1) );


#7 
# Films rented by most profitable customer. 
# You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments
select * from payment;
select * from rental;
select * from film;

select title from film where film_id in 
	(select film_id from inventory where inventory_id in 
		(select inventory_id from rental where customer_id =
			(select customer_id from
				(select customer_id , sum(amount) from payment group by customer_id order by sum(amount) desc limit 1) as p
			)
		)
	);


#8 
# Customers who spent more than the average payments(this refers to the average of all amount spent per each customer)
select * from payment;
select * from rental;
select * from film
select * from customer;


select first_name , last_name from customer where customer_id in 
	(select customer_id from 
		(select customer_id, total from 
			(select customer_id, sum(amount) as total from payment group by customer_id order by sum(amount)) as a where total > 
											(select avg(summe) from 
													(select summe from 
														(select customer_id , sum(amount) as summe from payment group by customer_id order by sum(amount)) as p )
													as r)
			group by customer_id
			order by total desc  
		) 
	as k)
order by first_name asc
