-- Які маршрути є оптимальними для автобусів/тролейбусів/трамваїв?
SELECT r.route_name, v.type_vehicle
FROM Routes r
JOIN Vehicles v ON r.vehicle_id = v.vehicle_id
WHERE v.type_vehicle = 'автобус';
