SELECT * FROM usflights.flights;
//1;
SELECT COUNT(*) FROM usflights.flights;
//2;
  select origin , avg(DepDelay) as Avg_DepDelay , 
  avg(ArrDelay) as Avg_ArrDelay
    from usflights.flights
group by origin;
//3;
  select origin ,month,year, avg(DepDelay) as Avg_DepDelay , 
  avg(ArrDelay) as Avg_ArrDelay
    from usflights.flights
group by origin,month,year;
//4.	Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen (mateixa consulta que abans i amb el mateix ordre). Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat.
		Los Angeles, 2000, 01, retard;
		
SELECT b.airport, month,year, avg(DepDelay) as Avg_DepDelay , 
  avg(ArrDelay) as Avg_ArrDelay
FROM usflights.flights a
LEFT JOIN usflights.airports b ON a.Origin = b.iata
group by b.airport,month,year;

  //5.	Les companyies amb més vols cancelats. A més, han d’estar ordenades de forma 
  que les companyies amb més cancel·lacions apareguin les primeres.;
SELECT COUNT(cancelled), uniquecarrier
FROM flights
WHERE cancelled > 0
GROUP BY uniquecarrier
ORDER BY count(cancelled) desc;

//6.	L’identificador dels 10 avions que més distància han recorregut fent vols;

SELECT SUM(distance), tailnum
FROM flights
GROUP BY tailnum
ORDER BY sum(distance) desc
LIMIT 10;

//7.	Companyies amb el seu retard promig només d’aquelles les quals els seus vols 
arriben al seu destí amb un retràs promig major de 10 minuts;
//les dues son possibles;

SELECT UniqueCarrier, avg(ArrDelay)
FROM flights
GROUP BY UniqueCarrier
HAVING avg(ArrDelay)>10
ORDER BY avg(ArrDelay) DESC;
