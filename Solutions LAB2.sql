USE sakila;

-- 1.Select all the actors with the first name ‘Scarlett’.
select * from sakila.actor
where first_name = "Scarlett";
-- 2.How many physical copies of movies are available for rent in the store's inventory? How many unique movie titles are available?
select count(distinct(inventory_id)) from sakila.nventory;
select count(distinct(rental_id)) from sakila.rental;
-- 3.What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select max(length) as max_duration, min(length) as min_duration from sakila.film;
-- 4.What's the average movie duration expressed in format (hours, minutes)?
select concat(floor(avg(length) / 60), ' hours ', avg(length) % 60, ' minutes') as average_duration
from sakila.film;
-- 5.How many distinct (different) actors' last names are there?
select count(distinct last_name) from sakila.actor;
-- 6.How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)
select datediff(max(rental_date), min(rental_date)) as operating_days
from sakila.rental;
-- 7.Show rental info with additional columns month and weekday. Get 20 results.
select rental_id, rental_date, month(rental_date) as month, weekday(rental_date) as weekday
from sakila.rental
limit 20;
-- 8.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select rental_id, rental_date, dayname(rental_date) as day_type
from sakila.rental;
-- 9.Get release years.
select distinct (release_year)
from sakila.film;
-- 10.Get all films with ARMAGEDDON in the title.
select title 
from sakila.film
where title like "%ARMAGEDDON%";
-- 11.Get all films which title ends with APOLLO.
select title 
from sakila.film
where title like "%APOLLO";
-- 12.Get 10 the longest films.
select * from sakila.film
order by length DESC
limit 10;
-- 13.How many films include Behind the Scenes content?
select count(*)
from sakila.film
where special_features like '%Behind the Scenes%';

