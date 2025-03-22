create database healthcare_analysis;
use healthcare_analysis;

-- Patient Demographics --

-- Count of patients by gender
SELECT Gender, COUNT(*) AS Patient_Count
FROM Healthcare_Data
GROUP BY Gender;

-- Average age of patients
SELECT AVG(Age) AS Average_Age
FROM Healthcare_Data;

-- Patient Demographics by Age Group
SELECT 
    CASE 
        WHEN Age BETWEEN 0 AND 18 THEN '0-18'
        WHEN Age BETWEEN 19 AND 35 THEN '19-35'
        WHEN Age BETWEEN 36 AND 50 THEN '36-50'
        WHEN Age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '65+'
    END AS Age_Group,
    COUNT(*) AS Patient_Count
FROM Healthcare_Data
GROUP BY Age_Group;

-- Most common diagnoses
SELECT Diagnosis, COUNT(*) AS Diagnosis_Count
FROM Healthcare_Data
GROUP BY Diagnosis
ORDER BY Diagnosis_Count DESC
LIMIT 5;

-- Success rate of treatments
SELECT Treatment, COUNT(*) AS Total_Treatments,
       SUM(CASE WHEN Outcome = 'Successful' THEN 1 ELSE 0 END) AS Successful_Outcomes
FROM Healthcare_Data
GROUP BY Treatment;
select * from healthcare_data
limit 5

-- Hospital Performance (Top Performing Hospitals)
SELECT Hospital, AVG(Hospital_Performance_Rating) AS AvgRating 
FROM Healthcare_Data 
GROUP BY Hospital
ORDER BY AvgRating DESC;

-- Disease Prevalence(Most Common diagnoses)
SELECT Diagnosis, Treatment, COUNT(*) AS Treatment_Count
FROM  Healthcare_Data
GROUP BY Diagnosis, Treatment
ORDER BY Diagnosis, Treatment_Count DESC;

-- Data Validation
SELECT * FROM Healthcare_Data
WHERE Diagnosis IS NULL;

-- Data Anonymization
SELECT 
    CONCAT('Patient_', Patient_ID) AS Anonymized_ID,
    Age, Gender, Diagnosis, Treatment
FROM Healthcare_Data;

