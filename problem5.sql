-- Знаходження середнього часу проїзду маршуруту
SELECT route_id, AVG(TIMESTAMPDIFF(MINUTE, departure_time, arrival_time)) AS average_travel_time_minutes
FROM Schedules
GROUP BY route_id;
