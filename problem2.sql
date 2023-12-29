-- Пошук цін на квитки
SELECT tp.price, tp.type_vehicle
FROM ticketprices tp
WHERE tp.type_vehicle = 'Тролейбус';
