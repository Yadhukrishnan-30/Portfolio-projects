select *
from breast_cancer
;

select distinct differentiate
from breast_cancer
;
select distinct Age
from breast_cancer
;

select max(age)
from breast_cancer
;
SELECT 
    Age,
    CASE
        WHEN AGE BETWEEN 0 AND 21 THEN '0-21'
        WHEN Age BETWEEN 21 AND 30 THEN '21-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Age BETWEEN 51 AND 60 THEN '51-60'
        WHEN Age BETWEEN 61 AND 70 THEN '61-70'
        
        ELSE 'Unknown'
    END AS AGE_GROUPING
FROM breast_cancer
;
Alter table breast_cancer
add column AGE_GROUPING VARCHAR(20)
;
UPDATE breast_cancer
SET AGE_GROUPING =
    CASE
        WHEN AGE BETWEEN 0 AND 21 THEN '0-21'
        WHEN Age BETWEEN 21 AND 30 THEN '21-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Age BETWEEN 51 AND 60 THEN '51-60'
        WHEN Age BETWEEN 61 AND 70 THEN '61-70'
        
        ELSE 'Unknown'
    END 
;

Select `T Stage`, ROUND(AVG(`Survival Months`), 2) AS Avg_Survival_In_Months, `Tumor Size`
FROM breast_cancer
GROUP BY `T Stage`, `Tumor Size`
ORDER BY `T Stage`, `Tumor Size`;


select `Marital Status`, count(*) as Number, avg(`Survival Months`) as Survial_rate
from breast_cancer
group by `Marital Status`
order by `Marital Status` desc; 

SELECT AGE_GROUPING, COUNT(*) AS Patient_Count
FROM breast_cancer
GROUP BY AGE_GROUPING
ORDER BY AGE_GROUPING
;

select AGE_GROUPING, avg(`Tumor Size`) as Avg_Tumor_size
from breast_cancer
group by AGE_GROUPING;

SELECT m.`Marital Status`, t.`T Stage`, ROUND(AVG(b.`Survival Months`), 2) AS Avg_Survival_Months
FROM breast_cancer b
JOIN (SELECT DISTINCT `Marital Status` FROM breast_cancer) m 
    ON b.`Marital Status` = m.`Marital Status`
JOIN (SELECT DISTINCT `T Stage` FROM breast_cancer) t 
    ON b.`T Stage` = t.`T Stage`
GROUP BY m.`Marital Status`, t.`T Stage`
ORDER BY m.`Marital Status`, t.`T Stage`;

SELECT `T Stage`, ROUND(AVG(`Survival Months`), 2) AS Avg_Survival_Months, `Tumor Size`
FROM breast_cancer
GROUP BY `T Stage`, `Tumor Size`
ORDER BY `T Stage`, `Tumor Size`;

SELECT Age, COUNT(*) AS Patient_Count, ROUND(AVG(`Survival Months`), 2) AS Avg_Survival_Months
FROM breast_cancer
GROUP BY `Age`
HAVING AVG(`Survival Months`) > 50
ORDER BY Patient_Count DESC;

SELECT AGE_GROUPING, COUNT(*) AS Total_Patients, AVG(`Survival Months`) AS Average_Survival_Months,
SUM(CASE WHEN Status = 'Alive' THEN 1 ELSE 0 END) * 100 / COUNT(*) AS Survival_Rate
FROM breast_cancer
GROUP BY AGE_GROUPING
order by AGE_GROUPING;

SELECT `T Stage`, COUNT(*) AS Total_Patients, AVG(`Survival Months`) AS Average_Survival_Months,
SUM(CASE WHEN Status = 'Alive' THEN 1 ELSE 0 END) * 100 / COUNT(*) AS Survival_Rate
FROM breast_cancer
GROUP BY `T Stage`;

SELECT `Tumor Size`, COUNT(*) AS Total_Patients,
SUM(CASE WHEN `Survival Months` > 60 THEN 1 ELSE 0 END) * 100 / COUNT(*) AS Percentage_Survived_Over_5_Years
FROM breast_cancer
GROUP BY `Tumor Size`
order by `Tumor Size`;

SELECT `T Stage`, COUNT(*) AS Total_Patients, AVG(`Survival Months`) AS Average_Survival_Months,
SUM(CASE WHEN Status = 'Alive' THEN 1 ELSE 0 END) * 100 / COUNT(*) AS Survival_Rate
FROM breast_cancer
GROUP BY `T Stage`;

SELECT `T Stage`, COUNT(*) AS Total_Patients, SUM(CASE 
WHEN Status = 'Alive' THEN 1 ELSE 0 
END) * 100 / COUNT(*) AS Survival_Rate
FROM breast_cancer
GROUP BY `T Stage`
;
select AGE_GROUPING, differentiate, avg(`Tumor Size`)
from breast_cancer
group by  differentiate, AGE_GROUPING
order by  AGE_GROUPING;

SELECT `Marital Status`, 
       differentiate, 
       ROUND(AVG(`Survival Months`), 2) AS Avg_Survival_Months
FROM breast_cancer
GROUP BY `Marital Status`, differentiate
ORDER BY `Marital Status`, differentiate;


SELECT `Tumor Size`, differentiate, 
       ROUND(AVG(`Survival Months`), 2) AS Avg_Survival_Months,
       SUM(CASE WHEN Status = 'Alive' THEN 1 ELSE 0 END) * 100 / COUNT(*) AS Survival_Rate
FROM breast_cancer
GROUP BY `Tumor Size`,  differentiate
ORDER BY `Tumor Size`,  differentiate
;

SELECT Race, `Marital Status`, 
       COUNT(*) AS Total_Patients,
       ROUND(AVG(`Survival Months`), 2) AS Avg_Survival_Months,
       SUM(CASE WHEN Status = 'Alive' THEN 1 ELSE 0 END) * 100 / COUNT(*) AS Survival_Rate
FROM breast_cancer
GROUP BY Race, `Marital Status`
ORDER BY Race, `Marital Status`;
