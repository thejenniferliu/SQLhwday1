-- 1. How many actors are there with the last name ‘Wahlberg’? 2  
select * from actor where last_name like 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?  --5607
select count(*) from payment where amount between 3.99 and 5.99;

--3. What film have 7 copies
select count(*), film_id from inventory 
group by film_id
having count(*) = 7;

--4. How many customers have the first name ‘Willie’? 2 
select * from customer where first_name = 'Willie';

--5. What store employee (get the id) sold the most rentals (use the rental table)? staff_id 1 = 8040
select count(*) rental_id, staff_id
from rental
group by staff_id


--6 How many unique district names are there? 378
select district from address
group by district;

--7. What film has the most actors in it? (use film_actor table and get film_id)
--select * from film_actor  #508

select film_id, count(*) actor_id
from film_actor
group by film_id
order by actor_id desc;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select count(*) last_name 
from customer 
where store_id = 1 and last_name like '%es'


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers 
--with ids between 380 and 430? (use group by and having > 250) none!!!!!
select * from payment

select customer_id
from payment 
where customer_id between 380 and 430
group by customer_id 
having count(amount) > 250




--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total? -- 5 rating categories
--select * from film
select rating, count(*) film_id 
from film 
group by rating

