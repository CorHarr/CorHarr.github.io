-- ========================================
-- SECTION 1: DATA EXPLORATION
-- ========================================

-- Query 1: Explore specific columns
SELECT ID, Name, Sex, Year, Games, NOC, Event, Medal
FROM athlete_events
LIMIT 10;

-- Query 2: Examine the dataset
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT ID) AS unique_athletes,
    MIN(Year) AS first_year,
    MAX(Year) AS last_year
FROM athlete_events;

-- DATA EXPLORATION ASSESSMENT
-- The dataset contains 271,116 records from 1896 to 2016,
-- covering 135,571 individual athletes.
-- Some athletes competed in more than one event or Olympic Games,
-- so they appear in the dataset multiple times.
-- Later queries must avoid double-counting.


-- ========================================
-- SECTION 2: DATA VALIDATION
-- ========================================

-- Query 3: Determine country code matches
SELECT
    COUNT(*) AS total_records,
    COUNT(r.NOC) AS matched_records,
    COUNT(*) - COUNT(r.NOC) AS unmatched_records
FROM athlete_events AS a
LEFT JOIN noc_regions AS r
    ON a.NOC = r.NOC;

-- Query 4: Identify unmatched country codes
SELECT
    a.NOC,
    COUNT(*) AS unmatched_records
FROM athlete_events AS a
LEFT JOIN noc_regions AS r
    ON a.NOC = r.NOC
WHERE r.NOC IS NULL
GROUP BY a.NOC
ORDER BY unmatched_records DESC;

-- Query 4a: Investigate the unmatched country code
SELECT DISTINCT NOC, Team
FROM athlete_events
WHERE NOC = 'SGP';

-- Query 4b: Investigate unusual team names
SELECT Name, Team, Sport, Event, Year
FROM athlete_events
WHERE NOC = 'SGP'
  AND Team IN ('June Climene', 'Rika II');

-- Query 4c: Compare Singapore's NOC codes in both tables
SELECT DISTINCT NOC, 'athlete_events' AS source
FROM athlete_events
WHERE NOC IN ('SGP', 'SIN')

UNION

SELECT NOC, 'noc_regions' AS source
FROM noc_regions
WHERE region = 'Singapore';

-- Query 5: Re-check matches after mapping SGP to SIN
SELECT
    COUNT(*) AS total_records,
    COUNT(r.NOC) AS matched_records,
    COUNT(*) - COUNT(r.NOC) AS unmatched_records
FROM athlete_events AS a
LEFT JOIN noc_regions AS r
    ON (CASE
        WHEN a.NOC = 'SGP' THEN 'SIN'
        ELSE a.NOC
    END) = r.NOC;

-- Query 6: Examine medal values
SELECT
    Medal,
    COUNT(*) AS total_records
FROM athlete_events
GROUP BY Medal
ORDER BY total_records DESC;

-- Query 7: Check for duplicate records
SELECT
    COUNT(*) AS total_records,
    COUNT(*) - (SELECT COUNT(*) FROM
        (SELECT DISTINCT * FROM athlete_events) AS unique_records) AS duplicate_records
FROM athlete_events;

-- Query 7a: Investigate repeated athlete-event combinations
-- Broader than Query 7, so the total (1,398) is higher than 1,385.
WITH repeats AS (
    SELECT
        ID, Name, Games, Event, Medal,
        COUNT(*) - 1 AS extra_rows
    FROM athlete_events
    GROUP BY ID, Name, Games, Event, Medal
    HAVING COUNT(*) > 1)
SELECT
    *
FROM (
    SELECT
        *
    FROM repeats
    ORDER BY extra_rows DESC
    LIMIT 10) AS top_ten
UNION ALL
SELECT
    NULL, 'TOTAL (all repeats)', NULL, NULL, NULL, SUM(extra_rows)
FROM repeats;

-- Query 7b: Find all exact duplicates by sport and medal
WITH duplicates AS (
    SELECT
        Sport, Medal, COUNT(*) - 1 AS extra_rows
    FROM athlete_events
    GROUP BY ID, Name, Sex, Age, Height, Weight, Team, NOC,
             Games, Year, Season, City, Sport, Event, Medal
    HAVING COUNT(*) > 1)
SELECT
    Sport, Medal, SUM(extra_rows) AS duplicate_records
FROM duplicates
GROUP BY Sport, Medal
ORDER BY duplicate_records DESC;

-- DATA VALIDATION ASSESSMENT
-- There were 349 records that did not match the country table.
-- All 349 used SGP, while the reference table used SIN for Singapore.
-- Some Team values are boat names (e.g. 'Rika II') from sailing events,
-- so NOC, not Team, will be used to identify countries.
-- Codes were matched without changing the original data.
-- With this mapping, all records match the country table.
-- Medal values are Gold, Silver, Bronze, or the text 'NA' (no medal),
-- so 'NA' must be filtered out by value, not with IS NULL.
-- Found 1,385 exact duplicates, mostly in art competitions.
-- 11 duplicate records involved medals, all in sailing.
-- Later analyses will account for duplicates.


-- ========================================
-- SECTION 3: MEDAL PERFORMANCE 
-- ========================================

-- Query 8: Rank the top 10 countries by Olympic medals
-- Exclude no-medal records, duplicates, and repeated team medals.
WITH medals AS (
    SELECT DISTINCT Games, Event, NOC, Medal
    FROM athlete_events
    WHERE Medal IN ('Gold', 'Silver', 'Bronze'))
SELECT
    r.region AS country,
    SUM(CASE WHEN m.Medal = 'Gold' THEN 1 ELSE 0 END) AS gold,
    SUM(CASE WHEN m.Medal = 'Silver' THEN 1 ELSE 0 END) AS silver,
    SUM(CASE WHEN m.Medal = 'Bronze' THEN 1 ELSE 0 END) AS bronze,
    COUNT(*) AS total_medals
FROM medals AS m
JOIN noc_regions AS r
    ON (CASE WHEN m.NOC = 'SGP' THEN 'SIN' ELSE m.NOC END) = r.NOC
GROUP BY r.region
ORDER BY total_medals DESC
LIMIT 10;

-- Query 8a: Check whether historical NOC codes are grouped under Russia and Germany
SELECT NOC, region
FROM noc_regions
WHERE region IN ('Russia', 'Germany')
ORDER BY region, NOC;

-- MEDAL PERFORMANCE ASSESSMENT
-- The USA leads with 2,823 medals, followed by Russia (1,916) and Germany (1,766).
-- Medal totals count each country, event, and medal type once per Games.
-- Two same-color medals for one country in the same event count as one.
-- Boxing can award two bronzes, counted separately if won by different countries.
-- Country totals include historical Olympic delegations grouped by region.
-- Russia includes Soviet Union and Unified Team medals.
-- Germany includes East Germany, West Germany, and other German delegations.
-- These totals do not represent modern national teams alone.


-- ========================================
-- SECTION 4: WOMEN'S PARTICIPATION
-- ========================================

-- Query 9: Measure women's share of Summer Olympic participants by year
SELECT
    Year,
    COUNT(DISTINCT ID) AS total_athletes,
    COUNT(DISTINCT CASE WHEN Sex = 'F' THEN ID END) AS women,
    ROUND(100.0 * COUNT(DISTINCT CASE WHEN Sex = 'F' THEN ID END) /
        COUNT(DISTINCT ID), 1) AS women_pct
FROM athlete_events
WHERE Season = 'Summer'
GROUP BY Year
ORDER BY Year;

-- WOMEN'S PARTICIPATION ASSESSMENT
-- Summer Olympics were used for a consistent historical comparison.
-- No women competed in 1896.
-- Women's participation rose from 1.9% in 1900 to 45.0% in 2016,
-- an increase of 43.1 percentage points.
-- Female athletes increased from 23 to 5,034.
-- Despite this growth, women remained below half of participants in 2016.
-- Athletes were counted once per Games, so duplicates do not affect results.
-- Includes the 1906 Games, which the IOC no longer recognizes as official.


-- ========================================
-- SECTION 5: HOST-COUNTRY ADVANTAGE
-- ========================================

-- Query 10: Rank host countries by medal gains over the previous Summer Games
-- Compare six host countries from 1996 to 2016 using the same medal-counting method.
WITH hosts(Year, NOC) AS (
    VALUES (1996, 'USA'), (2000, 'AUS'), (2004, 'GRE'),
           (2008, 'CHN'), (2012, 'GBR'), (2016, 'BRA')),
medals AS (
    SELECT DISTINCT Year, Event, Medal,
        CASE WHEN NOC = 'SGP' THEN 'SIN' ELSE NOC END AS NOC
    FROM athlete_events
    WHERE Season = 'Summer' AND Medal IN ('Gold', 'Silver', 'Bronze')),
totals AS (
    SELECT
        Year, NOC, COUNT(*) AS total_medals
    FROM medals
    GROUP BY Year, NOC),
comparison AS (
    SELECT
        h.Year, r.region AS country,
        COALESCE(p.total_medals, 0) AS previous_medals,
        COALESCE(c.total_medals, 0) AS host_medals,
        COALESCE(c.total_medals, 0) - COALESCE(p.total_medals, 0) AS difference
    FROM hosts AS h
    JOIN noc_regions AS r ON h.NOC = r.NOC
    LEFT JOIN totals AS p ON p.NOC = h.NOC AND p.Year = h.Year - 4
    LEFT JOIN totals AS c ON c.NOC = h.NOC AND c.Year = h.Year)
SELECT
    Year, country, previous_medals, host_medals, difference,
    RANK() OVER (ORDER BY difference DESC) AS improvement_rank
FROM comparison
ORDER BY improvement_rank, Year;

-- HOST-COUNTRY ADVANTAGE ASSESSMENT
-- 5 of 6 host countries won more medals than at the previous Summer Games.
-- China had the largest increase (+37), followed by Australia and the UK (+17).
-- The USA was the only host country with a decline (-7).
-- Medals were counted once per country, event, and medal type per Games.
-- Results suggest a possible host advantage but do not prove causation.
-- Hosts often increase sports funding before hosting, which may affect results.
-- The number of medal events also varied between Games.
-- The comparison covers only six Games from 1996 through 2016.

