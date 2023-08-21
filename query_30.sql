--reverse the table (cities should be columns and names should be rows).

create table players_location
(
name varchar(20),
city varchar(20)
);
delete from players_location;
insert into players_location
values ('Sachin','Mumbai'),('Virat','Delhi') , ('Rahul','Bangalore'),('Rohit','Mumbai'),('Mayank','Bangalore');


--select * from players_location


select 
max(case when city = 'Bangalore' then name end) as Bangalore, 
max(case when city = 'Mumbai' then name end) as Mumbai, 
max(case when city = 'Delhi' then name end) as Delhi
from (
select *, 
row_number() over(partition by city order by name) as city_groups
from players_location) A
group by city_groups