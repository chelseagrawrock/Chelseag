---average ride length

SELECT usertype AS member_casual,
       AVG(DATEDIFF(MINUTE, CAST(starttime AS DATETIME), CAST(stoptime AS DATETIME))) AS avg_ride_duration_minutes
FROM dbo.['Divvy_Trips_2015-Q1$']
GROUP BY usertype;

---total number of rides by member type per day of the week

SELECT usertype AS member_casual,
       DATENAME(WEEKDAY, CAST(starttime AS DATETIME)) AS day_of_week,
       COUNT(trip_id) AS total_rides
FROM dbo.['Divvy_Trips_2015-Q1$']
GROUP BY usertype, DATENAME(WEEKDAY, CAST(starttime AS DATETIME))
ORDER BY usertype, total_rides DESC;

--max and min ride duration by member type

SELECT usertype AS member_casual,
       MAX(DATEDIFF(MINUTE, CAST(starttime AS DATETIME), CAST(stoptime AS DATETIME))) AS max_ride_duration_minutes,
       MIN(DATEDIFF(MINUTE, CAST(starttime AS DATETIME), CAST(stoptime AS DATETIME))) AS min_ride_duration_minutes
FROM dbo.['Divvy_Trips_2015-Q1$']
GROUP BY usertype;

--total ride count by user type

SELECT usertype AS member_casual,
       COUNT(trip_id) AS total_trips
FROM dbo.['Divvy_Trips_2015-Q1$']
GROUP BY usertype;

--average ride duration by day of the week and user type

SELECT usertype AS member_casual,
       DATENAME(WEEKDAY, CAST(starttime AS DATETIME)) AS day_of_week,
       AVG(DATEDIFF(MINUTE, CAST(starttime AS DATETIME), CAST(stoptime AS DATETIME))) AS avg_ride_duration_minutes
FROM dbo.['Divvy_Trips_2015-Q1$']
GROUP BY usertype, DATENAME(WEEKDAY, CAST(starttime AS DATETIME))
ORDER BY usertype, day_of_week;


--total ride duration by user type

SELECT usertype AS member_casual,
       SUM(DATEDIFF(MINUTE, CAST(starttime AS DATETIME), CAST(stoptime AS DATETIME))) AS total_ride_duration_minutes
FROM dbo.['Divvy_Trips_2015-Q1$']
GROUP BY usertype;

--Top 10 Start and End Stations by User Type

SELECT 
from_station_name,
COUNT (*) as total_rides,
usertype
FROM dbo.['Divvy_Trips_2015-Q1$']
GROUP BY from_station_name, usertype
ORDER BY usertype, total_rides DESC
LIMIT 10;


SELECT 
to_station_name,
COUNT (*) as total_rides,
usertype
FROM dbo.['Divvy_Trips_2015-Q1$']
GROUP BY to_station_name, usertype
ORDER BY usertype, total_rides DESC
LIMIT 10;
