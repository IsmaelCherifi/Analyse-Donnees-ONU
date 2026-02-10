SELECT * 
FROM pop
LIMIT 50;

DROP TABLE IF EXISTS pop;
DROP TABLE IF EXISTS region;
DROP TABLE IF EXISTS subregion;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS fact_population;




CREATE TABLE region (
 location_code INTEGER PRIMARY KEY,
 name TEXT NOT NULL
);

INSERT INTO region (location_code, name)
SELECT DISTINCT
 "Location code",
 "Region, subregion, country or area"
FROM pop
WHERE "Type" = 'Region';


CREATE TABLE subregion (
 location_code INTEGER PRIMARY KEY,
 name TEXT NOT NULL,
 parent_code INTEGER,
 FOREIGN KEY (parent_code) REFERENCES region(location_code)
);

INSERT INTO subregion 
SELECT DISTINCT
 "Location code",
 "Region, subregion, country or area",
 "Parent code"
FROM pop
WHERE "Type" = 'Subregion';


CREATE TABLE country (
 location_code INTEGER PRIMARY KEY,
 name TEXT NOT NULL,
 parent_code INTEGER,
 FOREIGN KEY (parent_code) REFERENCES subregion(location_code)
);

INSERT INTO country
SELECT DISTINCT
 "Location code",
 "Region, subregion, country or area",
 "Parent code"
FROM pop  
WHERE "Type" = 'Country/Area';


CREATE TABLE fact_population (
  fact_id INTEGER PRIMARY KEY AUTOINCREMENT,
  location_code INTEGER NOT NULL,
  year INTEGER NOT NULL,
 
  -- Population générale
  "Total Population, as of 1 January (thousands)" REAL,
  "Total Population, as of 1 July (thousands)" REAL,
  "Male Population, as of 1 July (thousands)" REAL,
  "Female Population, as of 1 July (thousands)" REAL,
  "Population Density, as of 1 July (persons per square km)" REAL,
  "Population Sex Ratio, as of 1 July (males per 100 females)" REAL,
 
  -- Structure et changements
  "Median Age, as of 1 July (years)" REAL,
  "Natural Change, Births minus Deaths (thousands)" REAL,
  "Rate of Natural Change (per 1,000 population)" REAL,
  "Population Change (thousands)" REAL,
  "Population Growth Rate (percentage)" REAL,
  "Population Annual Doubling Time (years)" REAL,
 
  -- Natalité
  "Births (thousands)" REAL,
  "Births by women aged 15 to 19 (thousands)" REAL,
  "Crude Birth Rate (births per 1,000 population)" REAL,
  "Total Fertility Rate (live births per woman)" REAL,
  "Net Reproduction Rate (surviving daughters per woman)" REAL,
  "Mean Age Childbearing (years)" REAL,
  "Sex Ratio at Birth (males per 100 female births)" REAL,
 
  -- Mortalité générale
  "Total Deaths (thousands)" REAL,
  "Male Deaths (thousands)" REAL,
  "Female Deaths (thousands)" REAL,
  "Crude Death Rate (deaths per 1,000 population)" REAL,
 
  -- Espérance de vie
  "Life Expectancy at Birth, both sexes (years)" REAL,
  "Male Life Expectancy at Birth (years)" REAL,
  "Female Life Expectancy at Birth (years)" REAL,
  "Life Expectancy at Age 15, both sexes (years)" REAL,
  "Male Life Expectancy at Age 15 (years)" REAL,
  "Female Life Expectancy at Age 15 (years)" REAL,
  "Life Expectancy at Age 65, both sexes (years)" REAL,
  "Male Life Expectancy at Age 65 (years)" REAL,
  "Female Life Expectancy at Age 65 (years)" REAL,
  "Life Expectancy at Age 80, both sexes (years)" REAL,
  "Male Life Expectancy at Age 80 (years)" REAL,
  "Female Life Expectancy at Age 80 (years)" REAL,
 
  -- Mortalité infantile / juvénile
  "Infant Deaths, under age 1 (thousands)" REAL,
  "Infant Mortality Rate (infant deaths per 1,000 live births)" REAL,
  "Live Births Surviving to Age 1 (thousands)" REAL,
  "Under-Five Deaths, under age 5 (thousands)" REAL,
  "Under-Five Mortality (deaths under age 5 per 1,000 live births)" REAL,
 
  -- Mortalité par tranches d’âge
  "Mortality before Age 40, both sexes (deaths under age 40 per 1,000 live births)" REAL,
  "Male Mortality before Age 40 (deaths under age 40 per 1,000 male live births)" REAL,
  "Female Mortality before Age 40 (deaths under age 40 per 1,000 female live births)" REAL,
  "Mortality before Age 60, both sexes (deaths under age 60 per 1,000 live births)" REAL,
  "Male Mortality before Age 60 (deaths under age 60 per 1,000 male live births)" REAL,
  "Female Mortality before Age 60 (deaths under age 60 per 1,000 female live births)" REAL,
  "Mortality between Age 15 and 50, both sexes (deaths under age 50 per 1,000 alive at age 15)" REAL,
  "Male Mortality between Age 15 and 50 (deaths under age 50 per 1,000 males alive at age 15)" REAL,
  "Female Mortality between Age 15 and 50 (deaths under age 50 per 1,000 females alive at age 15)" REAL,
  "Mortality between Age 15 and 60, both sexes (deaths under age 60 per 1,000 alive at age 15)" REAL,
  "Male Mortality between Age 15 and 60 (deaths under age 60 per 1,000 males alive at age 15)" REAL,
  "Female Mortality between Age 15 and 60 (deaths under age 60 per 1,000 females alive at age 15)" REAL,
 
  -- Migration
  "Net Number of Migrants (thousands)" REAL,
  "Net Migration Rate (per 1,000 population)" REAL
);
 
  
INSERT INTO fact_population (
  location_code,
  year,
  "Total Population, as of 1 January (thousands)",
  "Total Population, as of 1 July (thousands)",
  "Male Population, as of 1 July (thousands)",
  "Female Population, as of 1 July (thousands)",
  "Population Density, as of 1 July (persons per square km)",
  "Population Sex Ratio, as of 1 July (males per 100 females)",
  "Median Age, as of 1 July (years)",
  "Natural Change, Births minus Deaths (thousands)",
  "Rate of Natural Change (per 1,000 population)",
  "Population Change (thousands)",
  "Population Growth Rate (percentage)",
  "Population Annual Doubling Time (years)",
  "Births (thousands)",
  "Births by women aged 15 to 19 (thousands)",
  "Crude Birth Rate (births per 1,000 population)",
  "Total Fertility Rate (live births per woman)",
  "Net Reproduction Rate (surviving daughters per woman)",
  "Mean Age Childbearing (years)",
  "Sex Ratio at Birth (males per 100 female births)",
  "Total Deaths (thousands)",
  "Male Deaths (thousands)",
  "Female Deaths (thousands)",
  "Crude Death Rate (deaths per 1,000 population)",
  "Life Expectancy at Birth, both sexes (years)",
  "Male Life Expectancy at Birth (years)",
  "Female Life Expectancy at Birth (years)",
  "Life Expectancy at Age 15, both sexes (years)",
  "Male Life Expectancy at Age 15 (years)",
  "Female Life Expectancy at Age 15 (years)",
  "Life Expectancy at Age 65, both sexes (years)",
  "Male Life Expectancy at Age 65 (years)",
  "Female Life Expectancy at Age 65 (years)",
  "Life Expectancy at Age 80, both sexes (years)",
  "Male Life Expectancy at Age 80 (years)",
  "Female Life Expectancy at Age 80 (years)",
  "Infant Deaths, under age 1 (thousands)",
  "Infant Mortality Rate (infant deaths per 1,000 live births)",
  "Live Births Surviving to Age 1 (thousands)",
  "Under-Five Deaths, under age 5 (thousands)",
  "Under-Five Mortality (deaths under age 5 per 1,000 live births)",
  "Mortality before Age 40, both sexes (deaths under age 40 per 1,000 live births)",
  "Male Mortality before Age 40 (deaths under age 40 per 1,000 male live births)",
  "Female Mortality before Age 40 (deaths under age 40 per 1,000 female live births)",
  "Mortality before Age 60, both sexes (deaths under age 60 per 1,000 live births)",
  "Male Mortality before Age 60 (deaths under age 60 per 1,000 male live births)",
  "Female Mortality before Age 60 (deaths under age 60 per 1,000 female live births)",
  "Mortality between Age 15 and 50, both sexes (deaths under age 50 per 1,000 alive at age 15)",
  "Male Mortality between Age 15 and 50 (deaths under age 50 per 1,000 males alive at age 15)",
  "Female Mortality between Age 15 and 50 (deaths under age 50 per 1,000 females alive at age 15)",
  "Mortality between Age 15 and 60, both sexes (deaths under age 60 per 1,000 alive at age 15)",
  "Male Mortality between Age 15 and 60 (deaths under age 60 per 1,000 males alive at age 15)",
  "Female Mortality between Age 15 and 60 (deaths under age 60 per 1,000 females alive at age 15)",
  "Net Number of Migrants (thousands)",
  "Net Migration Rate (per 1,000 population)"
)
SELECT
  "Location code",
  "Year",
  "Total Population, as of 1 January (thousands)",
  "Total Population, as of 1 July (thousands)",
  "Male Population, as of 1 July (thousands)",
  "Female Population, as of 1 July (thousands)",
  "Population Density, as of 1 July (persons per square km)",
  "Population Sex Ratio, as of 1 July (males per 100 females)",
  "Median Age, as of 1 July (years)",
  "Natural Change, Births minus Deaths (thousands)",
  "Rate of Natural Change (per 1,000 population)",
  "Population Change (thousands)",
  "Population Growth Rate (percentage)",
  "Population Annual Doubling Time (years)",
  "Births (thousands)",
  "Births by women aged 15 to 19 (thousands)",
  "Crude Birth Rate (births per 1,000 population)",
  "Total Fertility Rate (live births per woman)",
  "Net Reproduction Rate (surviving daughters per woman)",
  "Mean Age Childbearing (years)",
  "Sex Ratio at Birth (males per 100 female births)",
  "Total Deaths (thousands)",
  "Male Deaths (thousands)",
  "Female Deaths (thousands)",
  "Crude Death Rate (deaths per 1,000 population)",
  "Life Expectancy at Birth, both sexes (years)",
  "Male Life Expectancy at Birth (years)",
  "Female Life Expectancy at Birth (years)",
  "Life Expectancy at Age 15, both sexes (years)",
  "Male Life Expectancy at Age 15 (years)",
  "Female Life Expectancy at Age 15 (years)",
  "Life Expectancy at Age 65, both sexes (years)",
  "Male Life Expectancy at Age 65 (years)",
  "Female Life Expectancy at Age 65 (years)",
  "Life Expectancy at Age 80, both sexes (years)",
  "Male Life Expectancy at Age 80 (years)",
  "Female Life Expectancy at Age 80 (years)",
  "Infant Deaths, under age 1 (thousands)",
  "Infant Mortality Rate (infant deaths per 1,000 live births)",
  "Live Births Surviving to Age 1 (thousands)",
  "Under-Five Deaths, under age 5 (thousands)",
  "Under-Five Mortality (deaths under age 5 per 1,000 live births)",
  "Mortality before Age 40, both sexes (deaths under age 40 per 1,000 live births)",
  "Male Mortality before Age 40 (deaths under age 40 per 1,000 male live births)",
  "Female Mortality before Age 40 (deaths under age 40 per 1,000 female live births)",
  "Mortality before Age 60, both sexes (deaths under age 60 per 1,000 live births)",
  "Male Mortality before Age 60 (deaths under age 60 per 1,000 male live births)",
  "Female Mortality before Age 60 (deaths under age 60 per 1,000 female live births)",
  "Mortality between Age 15 and 50, both sexes (deaths under age 50 per 1,000 alive at age 15)",
  "Male Mortality between Age 15 and 50 (deaths under age 50 per 1,000 males alive at age 15)",
  "Female Mortality between Age 15 and 50 (deaths under age 50 per 1,000 females alive at age 15)",
  "Mortality between Age 15 and 60, both sexes (deaths under age 60 per 1,000 alive at age 15)",
  "Male Mortality between Age 15 and 60 (deaths under age 60 per 1,000 males alive at age 15)",
  "Female Mortality between Age 15 and 60 (deaths under age 60 per 1,000 females alive at age 15)",
  "Net Number of Migrants (thousands)",
  "Net Migration Rate (per 1,000 population)"
FROM pop
WHERE "Year" IS NOT NULL;

SELECT MAX(fact_id)
FROM fact_population;


SELECT
 r.name AS region,
 SUM(f."Total Population, as of 1 July (thousands)") AS total_pop_2000
FROM fact_population f
JOIN country c ON f.location_code = c.location_code
LEFT JOIN subregion s ON c.parent_code = s.location_code
LEFT JOIN region r ON 
	(c.parent_code = r.location_code) OR
	(s.location_code IS NOT NULL AND s.parent_code = r.location_code )
WHERE f.year = 2000
GROUP BY r.name
ORDER BY total_pop_2000 DESC;


SELECT 
 year,
 "Total Population, as of 1 July (thousands)"
FROM fact_population f
JOIN country c ON f.location_code = c.location_code
WHERE c.name = 'France'
ORDER BY year;


SELECT c.name AS country, s.name AS subregion, r.name AS region
FROM country c
JOIN subregion s ON c.parent_code = s.location_code
JOIN region r ON s.parent_code = r.location_code
LIMIT 10;

DROP VIEW IF EXISTS v_population_by_region;

CREATE VIEW v_population_by_region AS
SELECT
 r.name AS region_name,
 f.year,
 SUM(f."Total Population, as of 1 July (thousands)") AS total_population
FROM fact_population f
JOIN country c ON f.location_code = c.location_code
JOIN subregion s ON c.parent_code = s.location_code
JOIN region r ON s.parent_code = r.location_code
GROUP BY r.name, f.year
ORDER BY f.year, r.name;

SELECT *
FROM v_population_by_region
WHERE year = 2000
ORDER BY total_population DESC;


CREATE VIEW v_country_share_in_region AS
SELECT
 r.name AS region_name,
 c.name AS country_name,
 f.year,
 f."Total Population, as of 1 July (thousands)" AS country_pop,
 fr."Total Population, as of 1 July (thousands)" AS region_pop,
 ROUND(100.0 * f."Total Population, as of 1 July (thousands)"
 / fr."Total Population, as of 1 July (thousands)", 2)
 AS country_share_percent
FROM fact_population f
JOIN country c ON f.location_code = c.location_code
JOIN subregion s ON c.parent_code = s.location_code
JOIN region r ON s.parent_code = r.location_code
JOIN fact_population fr ON fr.location_code = r.location_code AND fr.year = f.year
ORDER BY r.name, f.year, country_share_percent DESC;

SELECT
 country_name,
 country_pop,
 region_pop ,
 country_share_percent
FROM v_country_share_in_region
WHERE region_name = 'Europe' AND year = 2000
ORDER BY country_share_percent DESC;



-- Thème 1 --

-- Question 1 --

SELECT s.name AS Sous_region, r.name AS Region
FROM subregion s 
INNER JOIN region r 
ON s.parent_code = r.location_code
ORDER BY r.name;

-- Question 2 --

SELECT c.name AS Country, f."Total Population, as of 1 July (thousands)" AS Population_2020_Thousands
FROM fact_population f
JOIN country c 
ON f.location_code = c.location_code
WHERE f.year = 2020
ORDER BY f."Total Population, as of 1 July (thousands)" DESC
LIMIT 10;

-- Question 3 --

SELECT SUM(f."Total Population, as of 1 July (thousands)") AS tot_pop_1980
FROM fact_population f
JOIN country c
ON f.location_code = c.location_code
WHERE f.year = 1980;

--Question 4 --

SELECT DISTINCT c.name AS Pays, f."Population Density, as of 1 July (persons per square km)" AS Densite_pop_2020
FROM fact_population f
JOIN country c 
ON f.location_code = c.location_code
WHERE f."Population Density, as of 1 July (persons per square km)" >= 500
AND f."Year" = 2020;


-- Question 5 --

SELECT 
    f.year,
    f."Male Population, as of 1 July (thousands)" AS male_population,
    f."Female Population, as of 1 July (thousands)" AS female_population
FROM fact_population f
JOIN country c 
ON f.location_code = c.location_code
WHERE c.name = 'France'
ORDER BY f.year;


-- Thème 2 --

-- Question 1 --

SELECT fp.year, fp."Total Population, as of 1 July (thousands)"
FROM  fact_population fp  
JOIN country c
ON fp.location_code = c.location_code
WHERE c.name ='Algeria'
AND fp.year >= 1973
ORDER BY fp.year ASC;
 
 
-- Question 2 --

SELECT
    r.name AS Region,
    (f.year / 10) * 10 AS Decennie,
    ROUND(AVG(f."Population Growth Rate (percentage)"), 2) AS CroissanceMoyenne
FROM fact_population f
JOIN country c ON f.location_code = c.location_code
LEFT JOIN subregion s ON c.parent_code = s.location_code
LEFT JOIN region r ON
    (c.parent_code = r.location_code) OR
    (s.location_code IS NOT NULL AND s.parent_code = r.location_code)
GROUP BY r.name, Decennie
ORDER BY r.name, Decennie;
 
-- Question 3 --

SELECT
    c.name AS Pays,
    p1."Total Population, as of 1 July (thousands)" AS Pop_1950,
    p2."Total Population, as of 1 July (thousands)" AS Pop_2023
FROM country c
JOIN fact_population p1 ON c.location_code = p1.location_code AND p1.year = 1950
JOIN fact_population p2 ON c.location_code = p2.location_code AND p2.year = 2023
WHERE p2."Total Population, as of 1 July (thousands)" >= 2 * p1."Total Population, as of 1 July (thousands)"
ORDER BY c.name;
 
-- Question 4 --
SELECT
    r.name AS Region,
    ROUND(AVG(f."Crude Birth Rate (births per 1,000 population)"), 2) AS TauxNataliteMoyen,
    ROUND(AVG(f."Crude Death Rate (deaths per 1,000 population)"), 2) AS TauxMortaliteMoyen
FROM fact_population f
JOIN country c ON f.location_code = c.location_code
LEFT JOIN subregion s ON c.parent_code = s.location_code
LEFT JOIN region r ON
    (c.parent_code = r.location_code) OR
    (s.location_code IS NOT NULL AND s.parent_code = r.location_code)
WHERE f.year = 2000
GROUP BY r.name;
 
-- Question 5 --

SELECT
    c.name AS Pays,
    f.year AS Annee,
    f."Population Sex Ratio, as of 1 July (males per 100 females)" AS RatioHommeFemme
FROM fact_population f
JOIN country c ON f.location_code = c.location_code
WHERE c.name = 'China'
  AND f.year IN (1950, 2020)
ORDER BY f.year;

-- Theme 3 --

-- Question 1 --

SELECT
    c.name AS Pays,
    f."Total Population, as of 1 July (thousands)" AS PopulationPays,
    RegionTotal.PopTotaleRegion AS PopulationRegionale,
    ROUND(
        (f."Total Population, as of 1 July (thousands)" / RegionTotal.PopTotaleRegion) * 100,
        2
    ) AS Part_En_Pourcentage
FROM fact_population f
JOIN country c ON f.location_code = c.location_code
-- Jointures Solution #1 (Complexes)
LEFT JOIN subregion s ON c.parent_code = s.location_code
LEFT JOIN region r ON
    (c.parent_code = r.location_code) OR
    (s.location_code IS NOT NULL AND s.parent_code = r.location_code)
-- Sous-requête pour calculer le total de la région
JOIN (
    SELECT
        r2.location_code,
        SUM(f2."Total Population, as of 1 July (thousands)") as PopTotaleRegion
    FROM fact_population f2
    JOIN country c2 ON f2.location_code = c2.location_code
    LEFT JOIN subregion s2 ON c2.parent_code = s2.location_code
    LEFT JOIN region r2 ON (c2.parent_code = r2.location_code) OR (s2.location_code IS NOT NULL AND s2.parent_code = r2.location_code)
    WHERE f2.year = 2023
    GROUP BY r2.location_code
) AS RegionTotal ON r.location_code = RegionTotal.location_code
WHERE f.year = 2023
  AND r.name = 'Asia'
ORDER BY Part_En_Pourcentage DESC;
 
-- Question 2 -- 

SELECT
    r.name AS Region,
    s.name AS SousRegion,
    SUM(f."Total Population, as of 1 July (thousands)") AS PopSousRegion,
    RegionTotal.PopTotaleRegion AS PopRegion,
    ROUND(
        (SUM(f."Total Population, as of 1 July (thousands)") / RegionTotal.PopTotaleRegion) * 100,
        2
    ) AS Part_Region_Pourcentage
FROM fact_population f
JOIN country c ON f.location_code = c.location_code
LEFT JOIN subregion s ON c.parent_code = s.location_code
LEFT JOIN region r ON
    (c.parent_code = r.location_code) OR
    (s.location_code IS NOT NULL AND s.parent_code = r.location_code)
JOIN (
    SELECT
        r2.location_code,
        SUM(f2."Total Population, as of 1 July (thousands)") as PopTotaleRegion
    FROM fact_population f2
    JOIN country c2 ON f2.location_code = c2.location_code
    LEFT JOIN subregion s2 ON c2.parent_code = s2.location_code
    LEFT JOIN region r2 ON (c2.parent_code = r2.location_code) OR (s2.location_code IS NOT NULL AND s2.parent_code = r2.location_code)
    WHERE f2.year = 2023
    GROUP BY r2.location_code
) AS RegionTotal ON r.location_code = RegionTotal.location_code
WHERE f.year = 2023
  AND s.name IS NOT NULL
GROUP BY r.name, s.name, RegionTotal.PopTotaleRegion
HAVING Part_Region_Pourcentage > 40
ORDER BY Part_Region_Pourcentage DESC;


-- Theme 4 --

-- Question 1 --

SELECT
    c.name AS Pays,
    f."Life Expectancy at Birth, both sexes (years)" AS Esperance
FROM fact_population f
JOIN country c
    ON f.location_code = c.location_code
WHERE f.year = 2020
  AND f."Life Expectancy at Birth, both sexes (years)" IS NOT NULL
ORDER BY Esperance DESC
LIMIT 5;

-- Question 2 --

SELECT
    r.name AS Region,
    AVG(f."Male Life Expectancy at Birth (years)")   AS Esperance_Hommes,
    AVG(f."Female Life Expectancy at Birth (years)") AS Esperance_Femmes,
    ROUND(
        AVG(f."Female Life Expectancy at Birth (years)")
      - AVG(f."Male Life Expectancy at Birth (years)"), 2
    ) AS Ecart_Femmes_Moins_Hommes
FROM fact_population f
JOIN country c   ON f.location_code = c.location_code
JOIN subregion s ON c.parent_code   = s.location_code
JOIN region r    ON s.parent_code   = r.location_code
WHERE f.year = 2020
  AND f."Male Life Expectancy at Birth (years)"   IS NOT NULL
  AND f."Female Life Expectancy at Birth (years)" IS NOT NULL
GROUP BY r.name
ORDER BY Ecart_Femmes_Moins_Hommes DESC;

-- Question 3 --

SELECT
    c.name AS Pays,
    f."Crude Birth Rate (births per 1,000 population)" AS Taux_Natalite_1990
FROM fact_population f
JOIN country c
    ON f.location_code = c.location_code
WHERE f.year = 1990
  AND f."Crude Birth Rate (births per 1,000 population)" IS NOT NULL
ORDER BY Taux_Natalite_1990 DESC
LIMIT 10;

-- Question 4 --

SELECT
    s.name AS Sous_Region,
    c.name AS Pays,
    f."Net Number of Migrants (thousands)" AS Migration_Nette_2010
FROM fact_population f
JOIN country c
    ON f.location_code = c.location_code
JOIN subregion s
    ON c.parent_code = s.location_code
WHERE f.year = 2010
  AND f."Net Number of Migrants (thousands)" IS NOT NULL
  AND f."Net Number of Migrants (thousands)" = (
        SELECT MAX(f2."Net Number of Migrants (thousands)")
        FROM fact_population f2
        JOIN country c2 ON f2.location_code = c2.location_code
        WHERE f2.year = 2010
          AND c2.parent_code = c.parent_code
          AND f2."Net Number of Migrants (thousands)" IS NOT NULL
    )
ORDER BY Migration_Nette_2010 DESC;



-- Theme 5 : Les vues --

DROP VIEW IF EXISTS v_region_population_stats;
DROP VIEW IF EXISTS v_subregion_population;
DROP VIEW IF EXISTS v_region_age_sexratio;

-- Question 1 --

CREATE VIEW v_stats_region_period AS
SELECT
    region_name,
    ROUND(MIN(pop_totale_annuelle), 0) AS pop_min,
    ROUND(MAX(pop_totale_annuelle), 0) AS pop_max,
    ROUND(AVG(pop_totale_annuelle), 0) AS pop_moyenne
FROM (
    SELECT
        r.name AS region_name,
        f.year,
        SUM(f."Total Population, as of 1 July (thousands)") AS pop_totale_annuelle
    FROM fact_population f
    JOIN country c ON f.location_code = c.location_code
    LEFT JOIN subregion s ON c.parent_code = s.location_code
    LEFT JOIN region r ON
        (c.parent_code = r.location_code) OR
        (s.location_code IS NOT NULL AND s.parent_code = r.location_code)
    GROUP BY r.name, f.year
) AS yearly_calc
GROUP BY region_name;
 
 
SELECT * FROM v_stats_region_period;

 
--Question 2 --

CREATE VIEW v_pop_subregion_evolution AS
SELECT
    COALESCE(s.name, 'Aucune (Direct Region)') AS subregion_name,
    f.year,
    SUM(f."Total Population, as of 1 July (thousands)") AS total_population
FROM fact_population f
JOIN country c ON f.location_code = c.location_code
LEFT JOIN subregion s ON c.parent_code = s.location_code
GROUP BY s.name, f.year;
 
SELECT * FROM v_pop_subregion_evolution WHERE year IN (2000, 2020);
 
 
-- Question 3 --

CREATE VIEW v_region_age_sexratio AS
SELECT
    r.name AS region_name,
    f.year,
    AVG(f."Median Age, as of 1 July (years)") AS median_age,
    AVG(f."Population Sex Ratio, as of 1 July (males per 100 females)") AS sex_ratio
FROM fact_population f
JOIN country c ON f.location_code = c.location_code
LEFT JOIN subregion s ON c.parent_code = s.location_code
LEFT JOIN region r ON
    (c.parent_code = r.location_code) OR
    (s.location_code IS NOT NULL AND s.parent_code = r.location_code)
WHERE f."Median Age, as of 1 July (years)" IS NOT NULL
  AND f."Population Sex Ratio, as of 1 July (males per 100 females)" IS NOT NULL
GROUP BY r.name, f.year;
 
SELECT
    region_name,
    year,
    ROUND(median_age, 1) AS Age_Median,
    ROUND(sex_ratio, 1) AS Ratio_Hommes_Femmes
FROM v_region_age_sexratio
WHERE median_age > 30
  AND sex_ratio > 100
ORDER BY year DESC, region_name;



-- ETAPE 10 :
 
 
-- CREATION TABLE CONTINENT :
 
 
PRAGMA foreign_keys = ON;
 
-- 1) Création de la table continent
DROP TABLE IF EXISTS continent;
 
CREATE TABLE continent (
    continent_code INTEGER PRIMARY KEY,
    name           TEXT NOT NULL
);
 
-- 2) Insertion des 3 continents du sujet
INSERT INTO continent (continent_code, name) VALUES
    (1, 'Afro-Eurasien'),        -- Afrique + Europe + Asie
    (2, 'Americain'),           -- Northern America + Latin America and the Caribbean
    (3, 'Oceanien');            -- Oceania
 
 
    
    
 
-- 3) Ajout de la colonne de FK vers continent
ALTER TABLE region
ADD COLUMN continent_code INTEGER REFERENCES continent(continent_code);
 
 
 
 
 
 
-- 4) Afro-Eurasien : Africa + Europe + Asia
UPDATE region
SET continent_code = 1
WHERE name IN ('Africa', 'Europe', 'Asia');
 
-- 5) Americain : Northern America + Latin America and the Caribbean
UPDATE region
SET continent_code = 2
WHERE name IN ('Northern America', 'Latin America and the Caribbean');
 
-- 6) Oceanien : Oceania
UPDATE region
SET continent_code = 3
WHERE name = 'Oceania';
 
 
SELECT continent_code, name
FROM region
ORDER BY continent_code, name;
 
 
 
 
SELECT
    co.name AS Continent,
    r.name  AS Region,
    s.name  AS Sous_Region,
    c.name  AS Pays
FROM country c
LEFT JOIN subregion s
    ON c.parent_code = s.location_code
LEFT JOIN region r
    ON (c.parent_code = r.location_code)              -- pays rattaché directement à une région
    OR (s.location_code IS NOT NULL
        AND s.parent_code = r.location_code)          -- pays via une sous-région
LEFT JOIN continent co
    ON r.continent_code = co.continent_code
ORDER BY Continent, Region, Sous_Region, Pays;
 
 

 
SELECT
    co.name AS Continent,
    SUM(f."Total Population, as of 1 July (thousands)") AS total_pop_2000
FROM fact_population f
JOIN country c
    ON f.location_code = c.location_code
LEFT JOIN subregion s
    ON c.parent_code = s.location_code
LEFT JOIN region r
    ON (c.parent_code = r.location_code)
    OR (s.location_code IS NOT NULL
        AND s.parent_code = r.location_code)
JOIN continent co
    ON r.continent_code = co.continent_code
WHERE f.year = 2000
GROUP BY co.name
ORDER BY total_pop_2000 DESC;
 
 
 
 
 
SELECT
    co.name AS Continent,
    SUM(f."Total Population, as of 1 July (thousands)") AS total_pop_2023
FROM fact_population f
JOIN country c
    ON f.location_code = c.location_code
LEFT JOIN subregion s
    ON c.parent_code = s.location_code
LEFT JOIN region r
    ON (c.parent_code = r.location_code)
    OR (s.location_code IS NOT NULL
        AND s.parent_code = r.location_code)
JOIN continent co
    ON r.continent_code = co.continent_code
WHERE f.year = 2023
  AND co.name = 'Afro-Eurasien'
GROUP BY co.name;
 
 
 
 
 
 
 
SELECT
    r.name AS Region,
    SUM(f."Total Population, as of 1 July (thousands)") AS total_pop_1966
FROM fact_population f
JOIN country c
    ON f.location_code = c.location_code
LEFT JOIN subregion s
    ON c.parent_code = s.location_code
LEFT JOIN region r
    ON (c.parent_code = r.location_code)
    OR (s.location_code IS NOT NULL
        AND s.parent_code = r.location_code)
JOIN continent co
    ON r.continent_code = co.continent_code
WHERE f.year = 1966
  AND co.name = 'Americain'
GROUP BY r.name
ORDER BY total_pop_1966 DESC;
 
 
 
 
 
 
 
CREATE VIEW v_region_population_by_continent AS
SELECT
    co.name AS continent_name,
    r.name  AS region_name,
    f.year,
    SUM(f."Total Population, as of 1 July (thousands)") AS total_population
FROM fact_population f
JOIN country c
    ON f.location_code = c.location_code
LEFT JOIN subregion s
    ON c.parent_code = s.location_code
LEFT JOIN region r
    ON (c.parent_code = r.location_code)
    OR (s.location_code IS NOT NULL
        AND s.parent_code = r.location_code)
JOIN continent co
    ON r.continent_code = co.continent_code
GROUP BY co.name, r.name, f.year
ORDER BY f.year, co.name, r.name;
 
 
-- Utilisation avec un SELECT :
 
SELECT *
FROM v_region_population_by_continent
WHERE continent_name = 'Americain'
  AND year = 2000
ORDER BY total_population DESC;
 
 
 
CREATE VIEW v_top_region_by_continent AS
SELECT
    v1.continent_name,
    v1.year,
    v1.region_name,
    v1.total_population
FROM v_region_population_by_continent v1
WHERE v1.total_population = (
    SELECT MAX(v2.total_population)
    FROM v_region_population_by_continent v2
    WHERE v2.continent_name = v1.continent_name
      AND v2.year = v1.year
);
 

SELECT *
FROM v_top_region_by_continent
WHERE year = 2000
ORDER BY continent_name;




