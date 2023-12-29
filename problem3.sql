-- Виведення переліку маршрутів зі станції
SELECT r.route_name, s.name_station as start_station
FROM routes r
JOIN stations s ON r.start_station_id = s.station_id
WHERE s.name_station = 'Каскад';
