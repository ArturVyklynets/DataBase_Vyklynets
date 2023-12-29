-- Знаходження розкладу маршруту
SELECT r.route_name, s.departure_time, s.arrival_time, tp.type_vehicle
FROM Routes r
JOIN Schedules s ON r.route_id = s.route_id
JOIN BusesSchedules bs ON s.schedule_id = bs.schedule_id
JOIN TicketPrices tp ON bs.price_id = tp.price_id
WHERE r.route_name = 'Хоткевича - Автостанція №3';
