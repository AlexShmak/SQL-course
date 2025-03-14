------------------------------------------------------------------------------------------------------------------------
-- 1. Общее количество забронированных мест (эконом- и бизнес-класса) в каждом рейсе
------------------------------------------------------------------------------------------------------------------------
SELECT F.FLIGHT_NUMBER,
       SUM(FB.ECONOMY_CLASS_SEATS_BOOKED)  AS TOTAL_ECONOMY_SEATS_BOOKED,
       SUM(FB.BUSINESS_CLASS_SEATS_BOOKED) AS TOTAL_BUSINESS_SEATS_BOOKED
FROM FLIGHT F
         JOIN
     FLIGHT_BOOKINGS FB ON F.FLIGHT_BOOKING_ID = FB.FLIGHT_BOOKING_ID
GROUP BY F.FLIGHT_NUMBER;

------------------------------------------------------------------------------------------------------------------------
-- 2. Данные покупателя, ID заказа, количество пассажиров, прикрепленных к заказу
------------------------------------------------------------------------------------------------------------------------
SELECT C.CUSTOMER_ID,
       C.FIRST_NAME,
       C.LAST_NAME,
       B.BOOKING_ID,
       COUNT(P.PASSENGER_ID) AS NUMBER_OF_PASSENGERS
FROM CUSTOMER C
         JOIN
     BOOKING B ON C.CUSTOMER_ID = B.CUSTOMER_ID
         LEFT JOIN
     PASSENGER P ON B.BOOKING_ID = P.BOOKING_ID
GROUP BY C.CUSTOMER_ID, B.BOOKING_ID;

------------------------------------------------------------------------------------------------------------------------
-- 3. Рейсы без заказов (нет таких)
------------------------------------------------------------------------------------------------------------------------
SELECT F.FLIGHT_NUMBER,
       F.DEPARTURE_DATE,
       F.ARRIVAL_DATE
FROM FLIGHT F
         LEFT JOIN
     BOOKING B ON F.FLIGHT_ID = B.FLIGHT_ID
WHERE B.BOOKING_ID IS NULL;

------------------------------------------------------------------------------------------------------------------------
-- 4. Самый популярный способ платежа
------------------------------------------------------------------------------------------------------------------------
SELECT PAYMENT_METHOD,
       COUNT(*) AS NUMBER_OF_BOOKINGS
FROM BOOKING
GROUP BY PAYMENT_METHOD
ORDER BY NUMBER_OF_BOOKINGS DESC
LIMIT 1;

------------------------------------------------------------------------------------------------------------------------
-- 5. Средняя цена билета в эконом- и бизнес-классе
------------------------------------------------------------------------------------------------------------------------
SELECT 'Economy'                         AS SERVICE_CLASS,
       AVG(S.ECONOMY_CLASS_TICKET_PRICE) AS AVERAGE_TICKET_PRICE
FROM SERVICE_CLASSES_INFO S
UNION ALL
SELECT 'Business'                         AS SERVICE_CLASS,
       AVG(S.BUSINESS_CLASS_TICKET_PRICE) AS AVERAGE_TICKET_PRICE
FROM SERVICE_CLASSES_INFO S;

------------------------------------------------------------------------------------------------------------------------
-- 6. Рейсы, в которых больше, чем X заказов
------------------------------------------------------------------------------------------------------------------------
SELECT F.FLIGHT_NUMBER,
       COUNT(B.BOOKING_ID) AS TOTAL_BOOKINGS
FROM FLIGHT F
         JOIN
     BOOKING B ON F.FLIGHT_ID = B.FLIGHT_ID
GROUP BY F.FLIGHT_NUMBER
HAVING COUNT(B.BOOKING_ID) > 1;

------------------------------------------------------------------------------------------------------------------------
-- 7. История заказов покупателя (покупатель с ID = 2)
------------------------------------------------------------------------------------------------------------------------
SELECT C.FIRST_NAME,
       C.LAST_NAME,
       B.BOOKING_ID,
       B.BOOKING_DATE_TIME,
       F.FLIGHT_NUMBER,
       F.DEPARTURE_DATE,
       F.ARRIVAL_DATE
FROM CUSTOMER C
         JOIN
     BOOKING B ON C.CUSTOMER_ID = B.CUSTOMER_ID
         JOIN
     FLIGHT F ON B.FLIGHT_ID = F.FLIGHT_ID
WHERE C.CUSTOMER_ID = 2;

------------------------------------------------------------------------------------------------------------------------
-- 8. Сотрудники и рейсы, на которые они назначены
------------------------------------------------------------------------------------------------------------------------
SELECT E.FIRST_NAME,
       E.LAST_NAME,
       E.OCCUPATION,
       F.FLIGHT_NUMBER
FROM EMPLOYEE E
         JOIN
     FLIGHT_SERVICE FS ON E.FLIGHT_SERVICE_ID = FS.FLIGHT_SERVICE_ID
         JOIN
     FLIGHT F ON FS.FLIGHT_SERVICE_ID = F.FLIGHT_SERVICE_ID;

------------------------------------------------------------------------------------------------------------------------
-- 9. Booking Count by Month
------------------------------------------------------------------------------------------------------------------------
SELECT DATE_TRUNC('month', B.BOOKING_DATE_TIME) AS MONTH,
       COUNT(B.BOOKING_ID)                      AS TOTAL_BOOKINGS
FROM BOOKING B
GROUP BY MONTH
ORDER BY MONTH;

------------------------------------------------------------------------------------------------------------------------
-- 10. Рейсы с проблемой вместимости (количество забронированных мест превышает реальную вместимость самолета, у нас такого нет, всё хорошо)
------------------------------------------------------------------------------------------------------------------------
SELECT F.FLIGHT_NUMBER,
       A.MODEL,
       (FB.ECONOMY_CLASS_SEATS_BOOKED + FB.BUSINESS_CLASS_SEATS_BOOKED) AS TOTAL_BOOKED_SEATS,
       A.CAPACITY
FROM FLIGHT F
         JOIN
     FLIGHT_BOOKINGS FB ON F.FLIGHT_BOOKING_ID = FB.FLIGHT_BOOKING_ID
         JOIN
     FLIGHT_SERVICE FS ON F.FLIGHT_SERVICE_ID = FS.FLIGHT_SERVICE_ID
         JOIN
     AIRCRAFT A ON FS.AIRCRAFT_ID = A.AIRCRAFT_ID
WHERE (FB.ECONOMY_CLASS_SEATS_BOOKED + FB.BUSINESS_CLASS_SEATS_BOOKED) > A.CAPACITY;

------------------------------------------------------------------------------------------------------------------------
-- 11. Топ 5 покупателей по количеству заказов
------------------------------------------------------------------------------------------------------------------------
SELECT C.CUSTOMER_ID,
       C.FIRST_NAME,
       C.LAST_NAME,
       COUNT(B.BOOKING_ID) AS TOTAL_BOOKINGS
FROM CUSTOMER C
         JOIN
     BOOKING B ON C.CUSTOMER_ID = B.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID
ORDER BY TOTAL_BOOKINGS DESC
LIMIT 5;

------------------------------------------------------------------------------------------------------------------------
-- 12. Отчет о загруженности рейсов со средним количеством забронированных мест (среди эконом- и бизнес-класса)
------------------------------------------------------------------------------------------------------------------------
SELECT F.FLIGHT_NUMBER,
       COUNT(B.BOOKING_ID)                                                 AS TOTAL_BOOKINGS,
       AVG(FB.ECONOMY_CLASS_SEATS_BOOKED + FB.BUSINESS_CLASS_SEATS_BOOKED) AS AVERAGE_SEATS_BOOKED
FROM FLIGHT F
         LEFT JOIN
     BOOKING B ON F.FLIGHT_ID = B.FLIGHT_ID
         LEFT JOIN
     FLIGHT_BOOKINGS FB ON F.FLIGHT_BOOKING_ID = FB.FLIGHT_BOOKING_ID
GROUP BY F.FLIGHT_NUMBER;