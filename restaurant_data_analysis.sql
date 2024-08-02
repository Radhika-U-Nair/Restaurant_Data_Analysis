select * from restaurant_data;

-- add a column 'Revenue in Millions'
alter table restaurant_data add column `Revenue in Millions` double;
set sql_safe_updates=0;
update restaurant_data set `Revenue in Millions`= round((Revenue/1000000),2);

select location,count(location) from restaurant_data group by location order by location;
-- There are 3 different types of locations: Downtown(2821), Rural(2762), and Suburban(2785).

select cuisine from restaurant_data group by cuisine;
-- There are 6 different type of cuisines: Indian, Japanese, Mexican, French, Italian, and American.

select cuisine,count(cuisine) as No from restaurant_data group by cuisine order by No desc;
-- French cuisine is the highest in number(1433) and the least is Japanese(1344)

select location,cuisine,count(cuisine) as cuiscount from restaurant_data group by location,cuisine order by 
location,cuiscount desc;
-- In Downtown, most number of cuisines are American(494) and the least is Japanese(433)
-- In Rural area, French cuisines(499) are the most and the least are Indian cuisines(431)
-- In Suburban area, Indian cuisines are most(489) and the least are Japanese(426)

select location,cuisine,avg(rating) as avg from restaurant_data group by location,cuisine order by location, avg desc;
-- French cuisine has the highest average rating in Downtown area, Italian in Rural area and Indian cuisine in suburban area.

select location,cuisine,round(avg(`seating capacity`),0) as seating from restaurant_data group by cuisine,location
order by location, seating desc ;
-- Average seating capacity in Downtown in 80, Rural is 40 and Suburban is 60

select cuisine,max(`average meal price`),min(`average meal price`) from restaurant_data group by cuisine;
-- max average meal price is 76 for Japanese cuisine and min average meal price is 25 for Mexican cuisine.

select location,cuisine,max(`social media followers`) as Most_Followers from restaurant_data group by location, 
cuisine order by location, Most_Followers desc ;
-- Most followers in Downtown is for French cuisine(103777) 
-- in Rural is for Japanese cuisine(58082)
-- in  Suburban is for Indian cuisine(57233)

select * from restaurant_data order by `social media followers` desc;
-- downtown location has most social media followers. Suburban and rural locations have comparitatively less socail media followers.

select location,cuisine, `marketing budget` from restaurant_data order by `marketing budget` desc;
-- Marketing budget is high in downtown and low in suburban and rural areas.

select cuisine,min( `marketing budget`),max(`marketing budget`) from restaurant_data group by cuisine ;
-- maximum marketing budget is for Mexican cuisine(9978) in downtown location and minimum marketing budget 
-- is for Japanese cuisine(604) in suburban location.

select location,cuisine,max(`marketing budget`) as max_marketing_budget from restaurant_data group
by location, cuisine order by location,max_marketing_budget desc;
-- Mexican cuisine has the most marketing budget in downtown location(9978) and Suburban locations(4980),
-- whereas Japanese cuisine has the most marketing budget in Rural location(4871)

select location,cuisine,avg(`number of reviews`) as avg from restaurant_data group by location,cuisine order by 
location, avg desc;
-- average number of reviews is high for French cuisine(539.26) in downtown location, italian cuisine(541.40) in 
-- rural location and Indian cuisine(531.50) in suburban location.

select location,count(location) from restaurant_data where `parking availability`='yes' group by location
order by location;
-- Regarding the parking availability, in Downtown out of 2821, 1426 restaurants have parking availability(50.549%) 
-- whereas it is 1379 out of 2762 in Rural location (49.9275%) and in Suburban area, 1384 restaurants have parking 
-- facility out of 2785 restaurants(49.6947%).

select location,cuisine,avg(`Weekend Reservations`) as Reservation from restaurant_data group by
location,cuisine order by location, Reservation desc;
select location,cuisine,sum(`Weekend Reservations`) as Reservation from restaurant_data group by
location,cuisine order by location, Reservation desc;
-- Highest weekend reservation In Downtown is for Italian cuisine(average is 40.41) and the least is for Japanese(37.02).
-- In rural area the highest weekend reservation is for Indian(19.64) and lowest for Mexican(19.05).
-- In Suburban area, the highest is for Japanese(30.05) and lowest is for Italian (28.86)

select location,avg(`weekday reservations`) FROM restaurant_data group by location ;
-- average weekday reservations is high in downtown and low in rural

select * FROM restaurant_data order by revenue desc ;
-- high revenue is generated in downtown location for Japanese cuisine(1.53M) and low in rural location for mexican cuisine(0.18M)

