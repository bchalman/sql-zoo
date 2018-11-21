------- 0: SELECT basics

-- 1 Show the population of Germany
  SELECT population FROM world
    WHERE name = 'Germany';

-- 2 Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
  SELECT name, population FROM world
    WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3 Show the country and the area for countries with an area between 200,000 and 250,000.
  SELECT name, area FROM world
    WHERE area BETWEEN 200000 AND 250000;


------- 1: SELECT names

-- 1 Find the country that start with Y
  SELECT name FROM world
    WHERE name LIKE 'Y%';

-- 2 Find the countries that end with y
  SELECT name FROM world
    WHERE name LIKE '%Y';

-- 3 Find the countries that contain the letter x
  SELECT name FROM world
    WHERE name LIKE '%X%';

-- 4 Find the countries that end with land
  SELECT name FROM world
    WHERE name LIKE '%land';

-- 5 Find the countries that start with C and end with ia
  SELECT name FROM world
    WHERE name LIKE 'C%' AND   name LIKE '%ia';

-- 6 Find the country that has oo in the name
  SELECT name FROM world
    WHERE name LIKE '%oo%'

-- 7 Find the countries that have three or more a in the name
  SELECT name FROM world
    WHERE name LIKE '%a%a%a%';

-- 8 Find the countries that have "t" as the second character.
  SELECT name FROM world
   WHERE name LIKE '_t%'

-- 9 Find the countries that have two "o" characters separated by two others.
  SELECT name FROM world
   WHERE name LIKE '%o__o%';

-- 10 Find the countries that have exactly four characters.
  SELECT name FROM world
   WHERE name LIKE '____';

-- 11 Find the country where the name is the capital city.
  SELECT name FROM world
    WHERE name = capital;

-- 12 Find the country where the capital is the country plus "City".
  SELECT name FROM world
   WHERE capital = concat(name, ' City');

-- 13 Find the capital and the name where the capital includes the name of the country.
  SELECT capital, name FROM world
    WHERE capital LIKE concat('%', name, '%');

-- 14 Find the capital and the name where the capital is an extension of name of the country.
  SELECT capital, name FROM world
    WHERE capital LIKE Concat(name, '_%');

-- 15 Show the name and the extension where the capital is an extension of name of the country.
  SELECT name, REPLACE(capital, name, '') FROM world
    WHERE capital LIKE concat(name, '_%');


------- 2: SELECT from WORLD tutorial

-- 1 show the name, continent and population of all countries.
  SELECT name, continent, population FROM world;

-- 2 Show the name for the countries that have a population of at least 200 million.
  SELECT name FROM world
    WHERE population > 200000000;

-- 3 Give the name and the per capita GDP for those countries with a population of at least 200 million.
  SELECT name, gdp/population FROM world
    WHERE population > 200000000;

-- 4 Show the name and population in millions for the countries of the continent 'South America'.
  SELECT name, population/1000000 FROM world
    WHERE continent = 'South America';

-- 5 Show the name and population for France, Germany, Italy
  SELECT name, population FROM world
    WHERE name IN ('France', 'Germany', 'Italy');

-- 6 Show the countries which have a name that includes the word 'United'
  SELECT name FROM world
    WHERE name LIKE '%United%';

-- 7 Show the countries that are big by area or big by population. Show name, population and area.
  SELECT name, population, area FROM world
    WHERE area > 3000000 OR population > 250000000;

-- 8 Exclusive OR (XOR). Show the countries that are big by area or big by population but not both. Show name, population and area.
  SELECT name, population, area FROM world
    WHERE area > 3000000 XOR population > 250000000;

-- 9 For South America show population in millions and GDP in billions both to 2 decimal places.
  SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world
    WHERE continent = 'South America';

-- 10 Show per-capita GDP for the trillion dollar countries to the nearest $1000.
  SELECT name, ROUND(gdp/population, -3) FROM world
    WHERE gdp >= 1000000000000;

-- 11 Show the name and capital where the name and the capital have the same number of characters
  SELECT name, capital FROM world
    WHERE LENGTH(name) = LENGTH(capital);

-- 12 Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
  SELECT name, capital FROM world
    WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital;

-- 13 Find the country that has all the vowels and no spaces in its name.
  SELECT name FROM world
    WHERE name LIKE '%a%' AND   name LIKE '%e%'
    AND   name LIKE '%i%' AND   name LIKE '%o%'
    AND   name LIKE '%u%' AND   name NOT LIKE '% %';


------- 3: SELECT from Nobel -- Table: nobel(yr, subject, winner)

-- 1 Change the query shown so that it displays Nobel prizes for 1950.
  SELECT yr, subject, winner FROM nobel
    WHERE yr = 1950;

-- 2 Show who won the 1962 prize for Literature.
  SELECT winner FROM nobel
   WHERE yr = 1962 AND subject = 'Literature';

-- 3 Show the year and subject that won 'Albert Einstein' his prize.
  SELECT yr, subject FROM nobel
    WHERE winner = 'Albert Einstein';

-- 4 Give the name of the 'Peace' winners since the year 2000, including 2000.
  SELECT winner FROM nobel
    WHERE subject = 'Peace' AND yr >= 2000;

-- 5 Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
  SELECT * FROM nobel
    WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;

-- 6 Show all details of the presidential winners: Theodore Roosevelt, Woodrow Wilson, Jimmy Carter, Barack Obama
  SELECT * FROM nobel
   WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

-- 7 Show the winners with first name John
  SELECT winner FROM nobel
    WHERE winner LIKE 'John%';

-- 8 Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
  SELECT * FROM nobel
    WHERE (subject = 'Physics' AND yr = 1980)
    OR    (subject = 'Chemistry' AND yr = 1984);

-- 9 Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
  SELECT * FROM nobel
    WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');

-- 10 Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910)
--    together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
  SELECT * FROM nobel
    WHERE (subject = 'Medicine' AND yr < 1910)
    OR    (subject = 'Literature' AND yr >= 2004);

-- 11 Find all details of the prize won by PETER GRÜNBERG
  SELECT * FROM nobel
    WHERE winner = 'Peter Grünberg';

-- 12 Find all details of the prize won by EUGENE O'NEILL
  SELECT * FROM nobel
    WHERE winner = 'Eugene O''Neill';

-- 13 List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
  SELECT winner, yr, subject FROM nobel
    WHERE winner LIKE 'Sir%'
    ORDER BY yr DESC, winner;

-- 14 Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
  SELECT winner, subject FROM nobel
   WHERE yr=1984
   ORDER BY subject IN ('Chemistry', 'Physics'), subject,winner;


------- 4: SELECT within SELECT -- Table: world(name, continent, area, population, gdp)

-- 1 List each country name where the population is larger than that of 'Russia'.
  SELECT name FROM world
    WHERE population >
     (SELECT population FROM world
        WHERE name='Russia');

-- 2 Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
  SELECT name FROM world
    WHERE continent = 'Europe' AND gdp/population >
      (SELECT gdp/population FROM world
        WHERE name = 'United Kingdom');

-- 3 List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
  SELECT name, continent FROM world
    WHERE continent IN
      (SELECT continent FROM world
        WHERE name IN ('Argentina', 'Australia'))
    ORDER BY name;

-- 4 Which country has a population that is more than Canada but less than Poland? Show the name and the population.
  SELECT name, population FROM world
    WHERE population > (SELECT population FROM world WHERE name = 'Canada')
    AND   population < (SELECT population FROM world WHERE name = 'Poland');

-- 5 Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
  SELECT name, CONCAT(ROUND(population / (SELECT population FROM world WHERE name = 'Germany') * 100), '%') FROM world
    WHERE continent = 'Europe';

-- 6 Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
  SELECT name FROM world
    WHERE gdp > ALL(SELECT gdp FROM world WHERE gdp > 0 AND continent = 'Europe');

-- 7 Find the largest country (by area) in each continent, show the continent, the name and the area:
  SELECT continent, name, area FROM world x
    WHERE area >= ALL
      (SELECT area FROM world y
          WHERE y.continent=x.continent
            AND area>0)

-- 8 List each continent and the name of the country that comes first alphabetically.
  SELECT continent, name FROM world x
    WHERE name <= ALL
      (SELECT name FROM world y
        WHERE y.continent = x.continent);

-- 9 Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents.
--   Show name, continent and population.
  SELECT name, continent, population FROM world
    WHERE continent NOT IN
      (SELECT DISTINCT continent FROM world
        WHERE population > 25000000);

-- 10 Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
  SELECT name, continent FROM world x
    WHERE population / 3 > ALL
      (SELECT population FROM world y
        WHERE y.continent = x.continent
        AND population > 0
        AND y.name != x.name);


------ 5: SUM and COUNT -- Table: world(name, continent, area, population, gdp)

-- 1 Show the total population of the world.
  SELECT SUM(population) FROM world;

-- 2 List all the continents - just once each.
  SELECT DISTINCT continent FROM world;

-- 3 Give the total GDP of Africa
  SELECT SUM(gdp) FROM world WHERE continent = 'Africa';

-- 4 How many countries have an area of at least 1000000
  SELECT COUNT(name) FROM world WHERE area > 1000000;

-- 5 What is the total population of ('Estonia', 'Latvia', 'Lithuania')
  SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- 6 For each continent show the continent and number of countries.
  SELECT continent, COUNT(name) FROM world GROUP BY continent;

-- 7 For each continent show the continent and number of countries with populations of at least 10 million.
  SELECT continent, COUNT(name) FROM world
    WHERE population >= 10000000
    GROUP BY continent;

-- 8 List the continents that have a total population of at least 100 million
  SELECT continent FROM world
    GROUP BY continent HAVING SUM(population) >= 100000000;


------ 6: JOIN

-- 1 show the matchid and player name for all goals scored by Germany.
  SELECT matchid, player FROM goal
    WHERE teamid = 'GER';

-- 2 Show id, stadium, team1, team2 for just game 1012
  SELECT id,stadium,team1,team2 FROM game WHERE id = 1012

-- 3 show the player, teamid, stadium and mdate for every German goal.
  SELECT player, teamid, stadium, mdate FROM game
    JOIN goal ON (id=matchid)
    WHERE teamid = 'GER';

-- 4 Show the team1, team2 and player for every goal scored by a player called Mario
  SELECT team1, team2, player FROM game
    JOIN goal ON (id=matchid)
    WHERE player LIKE 'Mario%';

-- 5 Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
  SELECT player, teamid, coach, gtime FROM goal
   JOIN eteam ON (teamid = id)
    WHERE gtime<=10;

-- 6 List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
  SELECT mdate, teamname FROM game
    JOIN eteam ON  (eteam.id = team1)
    WHERE coach = 'Fernando Santos';

-- 7 List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
  SELECT player FROM goal
    JOIN game ON (id = matchid)
    WHERE stadium = 'National Stadium, Warsaw';

-- 8 show the name of all players who scored a goal against Germany.
  SELECT DISTINCT player FROM game
    JOIN goal ON matchid = id
      WHERE (team1='GER' OR team2='GER')
      AND teamid != 'GER';

-- 9 Show teamname and the total number of goals scored.
  SELECT teamname, COUNT(player) FROM eteam
    JOIN goal ON id=teamid
    GROUP BY teamname;

-- 10 Show the stadium and the number of goals scored in each stadium.
  SELECT stadium, COUNT(player) FROM game
    JOIN goal ON (matchid = id)
    GROUP BY stadium;

-- 11 For every match involving 'POL', show the matchid, date and the number of goals scored.
  SELECT matchid, mdate, COUNT(player) FROM game
    JOIN goal ON matchid = id
    WHERE (team1 = 'POL' OR team2 = 'POL')
    GROUP BY matchid, mdate;

-- 12 For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
  SELECT matchid, mdate, COUNT(player) FROM game
    JOIN goal on matchid = id
    WHERE teamid = 'GER'
    GROUP BY matchid, mdate;

-- 13 List every match with the goals scored by each team. Sort your result by mdate, matchid, team1 and team2.
  SELECT mdate,
         team1,
         SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
         team2,
         SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
    FROM game LEFT JOIN goal ON matchid = id
    GROUP BY mdate, team1, team2;


------ 7: More JOIN Operations

-- 1 List the films where the yr is 1962 [Show id, title]
  SELECT id, title FROM movie WHERE yr=1962;

-- 2 Give year of 'Citizen Kane'.
  SELECT yr FROM movie WHERE title = 'Citizen Kane';

-- 3 List all of the Star Trek movies, include the id, title and yr. Order results by year.
  SELECT id, title, yr FROM movie
    WHERE title LIKE '%Star Trek%'
    ORDER BY yr;

-- 4 What id number does the actor 'Glenn Close' have?
  SELECT id FROM actor WHERE name = 'Glenn Close';

-- 5 What is the id of the film 'Casablanca'
  SELECT id FROM movie WHERE title = 'Casablanca';

-- 6 Obtain the cast list for 'Casablanca'.
  SELECT name FROM casting
    INNER JOIN actor ON id = actorid
    WHERE movieid = 11768;

-- 7 Obtain the cast list for the film 'Alien'
  SELECT name FROM casting
    INNER JOIN actor ON casting.actorid = actor.id
    INNER JOIN movie ON casting.movieid = movie.id
    WHERE movie.title = 'Alien';

-- 8 List the films in which 'Harrison Ford' has appeared
  SELECT title FROM casting
    INNER JOIN actor ON casting.actorid = actor.id
    INNER JOIN movie ON casting.movieid = movie.id
    WHERE actor.name = 'Harrison Ford';

-- 9 List the films where 'Harrison Ford' has appeared - but not in the starring role.
  SELECT title FROM casting
    INNER JOIN actor ON casting.actorid = actor.id
    INNER JOIN movie ON casting.movieid = movie.id
    WHERE actor.name = 'Harrison Ford'
    AND   casting.ord > 1;

-- 10 List the films together with the leading star for all 1962 films.
  SELECT movie.title, actor.name FROM casting
    INNER JOIN actor ON casting.actorid = actor.id
    INNER JOIN movie ON casting.movieid = movie.id
    WHERE movie.yr = 1962
    AND   casting.ord = 1;

-- 11 for 'John Travolta', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
  SELECT yr,COUNT(title) FROM movie
    JOIN casting ON movie.id=movieid
    JOIN actor   ON actorid=actor.id
    WHERE name='John Travolta'
    GROUP BY yr HAVING COUNT(title) > 2

-- 12 List the film title and the leading actor for all of the films 'Julie Andrews' played in.
  SELECT movie.title, actor.name FROM casting
    INNER JOIN actor ON casting.actorid = actor.id
    INNER JOIN movie ON casting.movieid = movie.id
    WHERE movieid IN
      (SELECT movieid FROM casting
      INNER JOIN actor ON casting.actorid = actor.id
      INNER JOIN movie ON casting.movieid = movie.id
      WHERE actor.name IN ('Julie Andrews'))
    AND ord = 1;

-- 13 Obtain a list, in alphabetical order, of actors who've had at least 30 starring roles
  SELECT actor.name FROM casting
    INNER JOIN actor ON casting.actorid = actor.id
    INNER JOIN movie ON casting.movieid = movie.id
    WHERE ord = 1
    GROUP BY actor.name HAVING COUNT(movie.title) >= 30
    ORDER BY actor.name;

-- 14 List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
  SELECT movie.title, COUNT(actorid) FROM casting
    INNER JOIN movie ON casting.movieid = movie.id
    WHERE movie.yr = 1978
    GROUP BY movie.title
    ORDER BY COUNT(actorid) DESC, movie.title;

-- 15 List all the people who have worked with 'Art Garfunkel'.
  SELECT actor.name FROM casting
    INNER JOIN actor ON casting.actorid = actor.id
    WHERE movieid IN
      (SELECT movieid FROM casting
      INNER JOIN actor ON casting.actorid = actor.id
      WHERE actor.name = 'Art Garfunkel')
    AND actor.name != 'Art Garfunkel';


------ 8: Using NULL

-- 1 List the teachers who have NULL for their department.
  SELECT name FROM teacher WHERE dept IS NULL;

-- 2 Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
  SELECT teacher.name, dept.name FROM teacher
    INNER JOIN dept ON (teacher.dept=dept.id)

-- 3 Use a different JOIN so that all teachers are listed.
  SELECT teacher.name, dept.name FROM teacher
    LEFT JOIN dept ON teacher.dept = dept.id;

-- 4 Use a different JOIN so that all departments are listed.
  SELECT teacher.name, dept.name FROM teacher
    RIGHT JOIN dept ON teacher.dept = dept.id;

-- 5 Show teacher name and mobile number or '07986 444 2266'
  SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher;

-- 6 Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.
  SELECT teacher.name, COALESCE(dept.name, 'None') FROM teacher
    LEFT JOIN dept ON teacher.dept = dept.id;

-- 7 Use COUNT to show the number of teachers and the number of mobile phones.
  SELECT COUNT(name), COUNT(mobile) FROM teacher;

-- 8 Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.
  SELECT dept.name, COUNT(teacher.name) FROM teacher
    RIGHT JOIN dept ON teacher.dept = dept.id
    GROUP BY dept.name;

-- 9 Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
  SELECT name, CASE WHEN dept=1 OR dept=2 THEN 'Sci' ELSE 'Art' END Subject FROM teacher;

-- 10 Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.
  SELECT name, CASE WHEN dept=1 OR dept=2 THEN 'Sci'
                    WHEN dept=3 THEN 'Art'
                    ELSE 'None' END Subject FROM teacher;

------ 8+: Numeric Examples

-- 1 Show the the percentage who STRONGLY AGREE for: question 1, at 'Edinburgh Napier University', studying '(8) Computer Science'
  SELECT A_STRONGLY_AGREE FROM nss
    WHERE question='Q01' AND institution='Edinburgh Napier University' AND subject='(8) Computer Science'

-- 2 Show the institution and subject where the score is at least 100 for question 15.
  SELECT institution, subject FROM nss
    WHERE score >= 100 AND question = 'Q15';

-- 3 Show the institution and score where the score for '(8) Computer Science' is less than 50 for question 'Q15'
  SELECT institution, score FROM nss
    WHERE question='Q15' AND score < 50 AND subject = '(8) Cmputer Science';

-- 4 Show the subject and total number of students who responded to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'.
  SELECT subject, sum(response) FROM nss
    WHERE question='Q22' AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
    GROUP BY subject;

-- 5 Show the subject and total number of students who A_STRONGLY_AGREE to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'.
  SELECT subject, SUM(response * A_STRONGLY_AGREE / 100) FROM nss
    WHERE question='Q22' AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
    GROUP BY subject;

-- 6 Show the percentage of students who A_STRONGLY_AGREE to question 22 for the subject '(8) Computer Science' show the same figure for the subject '(H) Creative Arts and Design'.
  SELECT subject, ROUND(SUM(A_STRONGLY_AGREE * response) / SUM(response)) FROM nss
    WHERE question='Q22' AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
    GROUP BY subject;

-- 7 Show the average scores for question 'Q22' for each institution that include 'Manchester' in the name.
  SELECT institution, ROUND(SUM(score*response) / SUM(response)) FROM nss
    WHERE question='Q22' AND (institution LIKE '%Manchester%')
    GROUP BY institution;

-- 8 Show the institution, the total sample size and the number of computing students for institutions in Manchester for 'Q01'.
  SELECT institution, SUM(sample), SUM(CASE WHEN subject='(8) Computer Science' THEN sample END) AS comp FROM nss
    WHERE question='Q01' AND (institution LIKE '%Manchester%')
    GROUP BY institution;

------ 9: Self join

-- 1 How many stops are in the database.
  SELECT COUNT(id) FROM stops;

-- 2 Find the id value for the stop 'Craiglockhart'
  SELECT id FROM stops WHERE name = 'Craiglockhart';

-- 3 Give the id and the name for the stops on the '4' 'LRT' service.
  SELECT id, name FROM stops
    INNER JOIN route on stops.id = route.stop
    WHERE num = 4 AND company = 'LRT';

-- 4 Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.
  SELECT company, num, COUNT(*) FROM route
    WHERE stop=149 OR stop=53
    GROUP BY company, num
    HAVING COUNT(*) = 2;

-- 5 Change the query so that it shows the services from Craiglockhart to London Road.
  SELECT a.company, a.num, a.stop, b.stop FROM route a
    JOIN route b ON (a.company=b.company AND a.num=b.num)
    WHERE a.stop=53 AND b.stop=149;

-- 6 refer to stops by name rather than by number. Change the query so that the services between 'Craiglockhart' and 'London Road' are shown.
  SELECT a.company, a.num, stopa.name, stopb.name FROM route a
    JOIN route b ON (a.company=b.company AND a.num=b.num)
    JOIN stops stopa ON (a.stop=stopa.id)
    JOIN stops stopb ON (b.stop=stopb.id)
    WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road';

-- 7 Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
  SELECT DISTINCT a.company, a.num FROM route a
    JOIN route b ON (a.company = b.company AND a.num = b.num)
    WHERE a.stop = 115 AND b.stop = 137;

-- 8 Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
  SELECT a.company, a.num FROM route a
    JOIN route b ON (a.company=b.company AND a.num=b.num)
    JOIN stops stopa ON (a.stop=stopa.id)
    JOIN stops stopb ON (b.stop=stopb.id)
    WHERE stopa.name='Craiglockhart' AND stopb.name = 'Tollcross';

-- 9 Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company.
  SELECT DISTINCT stopb.name, a.company, a.num FROM route a
    JOIN route b ON (a.company=b.company AND a.num=b.num)
    JOIN stops stopa ON (a.stop=stopa.id)
    JOIN stops stopb ON (b.stop=stopb.id)      WHERE a.company = 'LRT' AND stopa.name = 'Craiglockhart';

-- 10
  SELECT start.num, start.company, start.name, finish.num, finish.company FROM
    (SELECT DISTINCT a.num, a.company, stopb.name FROM route a
      JOIN route b ON (a.company=b.company AND a.num=b.num)
      JOIN stops stopa ON (a.stop=stopa.id)
      JOIN stops stopb ON (b.stop=stopb.id)
      WHERE stopa.name = 'Craiglockhart') AS start
  JOIN
   (SELECT DISTINCT stopa.name, a.num, a.company FROM route a
      JOIN route b ON (a.company=b.company AND a.num=b.num)
      JOIN stops stopa ON (a.stop=stopa.id)
      JOIN stops stopb ON (b.stop=stopb.id)
      WHERE stopb.name = 'Sighthill') AS finish

    ON start.name = finish.name
    ORDER BY start.num, finish.num;
