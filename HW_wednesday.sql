--HW Wednesday

select * from customer

--List all customers who live in Texas (use joins)
select customer.first_name, customer.last_name, district
from customer 
full join address
on customer.address_id = address.address_id
where district = 'Texas';


-- Get all payments above $6.99 with the Customer's Full Name

select customer.first_name, customer.last_name, amount
from customer
full join payment
on customer.customer_id = payment.customer_id 
where amount > 6.99;


--Show all customers names who have made payments over $175(use subqueries)
select store_id, first_name, last_name
from customer
where customer_id in (
     select customer_id 
     from payment
     group by customer_id 
     having sum(amount) > 175
     order by sum(amount) desc 
);


--List all customers that live in Nepal (use the city table)
select customer.first_name, customer.last_name, customer.email, country
from customer 
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id 
where country = 'Nepal';



--Which staff member had the most transactions?
select staff.first_name, staff.last_name, staff.staff_id, count(payment_id)
from staff
inner join payment
on staff.staff_id = payment.staff_id 
group by staff.staff_id



--How many movies of each rating are there?

select rating, count(rating)
from film
group by rating;



--Show all customers who have made a single payment above $6.99 (Use Subqueries)

select cust_id, cust_name 
from customers 
where cust_id in (
    select customer_id 
    from payment 
    where amount > 6.99
    group by customer_id 
    having count(payment_id) = 1
);


--How many free rentals did our stores give away
select count(amount)
from payment
where amount = 0.00;

select * from payment