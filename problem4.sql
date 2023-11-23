-- Як дістатися з точки А в точку Б
SELECT r1.route_name AS route1, s1.name_station AS departure_station_1, s2.name_station AS intermediate_station,
       r2.route_name AS route2, s3.name_station AS departure_station_2, s4.name_station AS arrival_station
FROM Routes r1
JOIN Stations s1 ON r1.start_station_id = s1.station_id
JOIN Stations s2 ON r1.end_station_id = s2.station_id
JOIN Schedules schedules_departure_1 ON r1.route_id = schedules_departure_1.route_id AND s1.station_id = schedules_departure_1.station_id
JOIN Schedules schedules_intermediate ON r1.route_id = schedules_intermediate.route_id AND s2.station_id = schedules_intermediate.station_id
JOIN Routes r2 ON r2.start_station_id = s2.station_id
JOIN Stations s3 ON r2.start_station_id = s3.station_id
JOIN Stations s4 ON r2.end_station_id = s4.station_id
JOIN Schedules schedules_departure_2 ON r2.route_id = schedules_departure_2.route_id AND s3.station_id = schedules_departure_2.station_id
JOIN Schedules schedules_arrival ON r2.route_id = schedules_arrival.route_id AND s4.station_id = schedules_arrival.station_id
WHERE s1.name_station = 'ТЦ Велес' AND s4.name_station = 'вул. Коновальця'
      AND schedules_departure_1.departure_time < schedules_intermediate.arrival_time
      AND schedules_intermediate.departure_time < schedules_arrival.arrival_time;

