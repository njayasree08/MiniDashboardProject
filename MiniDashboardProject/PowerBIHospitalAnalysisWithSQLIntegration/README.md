**Hospital Management Analysis**

**With SQL Integration**

**Creating Table**


-- Department Table
-- Doctors Table
-- Patient Table
-- Admissions Table
-- Billing Table

Inserting 100's Of Hospital Record

**Hospital Analysis with SQL Integration**

select count (*) as TotalPatient
from Patient


select count (*) as TotalAdmission
from Admissions

select sum(TotalAmount) as revenue
from Billing


select avg(Treatmentcost) 
from Billing

select
D.DoctorName,
count (A.AdmissionID) AS Patientandled
From Admissions A
join Doctors D 
on A.DoctorID = D.DoctorID
group by D.DoctorName
order by Patientandled DESC

select
Dep.DepartmentName,
count (A.AdmissionID) AS Patientcount
From Admissions A
join Department Dep 
on A.DepartmentID = Dep.DepartmentID
group by Dep.DepartmentName
order by Patientcount DESC

SELECT
    Dep.DepartmentName,
    COUNT(B.TotalAmount) AS Revenue
FROM Billing B
JOIN Admissions A
    ON B.AdmissionID = A.AdmissionID
JOIN Department Dep
    ON A.DepartmentID = Dep.DepartmentID
GROUP BY Dep.DepartmentName
ORDER BY Revenue DESC;

SELECT
    D.DoctorName,
    COUNT(A.AdmissionID) AS PatientHandle
FROM Doctors D
JOIN Admissions A
    ON D.DoctorID = A.DoctorID
GROUP BY D.DoctorName
ORDER BY PatientHandle DESC;

SELECT
    EXTRACT(MONTH FROM AdmitDate) AS Month,
    COUNT(*) AS PatientHandle
FROM Admissions
GROUP BY EXTRACT(MONTH FROM AdmitDate)
ORDER BY Month;

SELECT
    Dep.DepartmentName,
    EXTRACT(MONTH FROM A.AdmitDate) AS Month,
    COUNT(A.AdmissionID) AS PatientHandle
FROM Department Dep
JOIN Admissions A
    ON Dep.DepartmentID = A.DepartmentID
GROUP BY Dep.DepartmentName, EXTRACT(MONTH FROM A.AdmitDate)
ORDER BY Month, PatientHandle DESC;

SELECT
    D.DoctorName,
    EXTRACT(MONTH FROM A.AdmitDate) AS Month,
    COUNT(A.AdmissionID) AS PatientHandle
FROM Doctors D
JOIN Admissions A
    ON D.DoctorID = A.DoctorID
GROUP BY D.DoctorName, EXTRACT(MONTH FROM A.AdmitDate)
ORDER BY Month, PatientHandle DESC;
