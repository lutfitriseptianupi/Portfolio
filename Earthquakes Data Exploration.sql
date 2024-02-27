--- Dataset Column :
--- Place: The name of the location where synthetic seismic activity is recorded.
--- Latitude: The geographical coordinate specifying the north-south position of the synthetic earthquake epicenter.
--- Longitude: The geographical coordinate specifying the east-west position of the synthetic earthquake epicenter.
--- Country: The country in which the synthetic seismic event occurred.
--- Continent:The continent to which the synthetic location belongs.
--- Magnitude: The magnitude of the synthetic earthquake, providing a measure of its intensity.


--- Calculate the total number of earthquakes.

select count(*) as total_earthquakes
from earthquake_dataset

--- Reasoning: Understanding the total number of data points available.


--- Find the top 3 country with the highest number of earthquakes.

select top 3 Country, count(*) as total_earthquakes
from earthquake_dataset
group by Country
order by total_earthquakes desc

--- Reasoning: Identifying the country most frequently affected by earthquakes.


--- Calculate the average magnitude of earthquakes.

select avg(Magnitude) as average_magnitude
from earthquake_dataset

--- Reasoning: Understanding the average intensity of earthquakes in the dataset.


--- Find top 5 location with the strongest earthquake.

select top 5 Country, Magnitude
from earthquake_dataset
group by Country, Magnitude
order by Magnitude desc

--- Reasoning: Identifying the location with the highest magnitude earthquake.


--- Analyze the distribution of earthquake magnitudes.

select Magnitude, count(*) as Frequency
from earthquake_dataset
group by Magnitude
order by Magnitude

--- Reasoning: Investigating the distribution of earthquake intensities across magnitude ranges.


--- Find the continent with the highest number of earthquakes.

select Continent, count(*) as total_earthquakes
from earthquake_dataset
group by Continent
order by Continent

--- Reasoning: Identifying the continent most frequently affected by earthquakes.


--- Examine the relationship between magnitude and earthquake location.

select Country, Magnitude
from earthquake_dataset
order by Magnitude desc

--- Reasoning: Exploring if there are patterns between location and earthquake intensity.


--- Find the geographic coordinates for the largest earthquake.

select Latitude, Longitude, Magnitude
from earthquake_dataset
order by Magnitude desc

--- Reasoning: Determining the geographical location of the strongest earthquake.


--- Analyze the correlation between magnitude and country.

select Country, avg(Magnitude) as avg_magnitude
from earthquake_dataset
group by Country, Magnitude
order by Magnitude desc

--- Reasoning: Investigating if there are countries with higher average earthquake magnitudes.


--- Find the country with the highest earthquake magnitude.

select top 1 Country, Magnitude
from earthquake_dataset
group by Country, Magnitude
order by Magnitude desc

--- Reasoning: Identifying the country with the maximum earthquake magnitude.


--- Analyze the geographical distribution of earthquakes.

select Longitude, Latitude
from earthquake_dataset

--- Reasoning: Visualizing the distribution of earthquake coordinates on a map.


--- Find the country with the least number of earthquakes.

select top 1 Country, count(*) as total_earthquakes
from earthquake_dataset
group by Country
order by total_earthquakes asc

--- Reasoning: Identifying the country with the least occurrence of earthquakes.


--- Determine if there is a correlation between location and earthquake magnitude.

SELECT Country, AVG(Magnitude) AS average_magnitude
FROM earthquake_dataset
GROUP BY Country
ORDER BY average_magnitude 

--- Reasoning: Investigating if there are patterns between location and earthquake intensity.


--- Find the country with the highest number of earthquakes in the Americas.

select  Continent, Country, count(*) as total_earthquakes
from earthquake_dataset
where Continent LIKE '%America%'
group by Country, Continent
order by Continent

--- Reasoning: Focusing on a specific continent to understand earthquake distribution.


--- Find the country with the highest earthquake magnitude in Asia.

select Country, Continent, Magnitude
from earthquake_dataset
where Continent = 'Asia'
group by Country, Continent, Magnitude
order by Magnitude desc

--- Reasoning: Focusing on a specific continent to identify maximum earthquake intensity.


--- Analyze earthquake magnitudes in countries with over 100 earthquakes.

select Country, count(Magnitude) as total_earthquakes
from earthquake_dataset
group by Country
having count(*) > 50

--- Reasoning: Focusing on countries with significant samples for further analysis.


--- Analyze earthquake magnitudes in countries with over 100 earthquakes.

SELECT Latitude, AVG(Magnitude) AS average_magnitude
FROM earthquake_dataset
GROUP BY Latitude
ORDER BY Latitude

--- Reasoning: Investigating if there is a relationship between geographic location and earthquake intensity.


--- Find the number of earthquakes on each continent.

SELECT Continent, COUNT(*) AS total_earthquakes
FROM earthquake_dataset
GROUP BY Continent
ORDER BY total_earthquakes DESC

--- Reasoning: Understanding the distribution of earthquakes across continents.


--- Find the average magnitude of earthquakes on each continent.

SELECT Continent, AVG(Magnitude) AS average_magnitude
FROM earthquake_dataset
GROUP BY Continent
ORDER BY average_magnitude DESC

--- Reasoning: Comparing earthquake intensities among continents.


--- Find the country with the highest earthquake magnitude in Europe.

SELECT Country, MAX(Magnitude) AS max_magnitude
FROM earthquake_dataset
WHERE Continent = 'Europe'
GROUP BY Country
ORDER BY max_magnitude desc

--- Reasoning: Focusing on a specific continent to identify maximum earthquake intensity.


--- Find the average magnitude of earthquakes in each country.

SELECT Country, AVG(Magnitude) AS average_magnitude
FROM earthquake_dataset
GROUP BY Country
ORDER BY Country ASC

--- Reasoning: Comparing earthquake intensities among countries.


--- Find the country with the highest number of earthquakes on each continent.

SELECT Continent, Country, COUNT(*) AS total_earthquakes
FROM earthquake_dataset
GROUP BY Continent, Country
ORDER BY total_earthquakes DESC

--- Reasoning: Gaining a deeper understanding of earthquake distribution across various continents.


--- Find the correlation between magnitude and country in the Americas.

SELECT Country, AVG(Magnitude) AS average_magnitude
FROM earthquake_dataset
WHERE Continent LIKE'%America%'
GROUP BY Country
ORDER BY Country ASC

--- Reasoning: Analyzing earthquake intensities in American countries.


--- Conclusion from Data Exploration:
--- Through SQL analysis, we were able to identify patterns and trends in the synthetic earthquake dataset. 
--- We found that some countries and continents are more vulnerable to earthquakes than others, and there is significant variation in earthquake magnitudes worldwide. 
--- Additionally, we observed a correlation between geographic location and earthquake intensity, with certain regions more prone to experiencing higher magnitude earthquakes than others. 
--- This analysis can help in understanding and mitigating earthquake-related risks in the future.


