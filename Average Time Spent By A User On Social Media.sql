--- Average Time Spent by Gender ---

select avg(time_spent) as AverageTimeSpent, gender
from avg_soc_data
group by gender

--- his query helps understand if there are differences in social media usage patterns between genders.---


--- Time Spent by Age Group ---

SELECT 
    age_group,
    AVG(time_spent) AS avg_time_spent
FROM (
    SELECT 
        CASE
            WHEN age < 18 THEN 'Under 18'
            WHEN age BETWEEN 18 AND 24 THEN '18-24'
            WHEN age BETWEEN 25 AND 34 THEN '25-34'
            WHEN age BETWEEN 35 AND 44 THEN '35-44'
            WHEN age BETWEEN 45 AND 54 THEN '45-54'
            ELSE '55+'
        END AS age_group,
        time_spent
    FROM avg_soc_data
) AS grouped_data
GROUP BY age_group
order by age_group

--- Analyzing time spent by different age groups can reveal trends in social media usage among different demographics. ---


--- Time Spent by Platform ---

select platform, sum(time_spent) as total_time_spent
from avg_soc_data
group by platform
order by total_time_spent desc

--- This query helps identify which social media platforms are most popular among users in terms of time spent. ---


--- Time Spent by Profession ---

select Profession, sum(time_spent) as total_time_spent
from avg_soc_data
group by profession
order by total_time_spent desc

--- Understanding the relationship between profession and social media usage can provide insights into how different occupations utilize these platforms.---


--- Time Spent by Income Level --- 
select income_level, sum(time_spent) as total_time_spent
from (
		select
			case
				when income < 12000 then 'Low Level'
				when income between 12000 and 15000 then 'Medium Level'
				else 'High Level'
		end as income_level, time_spent
		from avg_soc_data
) as grouped_income
group by income_level
order by total_time_spent desc

--- Examining time spent based on income levels can indicate if there's a correlation between income and social media usage intensity.---


--- Time Spent by Country ---

select location, sum(time_spent) as total_time_spent
from avg_soc_data
group by location

--- Analyzing time spent by country provides insights into regional variations in social media usage patterns. ---


--- Average Time Spent by Demographics ---

select demographics, avg(time_spent) as avg_time_spent
from avg_soc_data
group by demographics

--- Understanding time spent based on demographic areas can reveal differences in usage patterns between urban, suburban, and rural users. ---


--- Time Spent by Interests ---

select interests, sum(time_spent) as total_time_spent
from avg_soc_data
group by interests

--- This query helps identify if there are specific interests or hobbies that correlate with increased social media usage. ---


--- Time Spent by Debt Status ---

select indebt, sum(time_spent) as total_time_spent
from avg_soc_data
group by indebt

--- Analyzing time spent based on debt status can indicate whether financial concerns impact social media usage habits. ---


--- Time Spent by Homeownership ---

select isHomeOwner, sum(time_spent) as total_time_spent
from avg_soc_data
group by isHomeOwner

--- This query helps understand if homeowners and renters have different social media usage patterns.---


--- Time Spent by Car Ownership ---

select Owns_Car, sum(time_spent) as total_time_spent
from avg_soc_data
group by Owns_Car

--- Examining time spent based on car ownership status can reveal potential correlations between lifestyle and social media habits---


--- Time Spent on Each Platform by Age Group ---

select age_group, platform, sum(time_spent) as total_spent_time
from (
		select
			case
				when age < 18 then 'Under 18'
				when age between 18 and 24 then '18-24'
				when age between 25 and 34 then '25-34'
				when age between 35 and 44 then '35-44'
				when age between 45 and 54 then '45-54'
				else '55+'
		end as age_group, platform, time_spent
		from avg_soc_data
) as age_grouped
group by age_group, platform
order by age_group

--- Analyzing time spent on each platform by age group can reveal preferences among different demographics.---


--- Time Spent by Gender and Income Level ---

select income_level, gender, sum(time_spent) as total_time_spent
from (
		select
			case 
				when income < 12000 then 'Low Level'
				when income between 12000 and 15000 then 'Medium Level'
				else 'High Level'
		end as income_level, gender, time_spent
		from avg_soc_data
) as income_level
group by gender, income_level
order by total_time_spent

--- Analyzing time spent by both gender and income level can reveal intersections between different demographic factors. ---


--- Average Time Spent by Social Media Platform ---

select platform, avg(time_spent) as avg_time_spent
from avg_soc_data
group by platform

--- Rationale: To identify which social media platform users spend the most time on. ---


--- Average Time Spent by Profession ---

select profession, avg(time_spent) as avg_time_spent
from avg_soc_data
group by profession

--- Rationale: To understand if there is a correlation between profession and time spent on social media. ---


--- Average Time Spent by Income Group ---

select income_group, avg(time_spent) as avg_time_spent
from(
	select
		case
			when income < 12000 then 'Low Level'
			when income between 12000 and 15000 then 'Medium Level'
			else 'High Level'
	end as income_group, time_spent
	from avg_soc_data
) as income_group
group by income_group
order by income_group

--- Rationale: To analyze how income levels relate to time spent on social media. ---


--- Average Time Spent by Home Ownership ---

select avg(time_spent) as avg_time_spent
from avg_soc_data
where isHomeOwner = 'True'

--- Rationale: To see if home ownership status affects time spent on social media. ---


--- Average Time Spent by Car Ownership ---

select avg(time_spent) as avg_time_spent
from avg_soc_data
where Owns_Car = 'True'

--- Rationale: To understand if owning cars correlates with time spent on social media. ---


--- Average Time Spent by Debt Status ---

select indebt, avg(time_spent) as avg_time_spent
from avg_soc_data
group by indebt

--- Rationale: To see if being in debt affects time spent on social media.---


--- Average Time Spent by Demographics ---

select demographics, avg(time_spent) as avg_time_spent
from avg_soc_data
group by demographics

--- Rationale: To analyze how the type of area a user resides in influences time spent on social media.---


--- Average Time Spent by Interests ---

select interests, avg(time_spent) as avg_time_spent
from avg_soc_data
group by interests

--- Rationale: To see if users' interests impact their time spent on social media.---


--- Percentage of Users in Debt ---

select indebt, count(*)*100/(select count(*) from avg_soc_data) as percentage
from avg_soc_data
group by indebt

--- Rationale: To understand the proportion of users who are in debt.---


--- Percentage of Homeowners ---

select isHomeOwner, count(*)*100/(select count(*) from avg_soc_data) as percentage
from avg_soc_data
group by isHomeOwner

--- Rationale: To analyze the percentage of users who own a home.---


--- Percentage of Male, Female, and Non-binary Users ---

select gender, count(*)*100/(select count(*) from avg_soc_data) as percentage
from avg_soc_data
group by gender

--- Rationale: To understand the distribution of gender identities among users ---


--- Average Time Spent by Gender and Age Group ---

select gender, age_group, avg(time_spent) as avg_time_spent
from (
		select
			case
				when age < 18 then 'Under 18'
				when age between 18 and 24 then '18-24'
				when age between 25 and 34 then '25-34'
				when age between 35 and 44 then '35-44'
				when age between 45 and 54 then '45-54'
		else 'Above 55'
		end as age_group, gender, time_spent
		from avg_soc_data
) as age_group
group by gender, age_group
order by age_group

--- Rationale: To analyze how time spent on social media varies across gender and age groups.---


--- Percentage of Users in Urban, Suburban, and Rural Areas ---

select demographics, count(*)*100/(select count(*) from avg_soc_data) as percentage
from avg_soc_data
group by demographics

--- Rationale: To understand the distribution of users across different types of areas.---


--- Average Time Spent by Gender and Country ---

select location, gender, avg(time_spent) as avg_time_spent
from avg_soc_data
group by location, gender
order by location, gender

--- Rationale: To analyze how time spent on social media varies across gender and countries ---


--- Percentage of Users with Car Ownership ---

select Owns_Car, count(*)*100/(select count(*) from avg_soc_data) as percentage
from avg_soc_data
group by Owns_Car

--- Rationale: To understand the proportion of users who own cars.---


--- Average Time Spent by Gender and Profession ---

select profession, gender, avg(time_spent) as avg_time_spent
from avg_soc_data
group by gender, profession
order by profession

--- Rationale: To analyze how time spent on social media varies across gender and professions.---


--- Average Time Spent by Gender and Income Group ---

select gender, income_group, avg(time_spent) as avg_time_spent
from (
		select
			case
				when income < 12000 then 'Low Level'
				when income between 12000 and 15000 then 'Medium Level'
				else 'High Level'
		end as income_group, gender, time_spent
		from avg_soc_data
) as age_group
group by income_group, gender
order by gender
		
---     Rationale: To analyze how time spent on social media varies across gender and income groups. ---


--- Percentage of Users by Gender and Debt Status ---

select gender, indebt, count(*)*100/(select count(*) from avg_soc_data) as percentage
from avg_soc_data
group by gender, indebt

--- Rationale: To understand the distribution of debt status among different genders.---


--- Average Time Spent by Gender and Home Ownership ---

select gender, isHomeOwner, avg(time_spent) as avg_time_spent
from avg_soc_data
group by gender, isHomeOwner

--- Rationale: To analyze how time spent on social media varies across gender and home ownership status.


--- Average Time Spent by Age Group and Interests ---

select age_group, interests, avg(time_spent) as avg_time_spent
from (
		select
			case
				when age < 18 then 'Under 18'
				when age between 18 and 24 then '18-24'
				when age between 25 and 34 then '25-34'
				when age between 35 and 44 then '35-44'
				when age between 45 and 54 then '45-54'
			else 'Above 55'
		end as age_group, interests, time_spent
		from avg_soc_data
) as age_group
group by age_group, interests
order by age_group, interests

--- Rationale: To analyze how time spent on social media varies across age groups and interests.---


--- Average Time Spent by Gender and Demographics ---

select demographics, gender, avg(time_spent) as avg_time_spent
from avg_soc_data
group by demographics,gender
order by demographics, gender

--- Rationale: To analyze how time spent on social media varies across gender and types of areas.---


--- Percentage of Users by Gender and Home Ownership ---

select gender, isHomeOwner, count(*)*100/(select count(*) from avg_soc_data) as percentage
from avg_soc_data
group  by gender, isHomeOwner

--- Rationale: To understand the distribution of home ownership status among different genders.---


--- Average Time Spent by Gender and Country, Only for Users in Debt ---

select location, gender, indebt, avg(time_spent) as avg_time_spent
from avg_soc_data
where indebt = 'True'
group by location, gender, indebt
order by location, gender

--- Rationale: To analyze how time spent on social media varies across gender and countries specifically for users in debt.---

