--"Hello World" of SQL - SELECT * gets you all records from the table

select * 
from actor; 

-- Query specific columns -- SELECT column_name, ... FROM table_name

select first_name, last_name 
from actor;
-- Change query order

select last_name, first_name 
from actor

select *
from film;
--Filter rows -- use the WHERE clause- always use after from 
--use single quotes, use double quotes for specifc reasons

select * 
from actor 
where first_name = 'Nick';

--Using the Like operator
select * 
from actor 
where first_name like 'Nick';

--all the names that come after j. % is wild card-
select * 
from actor where first_name like 'J%';

--Using the like operator with underscore _ acts as wild card from only 1 character
select * from actor where first_name like '_i_'; --first name 3 letters, 2nd letter is i

--% and _ can be used together
select * from actor where first_name like '_i%'; --2nd letter is i, anything after is ok

--using AND and or in our WHERE clause
-- OR - only one thing needs to be true 
select * from actor 
where first_name like 'N%' or last_name like 'W%';

--AND-- all conditions have to be true 
select * from actor where first_name like 'N%' and last_name like 'W%';

--Comparing operators in SQL: >, <, >=, <=, Equal(=), Not Equal(<>)
select * from payment;

--Query for all payments > $4
select customer_id, amount from payment where amount > 4;

--Query for payments not 7.99
select customer_id, amount from payment where amount <> 7.99;

--Query payments between 3 - 8
select * from payment where amount >= 3 and amount <= 8;

--Between/AND
select * from payment where amount between 3 and 8;

--See it in specific order/ ORDER BY clause
select * from payment where amount between 3 and 8
order by payment_date;

--order by descending
select * from payment where amount between 3 and 8
order by amount desc;

--order by string gets you alphabetic order 
select * from actor order by last_name 

--SQL aggregations -- sum(), avg(), count(), min(), max()
--takes in column as argument, and returns a values 
--get sum of all arguments
select sum(amount) from payment;

--- get sum of all payments more than 5 dollars
select sum(amount) from payment where amount > 5;

--get average
select avg(amount) from payment where amount > 5;

--get count
select count(amount) from payment where amount > 5;

--count all
select count(*) from payment where amount > 5;

--get min/max of payments
select min(amount) from payment;

--min with aliasing
select min(amount) as lowest_amount_paid
from payment;

--max with aliasing:
select max(amount) as max_amount_paid
from payment;

--calculate a column based on other colums
select payment_id - rental_id as difference 
from payment;

select payment_id, rental_id, payment_id - rental_id as difference 
from payment;

--Query the number of payments per amount/very tedius
select(*)
from payment where amount = 2.99
select(*)
from payment where amount = 3.99
select(*)
from payment where amount = 4.99

--Group by clause - used aggregations
select amount, count(*)
from payment group by amount;

select amount, count(*), sum(amount), avg(amount)
from payment group by amount;

---Using group bys with everything from the select
select amount, customer_id, count(*)
from payment 
group by amount; --will throw an error--

--correct way
select amount, customer_id, count(*)
from payment 
group by amount, customer_id;

--Query the payment table to display the customers who spent the most
select customer_id, sum(amount) from payment 
group by customer_id 
order by sum(amount) desc;

select * from payment order by customer_id;

--alias our aggregate column and use alisaed name in order 
select customer_id, sum(amount) as total_spent
from payment 
group by customer_id order by total_spent desc;

--Query the payment table to display customers who have spent the most, made at least 40 payments
select customer_id, sum(amount) as total_spent
from payment 
group by customer_id 
having count(*) >= 40
order by total_spent desc;

--LIMIT and OFFSET clause
-- limit - limits the number of rows returned

select * from film limit 10;

--off set -start rows after certain amount-straight to #11

select * from actor offset 10;

--offet and limit together 11-15
select * from actor offset 10 limit 5;


--putting all clauses into one query
--customers 11-20 who have spent most in 20 payments, customer id > 3

select customer_id, sum(amount), count(*) 
from payment 
where customer_id > 3
group by customer_id 
having count(*) < 20
order by sum(amount)
offset 10
limit 10;
-- Syntax order (SELECT and FROM - mandatory keywords)
--select, from, join, on, where, group by, having, order by, offset, limit
