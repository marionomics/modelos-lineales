La base de datos "student_data" contiene 34 variables sobre 395 estudiantes de bachillerato en dos escuelas en Portugual. 

Dentro de la base de datos, se enuentran las calificaciones de la clase de matemáticas de tres períodos (en un rango 0 al 20), el promedio de esas calificaciones será la variable de interés.

Como la base de datos contiene variables socioeconomicas interesantes, se busca explicar su relación  con el aprovechamiento de los estudiantes (medido para este proyecto con el promedio de los tres perídos).

La descripción de las variables es la siguiente:

1. school - escuela del estudiante (binaria: "GP" - Gabriel Pereira o "MS" - Mousinho da Silveira)

2. sex - sexo del estudiante (binario: "F" - femenino o "M" - masculino)

3. age - edad del estudiante (numérica: de 15 a 22 años)

4. address - tipo de domicilio del estudiante (binaria: "U" - urbano o "R" - rural)

5. famsize -  tamaño de la familia (binaria: "LE3" - menos o igual a 3 o "GT3" - más de 3) 

6. Pstatus - estado de convivencia de los padres (binaria: "T" - convivencia o "A" - separación)

7. Medu - educación de la madre (numérica: 0 - ninguna, 1 - educación primaria (4º grado), 2 - 5º a 9º grado, 3 - educación secundaria [bachillerato en México] o 4 - educación superior)

8. Fedu - educación del padre (numérica: 0 - ninguna, 1 - educación primaria (4º grado), 2 - 5º a 9º grado, 3 - educación secundaria [bachillerato en México] o 4 - educación superior)

9. Mjob - trabajo de la madre (nominal: "teacher", "health", "services", "at_home" u "other")

10. Fjob - trabajo del padre (nominal: "teacher", "health", "services", "at_home" u "other")

11. reason - razón para elegir esta escuela (nominal: cerca de casa "home", reputación "reputation" de la escuela, preferencia de curso "curse" u otro "other")

12. guardian - tutor del alumno (nominal: "mother", "father" u "other")

13. traveltime - tiempo de viaje de casa a la escuela (numérica: 1 - <15 min., 2 - 15 a 30 min., 3 - 30 min. a 1 hora, o 4 - >1 hora)

14. studytime - tiempo de estudio semanal (numérica: 1 - <2 horas, 2 - 2 a 5 horas, 3 - 5 a 10 horas, o 4 - >10 horas)

15. failures - número de materias reprobadas anteriormente (numérica: de 1 al 4)

16. schoolsup - apoyo escolar adicional (binaria: sí o no)

17. famsup - apoyo familiar adicional (binaria: sí o no)

18. paid - clases extra pagadas dentro de la materia (binaria: sí o no)

19. activities - actividades extraescolares (binaria: sí o no)

20. nursery - asistió a la guardería (binaria: sí o no)

21. higher - deseo de ir a la universidad (binaria: sí o no)

22. internet - acceso a internet en casa (binaria: sí o no)

23. romantic - condición de relación amorosa (binaria: sí o no)

24. famrel - calidad de las relaciones familiares (numérica: de 1 - muy malo a 5 - excelente)

25. freetime - tiempo libre después de la escuela (numérica: de 1 - muy bajo a 5 - muy alto)

26. goout - condición de salir con amigos (numérica: de 1 - muy bajo a 5 - muy alto)

27. Dalc - consumo de alcohol en el día de trabajo (numérica: de 1 - muy bajo a 5 - muy alto)

28. Walc - consumo de alcohol en fin de semana (numérica: de 1 - muy bajo a 5 - muy alto)

29. health - condición de salud actual (numérica: de 1 - muy malo a 5 - muy bueno)

30. absences - número de ausencias escolares (numérica: de 0 a 93)

31. G1 - calificación del primer periodo (numerica: de 0 to 20)

32. G2 - calificación del segundo periodo (numerica: de 0 to 20)

33. G3 - calificación del tercer periodo (numerica: de 0 to 20)

El modelo es:

meang = B0 + B1sex + B2Medu + B3Mjob + B4studytime + B5failures + B6schoolsup + B7famsup + B8higher + B9romantic + B10goout + B11health)

Donde menag = promedio de calificaciones de los tres períodos.