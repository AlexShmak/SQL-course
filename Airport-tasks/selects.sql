-- Запрос для получения всех рейсов с фильтрацией по дате
SELECT *
FROM FLIGHT
WHERE DEPARTURE_DATE > CURRENT_TIMESTAMP
ORDER BY DEPARTURE_DATE;

-- Запрос для получения информации о клиенте по email
SELECT *
FROM CUSTOMER
WHERE EMAIL = 'john@example.com';

-- Запрос для получения всех бронирований клиента
SELECT *
FROM BOOKING
WHERE CUSTOMER_ID = 1;

-- Запрос для получения информации о рейсах с количеством забронированных мест
SELECT *
FROM flight_info
WHERE ECONOMY_CLASS_SEATS_BOOKED > 0;

-- Запрос для получения отчета о загруженности рейсов
SELECT *
FROM flight_load_report;

-- Запрос для получения информации о рейсах с использованием подзапроса
SELECT *
FROM FLIGHT
WHERE FLIGHT_ID IN (SELECT FLIGHT_ID FROM BOOKING WHERE CUSTOMER_ID = 1);

-- Запрос для получения клиентов с количеством бронирований
SELECT C.CUSTOMER_ID, C.FIRST_NAME, C.LAST_NAME, COUNT(B.BOOKING_ID) AS BOOKING_COUNT
FROM CUSTOMER C
         LEFT JOIN BOOKING B ON C.CUSTOMER_ID = B.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID
HAVING COUNT(B.BOOKING_ID) > 0;

-- Запрос для получения рейсов с использованием внешнего соединения
SELECT F.FLIGHT_NUMBER, A.NAME AS DEPARTURE_AIRPORT, A2.NAME AS ARRIVAL_AIRPORT
FROM FLIGHT F
         LEFT JOIN AIRPORT A ON F.DEPARTURE_AIRPORT_ID = A.AIRPORT_ID
         LEFT JOIN AIRPORT A2 ON F.ARRIVAL_AIRPORT_ID = A2.AIRPORT_ID;

-- Запрос для получения информации о рейсах с фильтрацией по классу обслуживания
SELECT F.FLIGHT_NUMBER, SCI.ECONOMY_CLASS_TOTAL_SEATS, FB.ECONOMY_CLASS_SEATS_BOOKED
FROM FLIGHT F
         JOIN SERVICE_CLASSES_INFO SCI ON F.SERVICE_CLASSES_INFO_ID = SCI.SERVICE_CLASSES_INFO_ID
         JOIN FLIGHT_BOOKINGS FB ON F.FLIGHT_BOOKING_ID = FB.FLIGHT_BOOKING_ID
WHERE SCI.ECONOMY_CLASS_TOTAL_SEATS > FB.ECONOMY_CLASS_SEATS_BOOKED;

-- Запрос для получения информации о клиентах с использованием подзапроса
SELECT *
FROM CUSTOMER
WHERE CUSTOMER_ID IN (SELECT CUSTOMER_ID FROM BOOKING WHERE FLIGHT_ID = 1);

-- Запрос для получения всех рейсов с количеством забронированных мест и сортировкой по загруженности
SELECT F.FLIGHT_NUMBER, FB.ECONOMY_CLASS_SEATS_BOOKED, FB.BUSINESS_CLASS_SEATS_BOOKED
FROM FLIGHT F
         JOIN FLIGHT_BOOKINGS FB ON F.FLIGHT_BOOKING_ID = FB.FLIGHT_BOOKING_ID
ORDER BY (FB.ECONOMY_CLASS_SEATS_BOOKED + FB.BUSINESS_CLASS_SEATS_BOOKED) DESC;

-- Запрос для получения информации о рейсах с использованием объединения
SELECT FLIGHT_NUMBER
FROM FLIGHT
UNION
SELECT FLIGHT_NUMBER
FROM FLIGHT
WHERE DEPARTURE_DATE < CURRENT_TIMESTAMP;