-- 1. Country wise number of restaurants 

select Country_Code,count(*) as Number_of_Restaurants from zomato group by country_code;

-- 2. What are the different cities covered in the Zomato database? 
select distinct city from zomato; 

-- 3. How many restaurants are present in each city? 
select city,count(*) as no_of_restaurants from zomato group by city order by no_of_restaurants desc;

-- 4. What are the different cuisines available in the database? 
select distinct cuisines from zomato;

-- 5. How many restaurants offer each cuisine? 
select cuisines , count(*) as restaurants from zomato group by Cuisines; 

-- 6. What are the top-rated restaurants based on user reviews (where rating is 5)? 
with cte1 as 
(select restaurent_name , avg(rating) over (order by rating desc) as rank_rating from zomato) 
select * from cte1 where rank_rating = 5;

-- 7. What are the average ratings of restaurants in each city (where avg_rating is 5 stars)? 
with cte1 as (
select city, avg(rating) as avg_rating from zomato group by city order by avg_rating desc)
select * from cte1 where avg_rating = 5;

-- 8. How many restaurants offer online delivery and how many don't? 
select restaurent_name, city from zomato where Has_Online_Delivery like 'Yes';

-- 9. What is the distribution of restaurants across different price ranges? 
select Average_cost_for_two, count(*) as restaurants from zomato group by Average_Cost_For_Two order by restaurants desc;

-- 10. Display country name for corresponding city and number of restaurants 
select b.country , a.city, count(restaurent_id) as restaurants from zomato as a 
join country as b using(country_code) group by country,city;

-- 11. what are the best rated restaurant in each city. 
with cte1 as (
select city,restaurent_name, dense_rank() over (partition by city order by rating desc) as restaurant_rank from zomato)
select * from cte1 where restaurant_rank = 1;

-- 12. display restaurents which have least cost for two and least rating in a city (rating <3)
with cte1 as (
Select city,restaurent_name,Average_Cost_For_Two,rating, dense_rank() over(partition by city order by Average_cost_for_two,Rating) as avg_cost  
from zomato) 
select * from cte1 where  avg_cost = 1 and rating <3;

-- 13. Recommend restaurents to a customer in bangalore which is 5 star and order by cost; 
select distinct restaurent_name,average_cost_for_two from zomato where city like 'bangalore' and rating like '5' order by average_cost_for_two;

