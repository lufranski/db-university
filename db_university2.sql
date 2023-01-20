-- 20/01/2023

-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT YEAR(`enrolment_date`), COUNT(*) 
FROM `students` 
GROUP BY YEAR(`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT `office_address`, COUNT(*)
FROM `teachers`
GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT `exam_id`, AVG(`vote`) 
FROM `exam_student` 
GROUP BY `exam_id`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT `department_id`, COUNT(*) 
FROM `degrees` 
GROUP BY `department_id`;

-- 5. Selezionare tutti gli studenti iscritti al corso di Laurea in Economia

SELECT degrees.name, students.*
FROM degrees
    JOIN students
        ON degrees.id = students.degree_id
WHERE degrees.name LIKE 'Corso di Laurea in Economia';

-- 6. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze 

SELECT departments.name, degrees.*
FROM departments
    JOIN degrees
        ON departments.id = degrees.department_id
WHERE departments.name LIKE 'Dipartimento di Neuroscienze'
    AND degrees.level LIKE 'magistrale';

-- 7. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT teachers.name, teachers.surname, courses.*
FROM teachers
    JOIN course_teacher
        ON teachers.id = course_teacher.teacher_id
    JOIN courses
        ON course_teacher.course_id = courses.id
WHERE teachers.id = 44;

-- 8. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT students.surname, students.name, departments.*, degrees.*
FROM departments
    JOIN degrees
        ON departments.id = degrees.department_id
    JOIN students
        ON degrees.id = students.degree_id
ORDER BY students.surname;