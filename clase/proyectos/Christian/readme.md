Base de datos insurance
La base de datos insurance, refleja a información de los costos médicos de 1338 personas en ciertas regiones de los EU.

Las columnas que conforman la base de datos son las siguientes:
Age <- Edad del asegurado
Sex <- Genero del asegurado (male,female)
BMI <- Indice de masa corporal
Children <- Número de hijos del asegurado / dependientes 
Smoker <- Fuma o no (yes,no)
Region <- Area de EU donde vive el asegurado (northeast, southeast, southwest, northwest)
Charges <- Costos individuales pagados por asegurado

Se pretende crear un modelo, que utilizando estas variables, pueda predecir los costos médicos individuales de cada persona. 

Se carga a la carpeta base de datos insurance.csv, script.r