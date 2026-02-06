SELECT * 
FROM workforce.layoffs_staging2 ;

-- check for 100% layed off rows order by total layed off 
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1 
ORDER BY total_laid_off desc ;

-- checking the sum of total layed off 
SELECT company, SUM(total_laid_off) AS total_laid_off_sum
FROM workforce.layoffs_staging2
GROUP BY company
ORDER BY total_laid_off_sum DESC;

-- time period of layed offs
SELECT MIN(`date`) , MAX(`date`)
FROM workforce.layoffs_staging2 ;

-- checking the indrusry most layed off 
SELECT industry, SUM(total_laid_off) AS total_laid_off_ind
FROM workforce.layoffs_staging2
GROUP BY industry
ORDER BY total_laid_off_ind DESC;

-- countries most layed off 
SELECT country , SUM(total_laid_off) AS total_laid_off_cont
FROM workforce.layoffs_staging2
group by country ;

-- expore layed off by date & state
SELECT `date` , SUM(total_laid_off) 
FROM workforce.layoffs_staging2
group by `date` ;

SELECT stage , SUM(total_laid_off) 
FROM workforce.layoffs_staging2
group by stage ;

-- check  mountH via lay off
SELECT SUBSTRING(`DATE`,1,7) AS `MOUNTH` , SUM(total_laid_off)
FROM workforce.layoffs_staging2
WHERE SUBSTRING(`DATE`,1,7) IS NOT NULL 
group by `MOUNTH` 
ORDER BY 1 ASC ;

-- Using CTE for Rolling Totals
WITH ROLLING_TOTAL AS (
    SELECT 
        SUBSTRING(`date`,1,7) AS `month`,
        SUM(total_laid_off) AS total_laid_off
    FROM workforce.layoffs_staging2
    WHERE `date` IS NOT NULL
    GROUP BY SUBSTRING(`date`,1,7)
    ORDER BY `month` ASC
)
SELECT 
    `month`,
    total_laid_off,
    SUM(total_laid_off) OVER (ORDER BY `month`) AS rolling_total
FROM ROLLING_TOTAL;

-- check company's yearly total layoffs
SELECT company , YEAR(`date`) , SUM(total_laid_off)
FROM workforce.layoffs_staging2
GROUP BY company , YEAR(`date`) 
ORDER BY 3 desc ;

-- - CTE  aggregates layoffs per company per year
WITH Company_year (Company, Years, Total_laid_off) AS (
    SELECT company,
           YEAR(`date`) AS Years,
           SUM(total_laid_off) AS Total_laid_off
    FROM workforce.layoffs_staging2
    GROUP BY company, YEAR(`date`)
)
SELECT *,
       DENSE_RANK() OVER (
           PARTITION BY Years
           ORDER BY Total_laid_off DESC
       ) AS rank_by_year
FROM Company_year
WHERE years IS NOT NULL 
ORDER BY rank_by_year ASC ;

-- ranking in each year's laied offs by multiple CTE
WITH Company_year (Company, Years, Total_laid_off) AS (
    SELECT company,
           YEAR(`date`) AS Years,
           SUM(total_laid_off) AS Total_laid_off
    FROM workforce.layoffs_staging2
    GROUP BY company, YEAR(`date`)
) , Company_Year_Ranking AS (
	SELECT *,
		   DENSE_RANK() OVER (
			   PARTITION BY Years
			   ORDER BY Total_laid_off DESC
		   ) AS rank_by_year
	FROM Company_year
	WHERE years IS NOT NULL 
 ) 
 SELECT * 
 FROM Company_Year_Ranking 
 WHERE rank_by_year <= 5  ;
 