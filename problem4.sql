-- Як дістатися з точки А в точку Б
SELECT DISTINCT r.route_name
FROM Routes r
JOIN IntermediateStations ia ON r.route_id = ia.route_id
JOIN Stations sa ON ia.station_id = sa.station_id AND sa.name_station = 'Кобзарик'
JOIN IntermediateStations ib ON r.route_id = ib.route_id
JOIN Stations sb ON ib.station_id = sb.station_id AND sb.name_station = 'Надія'
WHERE ia.sequence < ib.sequence;


