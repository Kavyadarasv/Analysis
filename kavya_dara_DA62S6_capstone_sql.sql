use sakila;
-- task 1
select*from actor;
select concat(first_name,' ',last_name) as fullname from actor; -- full name of actors

-- task 2.1
select first_name, count(*) as name_count -- count of first names 
from actor group by first_name
order by name_count desc; 

-- task 2.2
select count(*) as unique_first_name,first_name -- unique first name
from actor
group by first_name
having count(*) = 1;

-- task 3.1
select last_name, count(*) as count_name     -- count of last name
from actor group by last_name
order by count_name desc;

-- task 3.2
select count(*) as unique_last_name,last_name -- unique last name
from actor
group by last_name
having count(*) = 1;

-- task 4.1
select title,rating from film where rating = 'R'; -- R rating movie

-- task 4.2
select title,rating from film where rating != 'R'; -- except R rating

-- task 4.3
select title,rating 
from film
where rating = 'G' or rating = 'PG'; -- rating G or PG

-- task 5.1
 select title,replacement_cost from film 
where replacement_cost<=11
order by replacement_cost desc;   -- replacememnt upto 11

-- task 5.2
select title,replacement_cost from film 
where replacement_cost between 11 and 20  -- replacement cost b/w 11 and 20
order by replacement_cost desc;

-- task 5.3
select title,replacement_cost from film 
order by replacement_cost desc;

-- task 6
select*from film;
select *from film_actor;
select f.title,count(fa.actor_id) -- top 3 actors
as actor_count from film f
join film_actor fa
on f.film_id=fa.film_id                      
group by f.film_id
order by actor_count desc limit 3;

-- task 7
select title from film where title like 'K%' or title like 'Q%' ; -- title start with K OR Q

-- task 8
select *from film;
select*from film_actor;
select*from actor;

select f.title, a.first_name,a.last_name
from film f join film_actor fa
on f.film_id =fa.film_id
join actor a 
on a.actor_id =fa.actor_id
where title ='Agent Truman';                -- The Agent Truman movie

-- task 9
select * from category;
select*from film;
select*from film_category;

select title from film where film_id in(select film_id from film_category 
where category_id=(select category_id from category
where name='Family'));

-- task 10.1
select max(rental_rate) as max_rental_rate ,
min(rental_rate) as min_rental_rate,avg(rental_rate) -- max,min,avg rental rate
as avg_rental_rate from film
group by rating
order by avg_rental_rate desc;

-- task 10.2
select*from rental;
select*from film;
select*from inventory;

select f.title,count(r.rental_id) as rental from film f
join inventory i on f.film_id = i.film_id
join rental r on r.rental_id = i.inventory_id
group by f.film_id order by rental desc;

-- task 11
select c.name as category_name, 
avg(f.replacement_cost) as avg_replacement_cost,
avg(f.rental_rate) as avg_rental_rate
from film f
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
group by c.name having (avg(f.replacement_cost) - avg(f.rental_rate)) > 15; -- rental rate above 15

-- task 12
select c.name as category_name, count(*) as movie_count
from film f 
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
group by c.name
having movie_count > 70;





