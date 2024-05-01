
--a)Ποια είναι τα φάρµακα που συνταγογραφούνται;
--Στο αποτέλεσµα πρέπει να
--εµφανίζονται ποσότητα και όνοµα φαρµάκου.


select name, count(drugs.id) as drug_amount, drugs.id
from drugs,medical_folder
where drugs.id = medical_folder.drug_id
group by drugs.id;




--b) Ποιες είναι οι διαγνώσεις της τελευταίας εβδοµάδας;

select diagnosis
from appointments
where t >= '4/25/2017 0:11' and diagnosis is not null;





--c)Ποια είναι τα ραντεβού του γιατρού ‘X’ τον τελευταία µήνα;

select appointments.id, doctor.surname
from appointments, doctor
where doctor.surname = 'Garcia'  and appointments.doctoramka = doctor.doctoramka 
and appointments.t >= '5/1/2017 0:06';


--d) Ποιοι είναι οι ασθενείς που
--τους έχουν δει παραπάνω από ένας γιατροί;

select patient.patientamka ,patient.surname, count(distinct appointments.doctoramka)
from patient,appointments
where patient.patientamka = appointments.patientamka 
group by patient.patientamka
having count(distinct appointments.doctoramka) > 2;



--e)Από ποιο τµήµα έχουν εξεταστεί οι περισσότεροι ασθενείς;

select departments.id, count(distinct appointments.patientamka)
from departments, doctor, appointments
where  departments.id = doctor.speciality and doctor.doctoramka = appointments.doctoramka
group by departments.id
order by count(distinct appointments.patientamka) desc
limit 1;


--f)
--Ποιος είναι ο µέσος αριθµός των ασθενών που 
--έχουν εξεταστεί (δηλαδή, υπάρχει
--διάγνωση) ανά τµήµα;

	


select avg(result1)
from (select  count(distinct appointments.patientamka) as result1
	from patient,appointments,doctor,departments
	where appointments.patientamka = patient.patientamka and appointments.doctoramka = doctor.doctoramka and departments.id = doctor.speciality
	and diagnosis is not null 
	group by departments.id) tab;