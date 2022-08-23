#Explore tables by selecting all columns from each table 
# or using the in built review features for your client.
use sakila ;
select * from actor;
select * from city;
select * from address;
select * from country;
select * from customer;
select * from film;
select * from film_actor;
select * from film_category;
select * from film_text;
select * from inventory;
select * from language;
select * from payment;
select * from rental;
select * from staff;
select*from store;
#Select one column from a table. Get film titles.
select title from film_text;
# Select one column from a table and alias it. 
# Note that we are not asking you to obtain the language per each film, 
# but this is a good time to think about how you might get that information in the future.
select first_name  as namen from actor;
#Get unique list of film languages under the alias language
select name from language as language;
select  * from store; # only 2 stores ?
select first_name from staff; #only 2 staff in total 
