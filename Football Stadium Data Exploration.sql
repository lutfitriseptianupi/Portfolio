-- 1.) Total number of stadiums in the dataset ---

select count(Stadium) as Total_Stadium
from PortfolioProjects.dbo.FootballStadiums

-- Insight : Knowing the overall count of stadiums provides a basic understanding of the dataset's size.


-- 2.) Top 5 countries with the most stadiums

select TOP 5 Country, count(Stadium) as Total_Stadium
from PortfolioProjects.dbo.FootballStadiums
group by Country
order by Total_Stadium DESC

-- Insight : Identifying countries with the highest number of stadiums could be useful for strategic planning.


-- 3.) Average stadium capacity across all countries

select Country, avg(Capacity) as Average_Capacity
from PortfolioProjects.dbo.FootballStadiums
group by Country
order by Average_Capacity desc

-- Insight : Understanding the average stadium capacity gives an idea of the general size of stadiums.


-- 4) List of stadiums with capacity greater than 50,000

select Stadium,Capacity
from PortfolioProjects.dbo.FootballStadiums
where Capacity > 50000
order by Capacity desc

-- Insight : Identifying larger stadiums may be useful for hosting major events.


-- 5) Number of stadiums in each Confederation

select Confederation, count(Stadium) as Total_Stadium
from PortfolioProjects.dbo.FootballStadiums
group by Confederation
order by Total_Stadium desc

-- Insight : Knowing the distribution of stadiums across confederations provides a geographic perspective.


-- 6) Top 3 cities with the most stadiums

select TOP 3 City, count(Stadium) Total_Stadium
from PortfolioProjects.dbo.FootballStadiums
group by City
order by Total_Stadium desc

-- Insight : Understanding which cities have more stadiums could be valuable for urban planning.


-- 7) Stadiums with the smallest capacity

select TOP 1 Stadium, Capacity
from PortfolioProjects.dbo.FootballStadiums
order by Capacity asc

-- Insight : Identifying smaller stadiums may be useful for niche events or local matches.


-- 8) Countries with the highest population

select TOP 1 Country, Population
from PortfolioProjects.dbo.FootballStadiums
order by Population desc

-- Insight*: Linking population data to stadiums could be useful for marketing and event planning.


-- 9) Stadiums with no home teams

select Stadium
from PortfolioProjects.dbo.FootballStadiums
where HomeTeams = 'NULL'

-- Insight*: Identifying stadiums without assigned home teams could indicate potential data issues.


-- 10) Number of stadiums per IOC code

select IOC, count(Stadium) AS Total_Stadium
from PortfolioProjects.dbo.FootballStadiums
group by IOC
order by Total_Stadium desc

-- Insight : Examining the distribution of stadiums by IOC code provides a geopolitical perspective.


-- 11) List of cities where multiple stadiums exist

select City, count(Stadium) as Total_Stadium
from PortfolioProjects.dbo.FootballStadiums
group by city
having count(Stadium) > 1
order by Total_Stadium desc

-- Insight : Recognizing cities with multiple stadiums may be essential for logistical planning.


-- 12) Stadiums in countries belonging to a specific confederation

select Confederation,Stadium
from PortfolioProjects.dbo.FootballStadiums
where Confederation = 'UEFA'

-- Insight*: Focusing on stadiums within a specific confederation can provide targeted insights.


-- 13) Stadiums in cities with a population over 1 million:
select Stadium, City, Populations
from PortfolioProjects.dbo.FootballStadiums
where Populations > 1000000

-- Insight : Understanding the relationship between stadium locations and city populations.


-- 14) Stadiums with the highest and lowest capacities in each country

select distinct country, max(Capacity) as Highest, min(Capacity) as Lowest
from PortfolioProjects.dbo.FootballStadiums
group by Country
order by Country asc

-- Insight : Provides a range of capacities within each country.


-- 15) Countries with stadiums and their average stadium capacity

select country, avg(Capacity) as Average_Capacity
from PortfolioProjects.dbo.FootballStadiums
group by country
order by country asc

-- Insight*: Understanding the average stadium capacity in each country.


-- 16) Stadiums with capacity between 20,000 and 30,000

select Stadium, Capacity
from PortfolioProjects.dbo.FootballStadiums
where Capacity between 20000 and 30000
order by Capacity desc

-- Insight : Identifying mid-sized stadiums for specific event planning.


-- 17) Top 5 countries with the highest average stadium capacity:

select top 5 Country, avg(Capacity) as Average_Capacity
from PortfolioProjects.dbo.FootballStadiums
group by Country
order by Average_Capacity desc

-- Insight : Identifying countries with larger-than-average stadiums.


-- 18 ) Stadiums with no capacity information

select Stadium
from PortfolioProjects.dbo.FootballStadiums
where Capacity is NULL

-- Insight : Identifying potential data quality issues related to missing capacity information.


-- 19) Number of stadiums in each city, sorted by the number of stadiums

select City, count(Stadium) as Total_Stadium
from PortfolioProjects.dbo.FootballStadiums
group by City
order by Total_Stadium desc

-- Insight : Understanding the distribution of stadiums across cities.


-- 20) Average stadium capacity in each confederation

select Confederation, avg(capacity) as Average_Capacity
from PortfolioProjects.dbo.FootballStadiums
group by Confederation
order by Average_Capacity

-- Insight : Understanding the average size of stadiums in different confederations.


-- 21) Stadiums with a capacity higher than the average capacity

select Stadium, Capacity
from PortfolioProjects.dbo.FootballStadiums
where Capacity > (select avg(Capacity)from PortfolioProjects.dbo.FootballStadiums)
group by Stadium, Capacity

-- Insight : Identifying stadiums with above-average capacity.


-- 22) Find the average capacity of stadiums in a specific city and their Home Teams:

select Stadium, HomeTeams
from PortfolioProjects.dbo.FootballStadiums
where City = 'Barcelona'

-- Insight : Helps to understand the average stadium capacity in different cities and their Home Teams


