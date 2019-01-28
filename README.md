# Exercise_Mysql_BBD
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
    
SELECT a.Origin, b.airport, month,year, avg(DepDelay) as Avg_DepDelay , 
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

SELECT TailNum, distance FROM flights WHERE distance > 0 
ORDER BY distance DESC LIMIT 0,10;


//7.	Companyies amb el seu retard promig només d’aquelles les quals els seus vols 
arriben al seu destí amb un retràs promig major de 10 minuts;
//les dues son possibles;

SELECT UniqueCarrier, Avg(ArrDelay)
FROM Flights
WHERE ArrDelay > 10
group by UniqueCarrier;

SELECT UniqueCarrier, avg(ArrDelay) as Avg_ArrDelay
FROM flights
WHERE ArrDelay>10
GROUP BY UniqueCarrier;
