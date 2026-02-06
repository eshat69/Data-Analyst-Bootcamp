SELECT * FROM layoffs_staging2 ;

-- 3.1 checking column for null 
SELECT * FROM layoffs_staging2 
WHERE total_laid_off IS NULL  ;

-- 3.2 checking relatable multi column for null 
SELECT * FROM layoffs_staging2 
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL   ;

-- 3.3 checking indrustry while null or blank 
SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
or industry = '' ;

-- 3.4 checking for a random company
SELECT * FROM layoffs_staging2
WHERE company = 'Airbnb' ;

-- 3.5. joining same table for fillup nulls on the insrustry 
SELECT * 
FROM layoffs_staging2 t1           						     -- a table 
JOIN layoffs_staging2 t2      		  					  	 -- self table
	ON t1.company = t2.company   						     -- both same company
    AND t1.location = t2.location  						     -- both is same location 
WHERE (t1.industry IS NULL OR t1.industry = '' )      	     -- 1st one's value is NULL
AND t2.industry IS NOT NULL ;    		 					 -- 2nd one's value is not NULL 

SELECT t1.industry , t2.industry                             -- only select 2 intrustry table in 2 column
FROM layoffs_staging2 t1           						     -- a table 
JOIN layoffs_staging2 t2      		  					  	 -- self table           
	ON t1.company = t2.company   						     -- both same company
    AND t1.location = t2.location  						     -- both is same location 
WHERE (t1.industry IS NULL OR t1.industry = '' )      	     -- 1st one's value is NULL
AND t2.industry IS NOT NULL ;    		 					 -- 2nd one's value is not NULL 

-- 3.6. updating blank spaces industry as NULL 
UPDATE layoffs_staging2
SET industry = NULL 
WHERE industry = '' ;

-- 3.7. update the indrusry which has null 
UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry 
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL ;
    
-- 3.8. check industry is any null 
SELECT t1.industry , t2.industry                         
FROM layoffs_staging2 t1           						
JOIN layoffs_staging2 t2      		  					  
	ON t1.company = t2.company   						   
    AND t1.location = t2.location  						    
WHERE (t1.industry IS NULL OR t1.industry = '' )      	     
AND t2.industry IS NOT NULL ;

-- 3.9. checking for total_layed_off , percentage_layed_off and funds_raised_million are NULL 
SELECT * FROM layoffs_staging2 
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL 
AND funds_raised_millions IS NULL ;

-- 3.1.1 delete total_layed_off , percentage_layed_off and funds_raised_million which are NULL 
DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL 
AND funds_raised_millions IS NULL ;

-- 3.1.2 check total_layed_off , percentage_layed_off are NULL
SELECT * FROM layoffs_staging2 
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL  ;

-- 3.1.3. drop the row_no column
ALTER TABLE layoffs_staging2
DROP COLUMN row_no ;

-- 3.1.4. check table
SELECT * FROM layoffs_staging2 ;


