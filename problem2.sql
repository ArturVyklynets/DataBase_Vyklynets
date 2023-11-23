-- Які ціни на квитки діють для різних типів транспорту або різних маршрутів?
SELECT Routes.route_name, TicketPrices.price
FROM Routes
JOIN TicketPrices ON Routes.price_id = TicketPrices.price_id
ORDER BY Routes.route_name;
