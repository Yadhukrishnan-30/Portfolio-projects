select *
from studentscoring
;
select Exam_Score
from studentscoring
where Exam_Score=101
;
select Attendance
from studentscoring
where Attendance is NOT NULL
;
delete from studentscoring
where Exam_Score=101
;
select Parental_Education_Level
from studentscoring
where Parental_Education_Level =""
;
DELETE FROM studentscoring
WHERE Parental_Education_Level = "" OR Parental_Education_Level IS NULL
;
select Distance_from_Home
from studentscoring
where Distance_from_Home = "" 
;
delete from studentscoring
where Distance_from_Home = "" or Distance_from_Home is NULL
;
select Teacher_Quality
from studentscoring
where Teacher_Quality = "" or Teacher_Quality is NULL
;
delete from studentscoring
where Teacher_Quality = "" or Teacher_Quality is NULL
;
select distinct Parental_Involvement, avg(Hours_Studied)
from studentscoring
group by Parental_Involvement
;
SELECT 
    School_Type, 
    Exam_Score,
    RANK() OVER (PARTITION BY School_Type ORDER BY Exam_Score DESC) AS Rank_in_School
FROM studentscoring
;
select Exam_Score
from studentscoring
where Exam_Score > 80
;
#Calculate the average, minimum, and maximum exam score for all students.

select avg(Exam_Score), min(Exam_Score), max(Exam_Score)
from studentscoring
;

#Find the total number of students for each School_Type.

select School_Type, count(School_Type) as Count
from studentscoring
group by School_Type
;

#Calculate the average attendance for students grouped by Parental_Education_Level.
select Parental_Education_Level, avg(Attendance)
from studentscoring
group by Parental_Education_Level
;

select count(Motivation_Level) as Count_of_Motivation_level
from studentscoring
where Motivation_Level = "High"
;
select round(count(Exam_Score)/ 6378 *100,2) as Percentage_of_Exam_score
from studentscoring
where Exam_Score > 90
;
#Retrieve students who have an Exam_Score between 60 and 80.

select Exam_Score as Exam_Score_between_60_80 
from studentscoring
where Exam_Score between 60 and 80
;

# Find all students who live "Far" from school and have a Motivation_Level of "Low."
select Distance_from_Home, Motivation_Level
from studentscoring
where Distance_from_Home = "Far" and Motivation_Level = "Low"
;
#List all students with an exam score between 60 and 80.
select Exam_Score, `Unique ID`
from studentscoring
where Exam_Score > 60 and Exam_Score <80
;
#Retrieve all students who have participated in extracurricular activities and 
# have "Private" school type.
select Extracurricular_Activities, School_Type
from studentscoring
where Extracurricular_Activities = "Yes" and School_Type="Private"
;
#Find the average exam score for each combination of school type and gender.
select *
from (select  School_Type, avg(Exam_Score) as Avg_exam_score, Gender
from studentscoring
where Gender="Male"
group by School_Type) as b
join 
(select  School_Type, avg(Exam_Score) as Avg_exam_score, Gender
from studentscoring
where Gender="Female"
group by School_Type) as c
on b.School_type=c.School_type
;
#Count the number of students for each "motivation_level".
select Motivation_Level, count(`Unique ID`) as Count_of_motivation 
from studentscoring
group by Motivation_Level
;
#Retrieve the maximum and minimum exam score for students with "Medium" access to resources.
select max(Exam_Score),min(Exam_Score), Access_to_Resources
from studentscoring
where Access_to_Resources ="Medium"
;
#Calculate the average exam score for each "peer_influence" category
select Peer_Influence, round(avg(Exam_Score),1) as Avg_exam_score
from studentscoring
group by Peer_Influence
;
select round(avg(Exam_Score)) as avg_exam_score, `Unique ID`
from studentscoring
where Exam_Score > 67
group by `Unique ID`
;
#Retrieve the students whose "previous_scores" are greater than the average score in the dataset.
select round(avg(Previous_Scores)) as previous_exam_score, `Unique ID`
from studentscoring
where Previous_Scores > 67
group by `Unique ID`
;
#Rank students within each school type by 
#their exam score, and display the rank along with their details.
select School_Type, 
Exam_Score,rank()over(partition by School_Type order by Exam_Score) as Rank_ww,
row_number()over() as row_numbers
from studentscoring
;
select `Unique ID`, Hours_Studied, 
rank()over(partition by Hours_Studied order by Exam_Score) as Rank_over_exam_score, Exam_Score
from studentscoring
;
#Rank students by exam score
select Exam_Score, `Unique ID`, rank()over(order by Exam_Score)
from studentscoring
;
select Hours_Studied, 
case
when Hours_Studied between 1 and 5 then "1-5"
when Hours_Studied between 6 and 10 then "6-10"
when Hours_Studied between 11 and 15 then "11-15"
when Hours_Studied between 16 and 20 then "16-20"
when Hours_Studied between 21 and 25 then "21-25"
when Hours_Studied between 26 and 30 then "26-30"
when Hours_Studied between 31 and 35 then "31-35"
when Hours_Studied between 36 and 40 then "36-40"
when Hours_Studied between 41 and 45 then "41-45"
end as HH
from studentscoring
group by Hours_Studied

































