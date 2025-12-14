--Select all columns from the customers table
select * from customer

--Select first name, last name, and country from customers
select first_name, last_name, country from customer;

--List all distinct customer countries
select distinct country from customer;

--Find customers located in the USA
select * from customer where country = 'USA';

--Find customers not located in the USA
select * from customer where country != 'USA' ;

--List all invoices
select * from invoice;

--Show invoices with total greater than 10
select * from invoice where total > 10;

--Show invoices with total between 5 and 15
select * from invoice where total >=5 and total <=15;

--Find invoices from the year 2022
select * from invoice where invoice_date > date '2021-12-31';

--List invoices ordered by invoice date
select * from invoice order by invoice_date;

--List all tracks
select * from track;

--Show tracks with unit price greater than 0.99
select * from track where unit_price > 0.99;

--List tracks ordered by unit price descending
select * from track order by unit_price desc;

--Show the first 10 tracks
select * from track limit 10;

--Find employees hired after the year 2005
select * from employee where hire_date > date '2004-12-31';

--List employee names and their titles
select concat_ws(' ',first_name,last_name) name, title from employee;


--Find customers where company is NULL
select * from customer where company is null;


--Find tracks whose name contains the word “Love”
select * from track where name like '%Love%';

--Count the total number of customers
select count(customer_id) customer_count from customer; 

