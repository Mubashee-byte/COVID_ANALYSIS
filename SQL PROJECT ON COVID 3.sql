USE SCHOOL;

SELECT * FROM COVID;

-- ----------------------------------------------------------------------------------------------------------------------------

-- TASK 1: TOTAL CONFIRMED CASES IN INDIA
SELECT SUM([TOTAL_CONFIRMED_CASES]) AS TOTAL_CONFIRMED_CASES
FROM COVID;

-- FIND TOTAL CONFIRMED COVID-19 CASES IN INDIA

-- ----------------------------------------------------------------------------------------------------------------------------

-- TASK 2: STATE WITH HIGHEST DEATHS
SELECT TOP 1 [NAME_OF_STATE_UT], MAX([DEATHS]) AS HIGHEST_DEATHS
FROM COVID
GROUP BY [NAME_OF_STATE_UT]
ORDER BY HIGHEST_DEATHS DESC;

-- FIND THE STATE WITH THE HIGHEST NUMBER OF DEATHS

-- ----------------------------------------------------------------------------------------------------------------------------

-- TASK 3: STATES WITH MORE THAN 10000 RECOVERIES
SELECT [NAME_OF_STATE_UT], [CURED_DISCHARGED_MIGRATED]
FROM COVID
WHERE [CURED_DISCHARGED_MIGRATED] > 10000;

-- LIST STATES THAT HAVE MORE THAN 10,000 RECOVERIES

-- ----------------------------------------------------------------------------------------------------------------------------

-- TASK 4: AVERAGE DEATHS PER STATE
SELECT [NAME_OF_STATE_UT], AVG([CURED_DISCHARGED_MIGRATED]) AS AVERAGE_DEATHS
FROM COVID
GROUP BY [NAME_OF_STATE_UT];

-- CALCULATE AVERAGE NUMBER OF DEATHS PER STATE

-- ----------------------------------------------------------------------------------------------------------------------------

-- TASK 5: TOTAL RECOVERED AND CONFIRMED BY STATE
SELECT [NAME_OF_STATE_UT], 
       SUM([TOTAL_CONFIRMED_CASES]) AS TOTAL_CONFIRMED, 
       SUM([CURED_DISCHARGED_MIGRATED]) AS TOTAL_RECOVERED
FROM COVID
GROUP BY [NAME_OF_STATE_UT];

-- SHOW TOTAL CONFIRMED AND RECOVERED CASES FOR EACH STATE

-- ----------------------------------------------------------------------------------------------------------------------------

-- TASK 6: TOP 5 STATES WITH MOST CONFIRMED CASES
SELECT TOP 5 [NAME_OF_STATE_UT], MAX([TOTAL_CONFIRMED_CASES]) AS MAX_CONFIRMED
FROM COVID
GROUP BY [NAME_OF_STATE_UT]
ORDER BY MAX_CONFIRMED DESC;

-- DISPLAY TOP 5 STATES WITH THE HIGHEST CONFIRMED CASES

-- ----------------------------------------------------------------------------------------------------------------------------

-- TASK 7: STATES WITH ZERO DEATHS
SELECT DISTINCT [NAME_OF_STATE_UT]
FROM COVID
WHERE [DEATHS] = 0;

-- FIND ALL STATES WHERE NO DEATHS WERE REPORTED

-- ----------------------------------------------------------------------------------------------------------------------------

-- TASK 8: STATES HAVING MORE RECOVERIES THAN CONFIRMED (DATA ERROR CHECK)
SELECT [NAME_OF_STATE_UT], [TOTAL_CONFIRMED_CASES], [CURED_DISCHARGED_MIGRATED]
FROM COVID
WHERE [CURED_DISCHARGED_MIGRATED] > [TOTAL_CONFIRMED_CASES];

-- SHOW POSSIBLE DATA ERRORS WHERE RECOVERED CASES ARE MORE THAN CONFIRMED

-- ----------------------------------------------------------------------------------------------------------------------------

-- TASK 9: COUNT RECORDS FOR EACH STATE
SELECT [NAME_OF_STATE_UT], COUNT(*) AS RECORDS
FROM COVID
GROUP BY [NAME_OF_STATE_UT]
ORDER BY RECORDS DESC;

-- COUNT HOW MANY RECORDS EXIST FOR EACH STATE

-- ----------------------------------------------------------------------------------------------------------------------------

-- TASK 10: HIGHEST RECOVERY TO CONFIRMED RATIO
SELECT TOP 1 
    [NAME_OF_STATE_UT], 
    SUM([CURED_DISCHARGED_MIGRATED]) * 1.0 / NULLIF(SUM([TOTAL_CONFIRMED_CASES]), 0) AS RECOVERY_RATIO
FROM COVID
GROUP BY [NAME_OF_STATE_UT]
ORDER BY RECOVERY_RATIO DESC;

-- FIND STATE WITH BEST RECOVERY RATIO

-- ----------------------------------------------------------------------------------------------------------------------------

-- TASK 11: PERCENTAGE OF DEATHS PER CONFIRMED CASES
SELECT [NAME_OF_STATE_UT], 
       SUM([DEATHS]) * 100.0 / NULLIF(SUM([TOTAL_CONFIRMED_CASES]), 0) AS DEATH_PERCENTAGE
FROM COVID
GROUP BY [NAME_OF_STATE_UT];

-- CALCULATE DEATH PERCENTAGE FOR EACH STATE

-- ----------------------------------------------------------------------------------------------------------------------------

-- TASK 12: STATE WITH LOWEST RECOVERED CASES
SELECT TOP 1 [NAME_OF_STATE_UT], MIN([CURED_DISCHARGED_MIGRATED]) AS LEAST_RECOVERED
FROM COVID
GROUP BY [NAME_OF_STATE_UT]
ORDER BY LEAST_RECOVERED ASC;

-- IDENTIFY THE STATE WITH THE LOWEST NUMBER OF RECOVERED CASES

-- ----------------------------------------------------------------------------------------------------------------------------

-- TASK 13: STATES WITH CONFIRMED CASES BETWEEN 5000 AND 20000
SELECT [NAME_OF_STATE_UT], [TOTAL_CONFIRMED_CASES]
FROM COVID
WHERE [TOTAL_CONFIRMED_CASES] BETWEEN 5000 AND 20000;

-- SHOW STATES THAT HAVE CONFIRMED CASES BETWEEN 5,000 AND 20,000

-- ----------------------------------------------------------------------------------------------------------------------------

-- TASK 14: TOTAL SUMMARY FOR ENTIRE DATASET
SELECT 
    SUM([TOTAL_CONFIRMED_CASES]) AS TOTAL_CONFIRMED,
    SUM([CURED_DISCHARGED_MIGRATED]) AS TOTAL_RECOVERED,
    SUM([DEATHS]) AS TOTAL_DEATHS
FROM COVID;

-- DISPLAY FULL SUMMARY TOTALS FOR CONFIRMED, RECOVERED, DEATHS

-- ----------------------------------------------------------------------------------------------------------------------------

-- TASK 15: CHECK FOR NULL OR MISSING DATA
SELECT *
FROM COVID
WHERE [TOTAL_CONFIRMED_CASES] IS NULL 
   OR [CURED_DISCHARGED_MIGRATED] IS NULL 
   OR [DEATHS] IS NULL 
   OR [NAME_OF_STATE_UT] IS NULL;

-- IDENTIFY RECORDS WITH MISSING VALUES IN KEY COLUMNS

-- ----------------------------------------------------------------------------------------------------------------------------

-- FINAL DATASET CHECK
SELECT * FROM COVID;
