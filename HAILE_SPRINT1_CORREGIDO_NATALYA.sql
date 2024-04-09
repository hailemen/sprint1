# Nivel 1 - Exercici 2: Realitza la següent consulta: Has d'obtenir el nom, email i país de cada companyia, ordena les dades en funció del nom de les companyies.

SELECT company_name, email, country
FROM company
order by company_name ASC;

# Nivel 1 - Exercici 3: Des de la secció de màrqueting et sol·liciten que els passis un llistat dels països que estan fent compres.

SELECT DISTINCT country AS Paises_que_estan_haciendo_compras
FROM company
JOIN transaction
ON company.id = transaction.company_id;

# Nivel 1 - Exercici 4: Des de màrqueting també volen saber des de quants països es realitzen les compres.

SELECT COUNT(DISTINCT company.country) AS Cantidad_de_paises_donde_se_hacen_compras
FROM company
JOIN transaction
ON company.id = transaction.company_id;

# Nivel 1 - Exercici 5: El teu cap identifica un error amb la companyia que té aneu 'b-2354'. Per tant, et sol·licita que li indiquis el país i nom de 
# companyia d'aquest aneu.

SELECT DISTINCT country AS País, company_name AS Compañia
FROM company
WHERE id = "b-2354";

# Nivel 1 - Exercici 6: A més, el teu cap et sol·licita que indiquis quina és la companyia amb major despesa mitjana

SELECT company.company_name AS Compañía, ROUND(AVG(transaction.amount), 2) AS Transacciones_Medias
FROM company
JOIN transaction
ON company.id = transaction.company_id
GROUP BY Compañía
ORDER BY Transacciones_Medias DESC 
LIMIT 1;

# Nivel 2 - Exercici  1: El teu cap està redactant un informe de tancament de l'any i et sol·licita que li enviïs informació rellevant per al document. 
# Per a això et sol·licita verificar si en la base de dades existeixen companyies amb identificadors (aneu) duplicats.

SELECT id as Empresas_con_registros_duplicados
FROM company
GROUP BY id
HAVING COUNT(id) > 1;

# Nivel 2 - Exercici 2: En quin dia es van realitzar les cinc vendes més costoses? Mostra la data de la transacció i la sumatòria de la quantitat de diners.

SELECT date(timestamp) AS Fecha, SUM(amount) Importe_Ventas_Más_Costosas
FROM transaction
GROUP BY Fecha
ORDER BY Importe_Ventas_Más_Costosas DESC 
LIMIT 5;

# Nivel 2 - Exercici 3: En quin dia es van realitzar les cinc vendes de menor valor? Mostra la data de la transacció i la sumatòria de la quantitat de diners.

SELECT date(timestamp) AS FECHA, SUM(amount) AS MONTO
FROM transaction
GROUP BY FECHA
ORDER BY MONTO ASC 
LIMIT 5;

# Nivel 2 - Exercici 4: Quina és la mitjana de despesa per país? Presenta els resultats ordenats de major a menor mitjà.

SELECT company.country AS País, ROUND(AVG(transaction.amount), 2) AS Transacciones_Medias
FROM company
JOIN transaction
ON company.id = transaction.company_id
GROUP BY company.country
ORDER BY Transacciones_Medias DESC;

# Nivel 3 - Exercici 1:Presenta el nom, telèfon i país de les companyies, juntament amb la quantitat total gastada, d'aquelles que van
#           realitzar transaccions amb una despesa compresa entre 100 i 200 euros. Ordena els resultats de major a menor quantitat gastada. 

SELECT company.company_name AS Compañia, company.phone AS Telefono, company.country AS Pais, transaction.amount AS Importe
FROM company
JOIN transaction
ON company.id = transaction.company_id
WHERE transaction.amount BETWEEN 100 AND 200 AND transaction.declined = 0
ORDER BY Importe DESC;

# Nivel 3 - Exercici 2: Indica el nom de les companyies que van fer compres el 16 de març del 2022, 28 de febrer del 2022 i 13 de febrer del 2022.
SELECT date(timestamp) AS Fecha, company.company_name AS Compañia
FROM company
JOIN transaction
ON company.id = transaction.company_id
WHERE date(timestamp) IN ("2022-03-16", "2022-02-28", "2022-03-13")
ORDER BY Fecha ;

