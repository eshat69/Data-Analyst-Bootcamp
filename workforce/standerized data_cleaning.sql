
-- 2. standerizing data
-- 2.1. check unique rows for companies 
SELECT DISTINCT(company)
FROM layoffs_staging2 ;

-- 2.2. trim the extra white spaces and update to the company
SELECT company ,TRIM(company)
FROM layoffs_staging2 ;
UPDATE layoffs_staging2 
SET company = TRIM(company) ;

-- 2.3. check indrustries via ascending order
SELECT DISTINCT industry
FROM layoffs_staging2 
ORDER BY 1 ; 

-- 2.4. select a similer industry with diff name
SELECT * 
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%' ;

-- 2.5. update the indrustry via a similar name 
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%' ;

-- 2.6. check location 
SELECT DISTINCT location 
FROM layoffs_staging2
ORDER BY 1 ;

-- 2.7. check country 
SELECT DISTINCT country 
FROM layoffs_staging2
ORDER BY 1 ;

SELECT DISTINCT country , TRIM(trailing   ',' FROM country)
FROM layoffs_staging2
ORDER BY 1 ;

-- 2.8. update a country 
UPDATE layoffs_staging2
SET country = TRIM(trailing   '.' FROM country)
WHERE country LIKE  'United States%' ; 

-- 2.9. check if the count
SELECT DISTINCT country , TRIM(trailing   '.' FROM country)
FROM layoffs_staging2;

-- 2.1.1 time series standerized 
SELECT `date` 
FROM layoffs_staging2 ;

-- 2.1.2 update date 
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, "%m/%d/%Y");    -- str to date function (`column name` month , day , TEAR)

-- 2.1.3 convert into a date type column 
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE ;  -- date is change type from text to date 

SELECT * FROM layoffs_staging2 ;
