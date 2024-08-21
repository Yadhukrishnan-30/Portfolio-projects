select *
FROM `healthcare_`.`dataset main`;

UPDATE `dataset main`
SET 
    Name = UPPER (Name);

Alter table `dataset main`
ADD COLUMN `ADMISSION_DATE_FORMATTED` DATE,
ADD COLUMN `DISCHARGE_DATE` DATE;

UPDATE `dataset main`
SET 
    `ADMISSION_DATE_FORMATTED` = STR_TO_DATE(`Date of Admission`, '%m/%d/%Y'),
    `DISCHARGE_DATE` = STR_TO_DATE(`Discharge Date`, '%m/%d/%Y');
    
ALTER TABLE `dataset main`
drop column `date of admission`,
drop column `Discharge Date`;
    

ALTER TABLE `healthcare_`.`dataset main`
RENAME COLUMN  new_column_name TO `Name`;

select distinct `Medical Condition`
from `healthcare_`.`dataset main`
;

Select Distinct Age, Gender, count(*) Gender, `Admission Type`
from `healthcare_`.`dataset main`
group by Age, Gender, `Admission Type`
;

select distinct `Medical Condition`, count(*) `Medical Condition`
from `dataset main`
group by `Medical Condition`
;

SELECT Age, Gender, `Medical Condition`, COUNT(*) AS ConditionCount
FROM `dataset main`
GROUP BY Age, Gender, `Medical Condition`
ORDER BY ConditionCount DESC;
    
select distinct Hospital, round(avg(`Billing Amount`),2)
from `dataset main`
group by Hospital
order by hospital;

SELECT `Medical Condition`, Gender,
    CASE 
        WHEN Age BETWEEN 0 AND 18 THEN '0-18'
        WHEN Age BETWEEN 19 AND 35 THEN '19-35'
        WHEN Age BETWEEN 36 AND 55 THEN '36-55'
        WHEN Age > 55 THEN '55+'
    END AS Age_Group,
    COUNT(*) AS Patient_Count,
    AVG(`Billing Amount`) AS Avg_Billing_Amount
FROM `dataset main`
GROUP BY 
    `Medical Condition`, Gender, Age_Group
ORDER BY 
     `Medical Condition`, Age_Group, Gender;


select Doctor, `Medical Condition`, `Admission Type`
from `dataset main`
group by Doctor, `Medical Condition`,`Admission Type`
order by `Medical Condition`
;

select `Medical Condition`, avg(datediff(DISCHARGE_DATE,ADMISSION_DATE_FORMATTED))
from `dataset main`
GROUP BY `Medical Condition` 
ORDER BY `Medical Condition`  
;

select `Insurance Provider`, avg(`billing amount`)
from `dataset main`
group by `Insurance Provider`;

Select `Medical Condition`, `Blood Type`
from `dataset main`
where `Blood Type` = "B-" and `Medical Condition`= "Cancer";

select `Medical Condition`, `Blood Type`, count(*) `Blood Type`
from `dataset main`
group by `Blood Type`, `Medical Condition`
;

select `Medical Condition`, `Medication`, `Admission Type`,`Test Results`
from `dataset main`
where `Admission Type`= "Emergency" and `Test results` = "Normal"
order by medication;

select *
from `dataset main`    












