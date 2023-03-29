select *
from `user`;

select *
from `album`;

select *
from `playlist`;

select *
from `song`;

select *
from `subscription_plan`;

select *
from `payment_method`;

select *
from `employee`;

select *
from `full_time`;

select *
from `part_time`;

-- Basic queries
  -- 1 display user id, name and gender who is Male
select User_ID as 'ID', User_Fullname as 'Fullname', User_Gender as 'Gender' 
from `user`
where User_Gender = "M";

  -- 2 display user name and apple id who use "@icloud.com"
select User_ID as 'ID', User_Fullname as 'Fullname', User_AppleID as 'Apple ID'
from `user`
where User_AppleID like "%icloud.com%"
order by User_Fullname ASC;

  -- 3 display album name and its release date of which released before 2021
select Album_name as 'Album name', Album_release as 'Release Date'
from `album`
where Year(Album_release) < 2021
order by Album_release ASC;

  -- 4 display album name and its release date of which released since jan to may
select Album_name as 'Album name', Album_release as 'Release Date'
from `album`
where Month(Album_release) <= 5
order by Album_release DESC;

  -- 5 display playlist which contain types of pop song
select Playlist_ID as 'ID', Playlist_Name as 'Playlist name', Category as 'Genre'
from `playlist`
where Category = "Pop"
order by Playlist_ID ASC;

  -- 6 display song which contain Y in its name
select Song_Name as 'Name'
from `song`
where Song_Name like '%Y%';

  -- 7 display song which start Y in its name
select Song_Name as 'Name'
from `song`
where Song_Name like 'Y%';

  -- 8 subscription id and plan name of Individual
SELECT  subscription_ID as 'ID', subscription_name as 'Name'
From `subscription_plan`
where subscription_name LIKE "Individual" 
ORDER BY subscription_name ASC; 

  -- 9 List subscription id and plan name of Family and student
SELECT  subscription_ID as 'ID', subscription_name as 'Name'
From `subscription_plan`
where subscription_name LIKE "Family" OR subscription_name LIKE "Student"
ORDER BY subscription_ID ASC; 

  -- 10 list user's card type and payment number who use visa card
SELECT payment_no as 'No', payment_cardtype as 'Card Type'
From `payment_method`
where payment_cardtype = "visa"
order by payment_no ASC;

  -- 11 List plan which price are lower than 150
SELECT subscription_name as 'Name', price as 'Price'
From `subscription_plan`
where (price) < 150
order by subscription_name DESC;

  -- 12 List employee name who address in Sampran
SELECT employee_Fullname as 'Name', employee_Address as 'Address'
From `employee`
where employee_Address = "Sampran, Nk"
order by employee_Fullname ASC;

  -- 13 List employee name who address in Phaya Thai
SELECT employee_Fullname as 'Name', employee_Address as 'Address'
From `employee`
where employee_Address = "Phaya Thai, Bkk";

  -- 14 List user name who age below 20
SELECT User_ID as 'ID', User_Fullname as 'Fullname', User_AppleID as 'Apple ID', User_Age as 'Age'
from `user`
where (User_Age) < 20
order by User_Fullname ASC;

  -- 15 List full time employee who in the position 'C'
SELECT promotion as 'Position', employee_ID as 'ID'
from `full_time`
where promotion = "C"
order by employee_ID ASC;

  -- 16 List part time employee who has name caontain 'e'
select employee_Fullname as 'Name', employee_ID as 'ID'
from `employee`
where employee_Fullname like '%e%';

  -- 17 List name of employee who gender is Male
select employee_Fullname as 'Name', employee_Gender as 'Gender'
from `employee`
where employee_Gender = "M"
order by employee_Fullname ASC;

  -- 18 List name of song name which contain z
select Song_Name as 'Name'
from `song`
where Song_Name like '%z%';

  -- 19 List name user who has name contain with i and age since 20
select User_ID as 'ID', User_Fullname as 'Fullname'
from `user`
where (User_Fullname like '%i%') AND (User_Age) >=  20;

  -- 20 
select Album_name as 'Album name', Album_release as 'Release Date'
from `album`
where Month(Album_release) <= 9 AND Year(Album_release) <= 2018
order by Album_release DESC;  

-- Advance queries
  -- 1 list name of user who name start with C and S
select User_Fullname as 'Fullname',User_ID as 'ID' 
from user 
where User_Fullname like 'C%' 
union
select employee_Fullname as 'Fullname',employee_ID as 'ID' 
from employee
where employee_Fullname like 'S%';

  -- 2 list number of user and calculate price of all subscription
select count(User_ID), sum(price)
from `subscription_plan`;

  -- 3 list number of full time employee and calculate monthly earning of all full time employee
select count(employee_ID), sum(monthly_earning)
from `full_time`;

  -- 4 list number of part time employee and calculate hourly earning of all part time employee
select count(employee_ID), sum(hourly_earning)
from `part_time`;

  -- 5 list full time employee together with employee
select e.*
from employee e
left join full_time f on f.employee_ID = e.employee_ID;

  -- 6 list 
select user.User_ID, User_Fullname, Song_name
from user
inner join song on user.User_ID = song.User_ID
order by User_Fullname ASC;

  -- 7 list user ID and name of each subscription and order by price
select u.User_ID, User_Fullname, subscription_name
from user u
inner join subscription_plan s on u.User_ID = s.User_ID
order by s.price;

  -- 8 list user 
select Album_name, Song_name, s.URL
from album al
inner join song s on al.Song_ID = s.Song_ID
order by Album_ID ASC; 

  -- 9 list full time employee name, ID, monthly earning who live in Bang Na
select e.employee_ID, e.employee_Fullname, monthly_earning
from employee e
inner join full_time f on e.employee_ID = f.employee_ID
where  employee_Address = "Bang Na, Bkk";  

  -- 10 list employee name who add playlist name, its categoty and song name
select  e.employee_Fullname As " Employee's Full Name",  Playlist_Name, Category, song.Song_name 
from playlist pl
inner join song on song.Song_ID = pl.Song_ID
inner join employee e on e.employee_ID = pl.employee_ID
order by Playlist_ID ASC;

  -- 11 list part time employee who live in Sathorn
select e.employee_ID, e.employee_Fullname, hourly_earning
from employee e
inner join part_time p on e.employee_ID = p.employee_ID
where  employee_Address = "Sathorn, Bkk"; 

  -- 12 list part time employee who live in Lat Phrao and full time employee who live in Sampran
select e.employee_ID, e.employee_Fullname, hourly_earning
from employee e
inner join part_time p on e.employee_ID = p.employee_ID
where  employee_Address = "Lat Phrao, Bkk"
union
select e.employee_ID, e.employee_Fullname, monthly_earning
from employee e
inner join full_time p on e.employee_ID = p.employee_ID
where  employee_Address = "Sampran, Nk";

  -- 13 list full time employee who live in Sing Buri 
  -- null, there is no full time employee live in Sing Buri
select e.employee_ID, e.employee_Fullname, f.monthly_earning
from employee e
inner join full_time f on e.employee_ID = f.employee_ID
where  employee_Address = "Bang Rachan, Sing Buri"; 

  -- 14 
select e.employee_ID, e.employee_Fullname
from employee e
inner join full_time f on e.employee_ID = f.employee_ID
where  e.employee_Fullname like "s%";

  -- 15 list name of part time employee who gender is male
select e.employee_ID, e.employee_Fullname
from employee e
inner join part_time p on e.employee_ID = p.employee_ID
where  employee_Gender = "M";

select User_ID as 'ID', User_Fullname as 'Fullname', User_AppleID as 'Apple ID'
from `user`
where User_AppleID like "%hotmail.com%"
order by User_Fullname ASC;