------------------------------------------------------------------------------------------------------------------------
-- Представление для получения информации о рейсах с количеством забронированных мест
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW flight_info AS
SELECT F.FLIGHT_ID,
       F.FLIGHT_NUMBER,
       F.DEPARTURE_DATE,
       F.ARRIVAL_DATE,
       FB.ECONOMY_CLASS_SEATS_BOOKED,
       FB.BUSINESS_CLASS_SEATS_BOOKED
FROM FLIGHT F
         JOIN FLIGHT_BOOKINGS FB ON F.FLIGHT_BOOKING_ID = FB.FLIGHT_BOOKING_ID;

------------------------------------------------------------------------------------------------------------------------
-- Представление для получения информации о клиентах и их бронированиях
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW customer_bookings AS
SELECT C.CUSTOMER_ID, C.FIRST_NAME, C.LAST_NAME, B.BOOKING_ID, B.BOOKING_DATE_TIME
FROM CUSTOMER C
         JOIN BOOKING B ON C.CUSTOMER_ID = B.CUSTOMER_ID;

------------------------------------------------------------------------------------------------------------------------
-- Представление для получения отчетов о загруженности рейсов
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW flight_load_report AS
SELECT F.FLIGHT_NUMBER, COUNT(B.BOOKING_ID) AS TOTAL_BOOKINGS
FROM FLIGHT F
         LEFT JOIN BOOKING B ON F.FLIGHT_ID = B.FLIGHT_ID
GROUP BY F.FLIGHT_NUMBER
HAVING COUNT(B.BOOKING_ID) > 0;