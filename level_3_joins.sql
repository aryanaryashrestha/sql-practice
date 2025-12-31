--List customers with their invoices
select c.customer_id, concat_ws(' ',c.first_name,c.last_name) customer_name,i.invoice_id, i.invoice_date, i.total  from invoice i join customer c on i.customer_id = c.customer_id order by c.customer_id;

--Show customers with total invoice count
select c.customer_id, concat_ws(' ',c.first_name,c.last_name) customer_name, count(i.invoice_id)  from invoice i left join customer c on i.customer_id = c.customer_id group by c.customer_id,concat_ws(' ',c.first_name,c.last_name) order by c.customer_id;

--Show customers with total money spent
select c.customer_id, concat_ws(' ',c.first_name,c.last_name) customer_name, sum(i.total)  from invoice i left join customer c on i.customer_id = c.customer_id group by c.customer_id,customer_name order by c.customer_id;

--List invoices with customer names
select i.invoice_id,i.invoice_date,i.total, concat_ws(' ',c.first_name,c.last_name) customer_name  from invoice i left join customer c on i.customer_id = c.customer_id  order by i.invoice_id;

--Show invoice items with track names
select  il.invoice_id, t.name as track_name from invoice_line il join track t on il.track_id = t.track_id order by il.invoice_id;

--Show invoice items with track and album names
select  il.invoice_id, t.name as track_name, a.title from invoice_line il join track t on il.track_id = t.track_id join album a on t.album_id = a.album_id order by il.invoice_id;

--List tracks with their album names
select t.track_id, t.name track_name, a.title album_name from track t join album a on t.album_id = a.album_id order by t.track_id

--List albums with artist names
select a.title album_name, a2.name artist_name from album a join artist a2 on a.artist_id = a2.artist_id order by a2.artist_id

--List tracks with artist names
select t.track_id, t.name track_name , a2.name artist_name from track t join album a on t.album_id = a.album_id join artist a2 on a.artist_id = a2.artist_id order by t.track_id;

--Show invoices with the employee who handled them
select i.invoice_id, i.invoice_date, i.customer_id, e.employee_id, concat_ws(' ',e.first_name, e.last_name) employee_name from invoice i join customer c on i.customer_id = c.customer_id join employee e on c.support_rep_id = e.employee_id order by i.invoice_id

--Count invoices handled by each employee
select  e.employee_id, concat_ws(' ',e.first_name, e.last_name) employee_name, count(i.invoice_id) invoices_handeled  from invoice i left join customer c on i.customer_id = c.customer_id right join employee e on c.support_rep_id = e.employee_id group by e.employee_id, employee_name order by e.employee_id ;

--Show customers and total tracks purchased
select c.customer_id, 
concat_ws(' ',c.first_name,c.last_name)customer_name, 
count(il.invoice_line_id) 
from customer c left join invoice i on c.customer_id = i.customer_id 
left join invoice_line il on i.invoice_id = il.invoice_id 
group by c.customer_id,customer_name
order by c.customer_id;

--Show customers and total quantity purchased
select c.customer_id, 
concat_ws(' ',c.first_name,c.last_name)customer_name, 
sum(il.quantity)total_quantity_purchased
from customer c 
	left join invoice i 
	on c.customer_id = i.customer_id 
	left join invoice_line il 
	on i.invoice_id = il.invoice_id 
group by c.customer_id,customer_name
order by c.customer_id;

--Calculate revenue per track
select t.track_id, t.name, sum(il.unit_price * il.quantity) total_revenue
from invoice_line il 
left join track t 
on il.track_id = t.track_id 
group by t.track_id,t.name
order by t.track_id;

--Calculate revenue per album
select a.album_id, a.title album_title, sum(il.unit_price * il.quantity) total_revenue
from track t
left join album a 
on t.album_id = a.album_id
left join invoice_line il on t.track_id = il.track_id
group by a.album_id , a.title 
order by a.album_id;

--Calculate revenue per artist 
select a2.artist_id, a2.name, sum(il.unit_price*il.quantity)total_revenue 
from album a 
left join artist a2 
on a.artist_id = a2.artist_id 
left join track t 
on t.album_id = a.album_id 
left join invoice_line il 
on t.track_id = il.track_id 
group by a2.artist_id , a2.name 
order by a2.artist_id;

--Calculate revenue per genre
select g.genre_id, g.name, sum(il.unit_price * il.quantity)total_revenue
from genre g 
left join track t
on g.genre_id = t.genre_id
left join invoice_line il
on t.track_id = il.track_id
group by g.genre_id ,g.name
order by g.genre_id;

--Find customers who never placed an invoice
select c.customer_id, concat_ws(' ',c.first_name,c.last_name)customer_name 
from customer c 
left join invoice i  
on c.customer_id = i.customer_id 
where i.invoice_id is null;

--Find tracks that were never sold
select t.track_id, t.name track_name
from track t 
left join invoice_line il
on t.track_id = il.track_id 
where il.invoice_line_id is null;

--Find artists with no sales
select a.artist_id, a.name artist_name
from artist a
left join album a2
on a.artist_id = a2.artist_id
left join track t
on a2.album_id = t.album_id
left join invoice_line il
on t.track_id = il.track_id
group by a.artist_id, artist_name
having count(il.invoice_line_id)=0
order by artist_id;


--Find customers with invoices but no company listed
select c.customer_id, concat_ws(' ',c.first_name,c.last_name) customer_name
from customer c 
left join invoice i
on c.customer_id = i.customer_id
where c.company is null
group by c.customer_id,customer_name
having count(i.invoice_id) >= 1
order by customer_id;

--Count invoices handled by each employee per year 
select e.employee_id , concat_ws(' ',e.first_name,e.last_name) employee_name, 
extract (year from i.invoice_date) invoice_year, 
count(i.invoice_id) invoice_count 
from employee e 
left join customer c 
on e.employee_id = c.support_rep_id 
left join invoice i 
on c.customer_id = i.customer_id 
group by e.employee_id, employee_name, invoice_year 
order by e.employee_id, invoice_year;

--Calculate revenue per country per year
select c.country , 
extract(year from i.invoice_date) invoice_year,
sum(i.total) total_revenue
from customer c
left join invoice i
on 	c.customer_id = i.customer_id
group by c.country,invoice_year
order by c.country, invoice_year;

--Find top 5 selling tracks
select t.track_id, t.name track_name, 
sum(il.unit_price *il.quantity) total_sales
from track t
join invoice_line il
on 	t.track_id = il.track_id
group by t.track_id, track_name 
order by total_sales desc 
limit 5;

--Find top 5 customers by total spending
select c.customer_id, concat_ws(' ',c.first_name,c.last_name) customer_name,
sum(total) total_spend
from customer c 
join invoice i
on c.customer_id = i.customer_id
group by c.customer_id, customer_name 
order by total_spend desc
limit 5;


