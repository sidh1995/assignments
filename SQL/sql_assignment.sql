use sakila;

#Query -1

select * from actor
where first_name = "Scarlett";

#Query -2

select * from actor
where last_name = "Johansson";

#Query-3

select count(distinct last_name) as "Distinct Last Name for Actors"
from actor;

#Query-4
select last_name as "Last Name that aren't repeated"
from actor
group by last_name
having count(last_name) = 1;

#Query-5
select last_name as"Last Name that are apppeared more than once.",
count(last_name) as "how many time they are appeared"
from actor
group by last_name
having count(last_name) > 1;

#Query-6
select actor.actor_id as "Actor_id",
actor.first_name as "This actor are appeared the most in Films",
actor.last_name as "last name",
count(film.film_id) as "Total films"
from actor
join film_actor
on actor.actor_id = film_actor.actor_id
join film
on film.film_id = film_actor.film_id
group by actor.actor_id;

#Query-7
select avg(length) as "Average length"
from film;

#Query-8
select film_category.category_id as "Category_id",
avg(film.length) as "Average length"
from film
join film_category
on film.film_id = film_category.film_id
group by category_id
order by category_id;

#Query-9
select film_category.category_id as "Film category",
    film.title as "Film Title",
    film.length as "Film length",
	avg(film.length) as "Average File length by category"
from film
join film_category
	on film_category.film_id = film.film_id
group by film_category.category_id
having film.length > avg(film.length);
