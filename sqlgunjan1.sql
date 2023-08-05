create database soccer_db;
use soccer_db;

## 1. From the following table, write a SQL query to count the number of countries that parƟcipated 

-- use table player_mast 

select* from player_mast;
select count(distinct playing_club)
from player_mast
where dt_of_bir =2016;

## 2. From the following table, write a SQL query to find the number of matches that ended with a result.
 
-- use table match_mast 
select*from match_mast;
select count(*)
from match_mast
where result <> 'drow';

# 3. From the following table, write a SQL query to find out when the Football EURO cup 2016 will begin.
-- use table match_mast 


select min(play_date)
from match_mast
where venue_id="2016";

# 4. From the following table, write a SQL query to find out where the final match of the EURO cup 2016 was played.
-- Return venue name, city. 
-- use tables: soccer_venue, soccer_city, match_mast 
select venue_name,city
from soccer_venue a
join soccer_city b on a.city_id=b.city_id
join match_mast d on d.venue_id=a.venue_id
and match_mast.results="final";

# 5. From the following tables, write a SQL query to find the number of goals scored by each team in each match during normal play. 
-- Return match number, country name and goal score. 
-- use tables: match_details, soccer_country
select match_no,cuntry_name,goal_score
from match_details a
join soccer_country b
on a.team_id=b.country_id
where decided_by='n'
order by match_no;

# 6. From the following table, write a SQL query to count the number of goals scored by each player within a normal play schedule.
select player_name,count(*),country_name
from goal_details a
join player_mast b on a.player_id=b.player_id
join soccer_country c on a.team_id=c.country_id
where goal_schedule='nt'
group by player_name,country_name
order by count(*) desc;

# 7. From the following table, write a SQL query to find out who scored the most goals in the 2016 Euro Cup. 
-- Return player name, country name and highest individual scorer. 
-- use tables: goal_details, player_mast, soccer_country 
select p.player_name,
c.country_name,
max(gd.goals_scored)as
highest_individual_scorer
from goal_details gd
join player_mast p on gd.player_id=p.player_id
join soccer_country c on
p.country_id=c.country_id
where gd.tournament_year=2016
group by p.player_name,
c.country_name
order by highest_individual_scorer desc
limit 1;

# 8. From the following table, write a SQL query to find out which teams played the first match of the 2016 Euro Cup.
-- Return match number, country name. 
-- use tables match_details, soccer_country
select
match_no,country_name
from match_details a,
soccer_country b
where
a.team_id=b.country_id
and a.match_no=1;

# 9. From the following table, write a SQL query to find the highest audience match. 
-- Return match_no, play_stage, goal_score, audience. 
-- use table match_mast 
select match_no, play_stage, goal_score,audence
from match_mast
where audence=(
select max(audence)
from match_mast);

# 10. Write a SQL query to find the players who scored goals in each match. 
-- Group the result set on match number, country name and player name. 
-- Sort the result-set in ascending order by match number. 
-- Return match number, country name, player name and number of goals. 
-- use tables goal_details, soccer_country, player_mast

select match_no,country_name,player_name, count(match_no)
from goal_details a, soccer_count b,player_mast c
where a.team_id=b.country_id
and a.player_id=c.player_id
group by match_no,country_name,player_name
order by match_no;




 