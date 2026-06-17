CREATE DATABASE netflix_project;
use netflix_project;

CREATE TABLE netflix (
show_id varchar(20),
type varchar (20),
title varchar (255),
director varchar (255),
cast text,
country varchar (255),
date_added varchar (50),
release_year int,
rating varchar (20),
duration varchar (50),
listed_in varchar (255),
description text
);
select*from netflix limit 10;
update netflix set cast='unknown'
where cast is null or cast ='';

# Questions

# Q1. HOW MANY RECORDS HAVE MISSING DIRECTOR INFORMATION?
select count(*) from netflix where director is null or director = '';

# Q2. HOW MANY RECORDS HAVE MISSING DIRECTOR INFORMATION?
select count(*) from netflix where country is null or country = '';

# Q3. HOW MANY MOVIES AND TV SHOWS ARE AVAILABLE ON NETFLIX ?
select type,count(*) as total from netflix group by type;

# Q4. HOW MANY NETFLIX TITLES WERE RELEASED EACH YEAR ?
select release_year,count(*) as total_titles from netflix group by release_year order by release_year;

# Q5. WHICH ARE THE TOP 10 COUNTRIES WITH THE HIGHEST NUMBER OF NETFLIX TITLES?
select country ,count(*)  as total from netflix where country is not null group by country order by total desc limit 10;

#Q6.WHAT ARE THE MOST COMMON CONTENT RATING ON NETFLIX?
select rating ,count(*)  as total from netflix group by rating order by total desc;

#Q7. WHO ARE THE TOP 10 DIRECTORS WITH THE MOST CONTENT ON NETFLIX?
select  director , count(*) as total_titles from netflix where director is not null group by director order by total_titles desc  limit 10;

#Q8. WHICH MOVIES WERE RELEASED AFTER THE YEAR 2020?
select title,release_year from netflix  where type='movie' and release_year>2020;

#Q9. WHAT ARE THE 10 LONGEST MOVIES AVAILABLE ON NETFLIX?
select title,duration from netflix where type='movie' order by cast(replace(duration,'min','') as unsigned) desc limit 10;

#Q10. HOW CAN COUNTRIES BE RANKED ON THE NUMBER OF NETFLIX TITLES THEY CONTRIBUTE?
select country ,count(*) as total_titles,rank () over(order by count(*) desc) as ranking from netflix where country is not null group by country;

#Q11. WHAT PERCENTAGE OF NETFLIX CONTENT CONSIST OF MOVIES AND WHAT PERCENTAGE CONSISTS OF TV SHOWS ?
select type,count(*) *100.0/(select count(*) from netflix ) as percentage from netflix group by type;


