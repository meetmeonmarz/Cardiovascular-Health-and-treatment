# insert rows to tables
INSERT INTO patients (idPatients, height, sex, age, weight, ethnicity, systolicBP, diastolicBP, cholesterol, glucose, smokeResponse, vapeResponse,	
					alcoholIntake, physicalActivity,currentCVD)
VALUES ('P001', 146, 'F', 29, 149, 'Hispanic/Latino', 102, 64, 217, 120, 1,	1, 2, 3, 'CV09');

INSERT INTO treatment (idTreatment, idPatients, idResults, lengthPrescribed, idTreatmentPlan)
VALUES ('TR01', 'P005',	'R001',	158,'TRP05');

INSERT INTO cardiovasculardiseases (idCVD, diseaseName )
VALUES ('diseaseName', 'Arrhythmia');

INSERT INTO availabletreatments (idTreatmentPlan, description , type)
VALUES ('TRP01', 'Losartan (antihypertensive)', 'Perscription Medicine');

INSERT INTO availabletreatments (idResults,	systolicFinal,	diastolicFinal,	cholesterolFinal,	glucoseFinal)
VALUES ('R001',	139, 63, 241, 213);

# updating indivial cells. example updates weight of one patient
UPDATE patients
SET weight = 170
WHERE idPAtients = 'P001';

# deleting row from table. example deletes patient info from poatient table and any treatems assosiatedted with that patient
DELETE
FROM patients 
WHERE idPatients='P001';

DELETE
FROM treatment 
WHERE idPatients='P001';

# queries. the following are examples of how the database can be used to analyse data

# find the most common Cardio Vascular desease amoung hispaniscs over 30
select distinct currentCVD, count( currentCVD) as numHispanics
from patients
where idPatients in (select idPatients
					from patients
					where  age > 30 and ethnicity = 'Hispanic/Latino')
group by currentCVD
order by count(currentCVD) desc;

# find most common treatment type for cvd = CV10 aka. Pericardial Disease

select distinct(t.idTreatmentPlan), count(t.idTreatmentPlan) as numGeneralPopulation
from treatment t
where t.idPatients in (select p.idPatients
					from patients p
					where currentCvd =  'CV10')
group by t.idTreatmentPlan
order by count(t.idTreatmentPlan) desc;















