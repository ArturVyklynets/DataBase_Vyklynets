-- Як можна планувати рейси для кожної станції на основі розкладів та часу прибуття/відправлення транспорту?
SELECT s.name_station, COUNT(*) AS number_of_departures
FROM Stations s
JOIN Schedules ON s.station_id = Schedules.station_id
GROUP BY s.name_station
ORDER BY number_of_departures DESC;


