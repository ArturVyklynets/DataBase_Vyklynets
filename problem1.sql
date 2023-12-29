-- Отримання проміжних станцій
SELECT s.name_station, i.sequence
FROM IntermediateStations i
JOIN Stations s ON i.station_id = s.station_id
WHERE i.route_id = 1
ORDER BY i.sequence;

