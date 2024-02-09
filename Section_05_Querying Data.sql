-- select specific columns

SELECT first_name FROM actors

SELECT first_name,last_name FROM actors

SELECT movie_name, movie_lang FROM movies

--use ALIAS

SELECT 
	movie_name AS "Movie Name", 
	movie_lang AS "Language" 
FROM movies;

--using SELECT for regular expressions

SELECT first_name || last_name FROM actors;

--get regular expression output without using a column name

SELECT 20/10;

--use ORDER BY

SELECT *
FROM movies
ORDER BY
release_date ASC;

--use ORDER BY for multiple colums

SELECT *
FROM movies
ORDER BY
age_certificate ASC,
movie_id ASC;

--use ORDER BY to sort rows by expressions

SELECT 
	first_name,
	LENGTH(first_name)
FROM actors;

SELECT 
	first_name,
	LENGTH(first_name) AS len
FROM actors
ORDER BY 
len DESC

--use column number instead of name

SELECT
	first_name,
	last_name,
	date_of_birth
FROM actors
ORDER BY
	1 ,
	3 DESC;

--use DISTINCT

SELECT 
	DISTINCT movie_lang 
FROM movies
ORDER BY 1;

--multiple columns

SELECT
	DISTINCT movie_lang, director_id
FROM movies
ORDER BY 1;

--using ORDER BY with NULL values

CREATE TABLE demo_sorting(
	num INT
);

INSERT INTO demo_sorting
VALUES
(1),
(2),
(3),
(NULL);

SELECT *
FROM demo_sorting
ORDER BY num NULLS FIRST;

SELECT *
FROM demo_sorting
ORDER BY num DESC NULLS LAST;

DROP TABLE demo_sorting
