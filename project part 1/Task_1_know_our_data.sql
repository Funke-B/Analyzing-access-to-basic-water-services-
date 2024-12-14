/*Get to know our data:
Start by retrieving the first few records from each table. How many tables are there in our database? What are the names of these tables? Once you've identified the tables, write a SELECT statement to retrieve the first five records from each table. As you look at the
data, take note of the columns and their respective data types in each table. What information does each table contain?*/

SELECT *
FROM employee
LIMIT 5;
SELECT 
    *
FROM location    
LIMIT 10;
SELECT DISTINCT type_of_water_source
FROM water_source;
SELECT *
FROM water_quality
LIMIT 5;
SELECT *
FROM well_pollution
LIMIT 5;
