--Count the total number of invoices
select count(invoice_id) invoice_count from invoice;

--Calculate total revenue from all invoices
select sum(total) total_revenue from invoice;

--Calculate the average invoice total
select avg(total) avg_total from invoice;

--Find the minimum invoice total
select min(total) min_total from invoice;

--Find the maximum invoice total
select max(total) max_total from invoice;

--Count invoices per country
select billing_country, count(invoice_id) invoice_count from invoice group by billing_country;

--Calculate total revenue per country
select billing_country, sum(total) total_revenue from invoice group by billing_country;

--Count customers per country
select country, count(customer_id) customer_count from customer group by country;

--Count tracks per genre
select g.name genre, count(t.track_id) from track t left join genre g on t.genre_id = g.genre_id group by g.name;

--Calculate average track price per genre
select g.name genre, avg(t.unit_price) from track t left join genre g on t.genre_id = g.genre_id group by g.name;

--Count invoices per customer
select c.customer_id, count(i.invoice_id)invoice_count from customer c  left join invoice i on c.customer_id = i.customer_id group by c.customer_id order by c.customer_id;

--Calculate total revenue per customer
select c.customer_id, sum(i.total)total_revenue from customer c  left join invoice i on c.customer_id = i.customer_id group by c.customer_id order by c.customer_id;

--Calculate average invoice value per customer
select c.customer_id, avg(i.total)avg_total from customer c  left join invoice i on c.customer_id = i.customer_id group by c.customer_id order by c.customer_id;

--Count tracks per album
select a.title album_name, count(t.track_id)total_tracks from track t left join album a on t.album_id = a.album_id group by a.title ;

--Count total tracks per artist
select a2.artist_id,a2.name artist_name, count(t.track_id)total_tracks from track t join album a on t.album_id = a.album_id join artist a2 on a.artist_id = a2.artist_id group by a2.artist_id, a2.name order by a2.artist_id ;

--Count employees per job title
select title, count(employee_id) employee_count from employee group by title order by title;

--Calculate total revenue per year
select extract(year from invoice_date) as year, sum(total) total_revenue from invoice group by year order by year;

--Count invoices per year
select extract(year from invoice_date) as year, count(invoice_id) total_invoice from invoice group by year order by year;

--Calculate average invoice total per year
select extract(year from invoice_date) as year, avg(total) avg_total from invoice group by year order by year;

--Find countries with more than 10 invoices
select billing_country, count(invoice_id) total_invoice from invoice group by billing_country having count(invoice_id) > 10 ;