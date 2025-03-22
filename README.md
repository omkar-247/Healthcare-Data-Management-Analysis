# Healthcare Data Management Analysis

## Project Overview
This project focuses on analyzing healthcare data to derive insights into patient demographics, disease prevalence, treatment outcomes, and hospital performance. The goal is to ensure compliance with privacy regulations (HIPAA) while performing analytics on sensitive healthcare data.

## Key Skills Demonstrated
- **SQL:** Data retrieval, filtering, aggregation, and joins.
- **Data Analysis:** Calculating metrics like average age, treatment success rates, and hospital performance.
- **Data Anonymization:** Masking patient names and IDs to ensure privacy.
- **Data Visualization:** Creating dashboards using Power BI.
- **Data Cleaning:** Working with Excel, CSV, and SQL data formats.

## Files in the Repository
- **Data/**
  - `Healthcare_Data_Management.csv`: Patient data in CSV format.
- **SQL/**
  - `Hospital_Data_Management.sql`: SQL queries for data analysis.
- **Dashboard/**
  - `healthcare_data_management_dashboard.pdf`: Power BI dashboard for hospital performance and treatment trends.

    
## Project Workflow
1. **Data Collection:** Collected patient data from multiple sources (Excel, CSV).
2. **Data Cleaning:** Cleaned and preprocessed the data to handle missing values and inconsistencies.
3. **Data Analysis:** Used SQL to analyze patient demographics, disease prevalence, and treatment outcomes.
4. **Data Visualization:** Created a Power BI dashboard to visualize hospital performance and treatment trends.
5. **Data Anonymization:** Implemented techniques to mask patient IDs and ensure HIPAA compliance.

## Key Insights from the Analysis
### 1. Patient Demographics
- **Average Age of Patients:** 52 years.
- **Gender Distribution:** 55% Female, 45% Male.
- **Age Group Analysis:** 
  - 0-18: 10%
  - 19-35: 20%
  - 36-50: 30%
  - 51-65: 25%
  - 65+: 15%

### 2. Disease Prevalence
- **Most Common Diagnoses:**
  1. Heart Disease (15%)
  2. Diabetes (14%)
  3. Hypertension (13%)
  4. Asthma (12%)
  5. Cancer (10%)

### 3. Treatment Outcomes
- **Success Rate of Treatments:**
  - Medication: 70%
  - Surgery: 65%
  - Therapy: 60%
  - Vaccination: 75%

### 4. Hospital Performance
- **Top-Performing Hospitals:**
  1. General Hospital (Avg Rating: 4.5)
  2. St. Mary's Hospital (Avg Rating: 4.2)
  3. City Clinic (Avg Rating: 3.8)

### 5. Data Anonymization
- **Anonymized Patient IDs:** `Patient_1001`, `Patient_1002`, etc.
- **Compliance:** Ensured compliance with HIPAA regulations.


---

## Power BI Dashboard Overview
The **Power BI dashboard** was created to visualize key insights from the healthcare data analysis. It provides an interactive and user-friendly way to explore patient demographics, disease prevalence, treatment outcomes, and hospital performance metrics.

### Key Features of the Dashboard
1. **Hospital Performance Metrics:**
   - Displays the average performance rating of each hospital.
   - Allows users to filter by hospital, diagnosis, or treatment type.

2. **Diagnosis Distribution:**
   - Visualizes the most common diagnoses (e.g., Heart Disease, Diabetes, Hypertension).
   - Uses bar charts or pie charts to show the percentage distribution of diagnoses.

3. **Treatment Success Rates:**
   - Shows the success rates of different treatments (e.g., Medication, Surgery, Therapy).
   - Includes filters for diagnosis and hospital.

4. **Patient Demographics:**
   - Provides insights into patient age groups and gender distribution.
   - Uses stacked bar charts or donut charts for visualization.

5. **Interactive Filters:**
   - Includes slicers for filtering data by:
     - Hospital
     - Diagnosis
     - Treatment
     - Age Group
     - Gender

### Power BI Components Used
- **Data Model:**
  - Created relationships between tables (e.g., Patients, Hospitals, Treatments).
  - Used DAX (Data Analysis Expressions) to calculate key metrics like:
    - Average Hospital Performance Rating
    - Treatment Success Rate
    - Diagnosis Prevalence

- **Visualizations:**
  - Bar Charts: For diagnosis distribution and treatment success rates.
  - Pie Charts: For gender and age group distribution.
  - Tables: For displaying raw data with filters applied.
  - Line Charts: For treatment trends over time.
  - Slicers: For interactive filtering.

- **DAX Formulas:**
  - **Average Hospital Performance Rating:**
    ```DAX
    AvgRating = AVERAGE(Healthcare_Data[Hospital_Performance_Rating])
    ```
  - **Treatment Success Rate:**
    ```DAX
    SuccessRate = 
    DIVIDE(
        CALCULATE(COUNT(Healthcare_Data[Outcome]), 
        FILTER(Healthcare_Data, Healthcare_Data[Outcome] = "Successful")
    )
    ```
  - **Diagnosis Prevalence:**
    ```DAX
    DiagnosisCount = COUNT(Healthcare_Data[Diagnosis])
    ```

### How to Use the Dashboard
1. Open the `healthcare_data_management_dashboard.pbix` file in Power BI Desktop.
2. Use the **slicers** to filter data by hospital, diagnosis, treatment, age group, or gender.
3. Explore the visualizations to gain insights into patient demographics, disease prevalence, and treatment outcomes.

### Screenshots
![Power BI Dashboard](https://github.com/omkar-247/Healthcare-Data-Management-Analysis/blob/main/Screenshot%202025-03-22%20212603.png)

### **SQL Queries **

```sql
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

-- Hospital Performance (Top Performing Hospitals)
SELECT Hospital, AVG(Hospital_Performance_Rating) AS AvgRating 
FROM Healthcare_Data 
GROUP BY Hospital
ORDER BY AvgRating DESC;

-- Disease Prevalence (Most Common Diagnoses)
SELECT Diagnosis, Treatment, COUNT(*) AS Treatment_Count
FROM Healthcare_Data
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
```
## Links
Here are some useful links to explore this project further:

- **GitHub Repository:** [Healthcare-Data-Management-Analysis](https://github.com/omkar-247/Healthcare-Data-Management-Analysis)
- **Power BI Dashboard:** [View Dashboard](https://github.com/omkar-247/Healthcare-Data-Management-Analysis/blob/main/HealthCare%20Data%20Management.pbix)
- **SQL Queries:** [Explore SQL Code](https://github.com/omkar-247/Healthcare-Data-Management-Analysis/blob/main/Hospital%20Data%20Management.sql)
- **Raw Data:** [Access Data Files](https://github.com/omkar-247/Healthcare-Data-Management-Analysis/blob/main/Healthcare_Data_Management.csv)
