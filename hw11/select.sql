
SELECT trip_no,ID_psg,place,price,SUM(price) AS Sumprice_by_ticket,
CASE
    WHEN ID_psg = 1 THEN 'Bruce Willis'
    WHEN ID_psg = 34 THEN 'Dmitriy Yugai'
    ELSE 'Другие'
  END AS 'Остальные пассажиры'
 FROM Pass_in_trip 
 GROUP BY price WITH ROLLUP
 HAVING SUMPRICE_BY_TICKET > 10000;
