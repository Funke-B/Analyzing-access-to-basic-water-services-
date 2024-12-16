USE md_water_services;
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
/*2. Dive into the water sources:
Now that you're familiar with the structure of the tables, let's dive deeper. We need to understand the types of water sources we're
dealing with. Can you figure out which table contains this information?
10:00
Once you've identified the right table, write a SQL query to find all the unique types of water sources.*/
SELECT DISTINCT type_of_water_source
FROM water_source;


/*3. Unpack the visits to water sources:
We have a table in our database that logs the visits made to different water sources. Can you identify this table?
10:44
Write an SQL query that retrieves all records from this table where the time_in_queue is more than some crazy time, say 500 min. How
would it feel to queue 8 hours for water?*/
SELECT *
FROM visits
WHERE time_in_queue =0;

/* I am wondering what type of water sources take this long to queue for. We will have to find that information in another table that lists
the types of water sources. If I remember correctly, the table has type_of_water_source, and a source_id column. So let's write
down a couple of these source_id values from our results, and search for them in the other table.
AkKi00881224
SoRu37635224
SoRu36096224
If we just select the first couple of records of the visits table without a WHERE filter, we can see that some of these rows also have 0
mins queue time. So let's write down one or two of these too.*/

SELECT * FROM visits;

SELECT *
FROM water_source
WHERE source_id IN ('AkHa00036224','AkRu04862224','AmAs10911224','AkRu05603224');

/* Assess the quality of water sources: The quality of water sources is a pretty big deal. We'll turn to the water_quality table to
find records where the subjective_quality_score is within a certain range and the visit_count is above a certain threshold. This
should help us spot the water sources that are frequently visited and have a decent quality score.*/
SELECT *
FROM water_quality
WHERE subjective_quality_score = 10 AND visit_count =2;

/*. Investigate any pollution issues: We can't overlook the pollution status of our water sources. Let's find those water sources where
the pollution_tests result came back as 'dirty' or 'biologically contaminated'. This will help us flag the areas that need immediate attention.
*/

SELECT *
FROM well_pollution
LIMIT 5;

SELECT *
FROM well_pollution WHERE description like "&clean&" OR (results ='clean'  AND biological > 0.01);

/*UPDATE Update well_pollution table
SET Change description to'Bacteria: E. coli'
WHERE Where the description is `Clean Bacteria: E. coli` Change description to'Bacteria: E. coli'*/

UPDATE well_pollution
SET description = 'Bacterial: E.coli' 
WHERE description = 'Clean Bacteria: E. coli';

SET SQL_SAFE_UPDATES = 0;


UPDATE well_pollution
SET description = ' Bacteria: Giardia Lamblia'
WHERE description = 'Clean Bacteria: Giardia Lamblia';

UPDATE well_pollution
SET results = 'contaminated: Biological'
WHERE biological  > 0.01 AND results = "clean";




    
    SELECT 
    *
FROM
    water_source
    ORDER BY number_of_people_served desc;
    select *
    from data_dictionary
    where column_name = 'pop_n';


/*Which SQL query returns records of employees who are Civil Engineers residing in Dahabu or living on an avenue?*/
SELECT *
FROM employees
WHERE position = 'Civil Engineer'
AND (city = 'Dahabu' OR address LIKE '%Avenue%');


/*Create a query to identify potentially suspicious field workers based on an anonymous tip. This is the description we are given:

The employee’s phone number contained the digits 86 or 11. 
The employee’s last name started with either an A or an M. 
The employee was a Field Surveyor.*/

  
  SELECT *
FROM employee
WHERE position = 'Field Surveyor'
AND (phone_number LIKE '%86%' OR phone_number LIKE '%11%')
AND (employee_name LIKE 'A%' OR employee_name LIKE 'M%');

SELECT *
FROM well_pollution
WHERE description LIKE 'Clean_%' OR results = 'Clean' AND biological < 0.01;

SELECT * 
FROM well_pollution
WHERE description
IN ('Parasite: Cryptosporidium', 'biologically contaminated')
OR (results = 'Clean' AND biological > 0.01);

SELECT *
FROM well_pollution
WHERE description LIKE 'Clean_%' OR results = 'Clean' AND biological < 0.01;

SELECT * FROM water_source WHERE source_id IN ( 'SoRu35083224', 'SoKo33124224','KiRu26095224','KiRu28935224','AkLu01628224');
SELECT 
    *
FROM
    employee
WHERE
    position = 'micro biologist';