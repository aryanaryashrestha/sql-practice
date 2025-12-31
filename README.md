# SQL Practice Chinook PostgreSQL

This repository contains SQL queries written and executed on the Chinook sample database using PostgreSQL.

The purpose of this repository is to build strong SQL muscle memory and demonstrate practical query patterns commonly used in Data Engineering and Analytics workflows.

Over time this repository also reflects a clear improvement in how queries are written structured and presented for long term readability.

## Dataset

Chinook sample database  
Relational schema representing a digital media store  

Core tables used include  
customers  
invoices  
invoice_line  
tracks  
albums  
artists  
genres  
employees  

## Repository Structure

### LEVEL 1 Basic Select and Filtering

This level focuses on SQL fundamentals and correctness.

Topics practiced include  
select statements  
where filtering  
ordering results  
limit clauses  
basic string handling  
null checks  

File  
level_1_basic.sql  

### LEVEL 2 Aggregations and Group By

This level focuses on analytical thinking and summary queries.

Topics practiced include  
count sum average min max  
group by and having  
country wise artist wise album wise aggregations  
time based aggregations using year extraction  
handling nulls and zero count scenarios  

File  
level_2_aggregations.sql  

### LEVEL 3 Joins and Multi Table Analysis

This level focuses on real world query patterns using joins.

Topics practiced include  
inner join and left join usage  
anti joins using is null and not exists  
multi table joins across artist album track invoice  
revenue analysis at track album artist genre country and year level  
top n queries and ranking patterns  
understanding join direction and its impact on results  

File  
level_3_joins.sql  

## Writing Style Evolution

Initially queries were written in a single line focusing only on correctness.

As practice progressed the focus shifted to  
clear indentation  
logical clause separation  
consistent aliasing  
readable group by and join structure  

Writing SQL in a structured format significantly improved  
debugging speed  
logical clarity  
long term maintainability  

This change reflects a transition from just writing queries that run to writing queries that are readable reviewable and production ready.

## Tools Used

PostgreSQL  
DBeaver for query execution  
VS Code for query organization and versioning  
Git and GitHub for tracking progress  

## Purpose

Build fast and accurate SQL recall  
Practice real world aggregation and join patterns  
Develop clean readable and maintainable SQL habits  
Prepare for Data Engineering roles alongside Python and pipeline based projects  

This repository represents both technical growth and improvement in professional SQL practices.
