select * from layoffs ;  -- orginal dataset from KAGGLE 
-- https://www.kaggle.com/datasets/swaptr/layoffs-2022

-- Safely drop the table if it exists & create a staging table and insert values
DROP TABLE IF EXISTS layoffs_staging;
CREATE TABLE layoffs_staging 
LIKE layoffs ;
INSERT layoffs_staging 
SELECT * FROM workforce.layoffs ;

-- 1. check out buplicates and remove 
-- 2. standerized data & fix
-- 3. null & blank values
-- 4. remove any column or row 

-- 1.1. check out buplicates and remove 
SELECT *
FROM workforce.layoffs_staging   -- check the staging tables 
;

-- 1.2. make a column for find the no of repeat data
SELECT * ,
		ROW_NUMBER() OVER (
			PARTITION BY company, industry, total_laid_off, percentage_laid_off ,`date`) AS row_no 
	FROM 
		workforce.layoffs_staging;
        
-- 1.3. check for duplicate values 
with duplicate_cte as 
(
	SELECT * ,
		ROW_NUMBER() OVER (
			PARTITION BY company,location, industry, total_laid_off, percentage_laid_off ,`date`, stage, country, funds_raised_millions) AS row_no 
	FROM workforce.layoffs_staging ) 
SELECT * FROM duplicate_cte 
		where row_no > 1 ;
        
-- 1.4. check a random selected duplicate company
SELECT * FROM layoffs_staging
WHERE company = 'casper' ;

-- 1.5 
SELECT * ,
	ROW_NUMBER() OVER (
		PARTITION BY company,location, industry, total_laid_off, percentage_laid_off ,`date`, stage, country, funds_raised_millions) AS row_no 
	FROM workforce.layoffs_staging ;
    
-- -> layoff_staging --> copy to clipboard --> create statement --> paste
-- 1.6. create a new table named layout_sataging2 with a extra column row_no 
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL ,
  `row_no` int 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 1.7. check the new table's rows 
SELECT * 
FROM layoffs_staging2 ;
 
-- 1.9. intert the values to the layoffs_staging2 table 
INSERT INTO layoffs_staging2
SELECT * ,
	ROW_NUMBER() OVER (
		PARTITION BY company,location, industry, total_laid_off, percentage_laid_off ,`date`, stage, country, funds_raised_millions) AS row_no 
	FROM workforce.layoffs_staging ;

-- 1,1,1 check the table that the value is properly insert or not and check duplicates
SELECT * 
FROM layoffs_staging2
WHERE row_no > 1 ;

-- 1.1.2 delete the duplicates rows
DELETE 
FROM layoffs_staging2
WHERE row_no > 1 ;
-- 1.1.3 check the table 
select * 
FROM layoffs_staging2 ;

