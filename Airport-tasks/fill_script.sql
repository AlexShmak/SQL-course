-- ------------------------------------------------------------------------------------------------------------------------
-- -- Заполнение базы тестовыми данными
-- ------------------------------------------------------------------------------------------------------------------------
-- INSERT INTO AIRCRAFT (MODEL, CAPACITY)
-- VALUES ('Boeing 737', 180),
--        ('Airbus A320', 150),
--        ('Boeing 747', 416);
--
-- INSERT INTO AIRPORT (NAME, CITY, COUNTRY)
-- VALUES ('Pulkovo Airport', 'Saint-Petersburg', 'Russia'),
--        ('Islam Karimov Tashkent International Airport', 'Tashkent', 'Uzbekistan'),
--        ('Manas International Airport', 'Bishkek', 'Kyrgyzstan'),
--        ('Ashgabat International Airport', 'Ashgabat', 'Turkmenistan'),
--        ('Nursultan Nazarbayev International Airport', 'Astana', 'Kazakhstan'),
--        ('Minsk National Airport', 'Minsk', 'Belarus');
--
-- INSERT INTO SERVICE_CLASSES_INFO (ECONOMY_CLASS_TOTAL_SEATS,
--                                   BUSINESS_CLASS_TOTAL_SEATS,
--                                   ECONOMY_CLASS_TICKET_PRICE,
--                                   BUSINESS_CLASS_TICKET_PRICE)
-- VALUES (150, 30, 50000, 100000),
--        (100, 50, 60000, 120000),
--        (80, 40, 35000, 80000);
--
-- INSERT INTO FLIGHT_SERVICE (AIRCRAFT_ID)
-- VALUES (1),
--        (2),
--        (3);
--
-- INSERT INTO EMPLOYEE (FIRST_NAME, LAST_NAME, OCCUPATION, FLIGHT_SERVICE_ID)
-- VALUES
--     -- Crew 1
--     ('Artur', 'Pilotyan', 'Pilot', 1),
--     ('Amaliya', 'Cabinyan', 'Cabin Crew', 1),
--     ('Robert', 'Maintanov', 'Maintenance', 1),
--     ('Anna', 'Pilotova', 'Pilot', 1),
--     ('Mihail', 'Cruev', 'Cabin Crew', 1),
--     -- Crew 2
--     ('Alik', 'Pilotyanw-Two', 'Pilot', 2),
--     ('Anna', 'Cabinyan-Two', 'Cabin Crew', 2),
--     ('Damir', 'Maintanov-Two', 'Maintenance', 2),
--     ('Olga', 'Pilotova-Two', 'Pilot', 2),
--     ('Egor', 'Cruev-Two', 'Cabin Crew', 2),
--     -- Crew 3
--     ('Aleksey', 'Pilotyan-Three', 'Pilot', 3),
--     ('Irina', 'Cabinyan-Three', 'Cabin Crew', 3),
--     ('Daler', 'Maintanov-Three', 'Maintenance', 3),
--     ('Ekaterina', 'Pilotova-Three', 'Pilot', 3),
--     ('Valeriy', 'Cruev-Three', 'Cabin Crew', 3),
--     -- Crew 4
--     ('Andrey', 'Pilotyan-Four', 'Pilot', 3),
--     ('Irina', 'Cabinyan-Four', 'Cabin Crew', 3),
--     ('Daler', 'Maintanov-Four', 'Maintenance', 3),
--     ('Ekaterina', 'Pilotova-Four', 'Pilot', 3),
--     ('Valeriy', 'Cruev-Four', 'Cabin Crew', 3);
--
-- INSERT INTO CUSTOMER (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
-- VALUES ('Alisa', 'Taylorova', 'alice.taylor@example.com', '1234567890'),
--        ('David', 'Clarkov', 'david.clark@example.com', '0987654321'),
--        ('Anna', 'Martynova', 'anna.martinez@example.com', '5678901234'),
--        ('Oskar', 'Garcov', 'oliver.garcia@example.com', '4567890123'),
--        ('Sophia', 'Hermanovich', 'sophia.hermanovich@example.com', '2345678901');
--
-- -- Flight_booking_id не передаётся, так как он автоматически генерируется и добавляется с помощью триггера
-- INSERT INTO FLIGHT (FLIGHT_NUMBER,
--                     DEPARTURE_DATE,
--                     ARRIVAL_DATE,
--                     DEPARTURE_AIRPORT_ID,
--                     ARRIVAL_AIRPORT_ID,
--                     FLIGHT_SERVICE_ID,
--                     SERVICE_CLASSES_INFO_ID)
-- VALUES ('TS123', '2024-12-05 10:00:00', '2024-12-05 14:00:00', 1, 2, 1, 1),
--        ('BK456', '2024-12-06 15:00:00', '2024-12-06 19:00:00', 2, 3, 2, 2),
--        ('AG789', '2024-12-07 20:00:00', '2024-12-08 01:00:00', 3, 4, 3, 3);
--
-- INSERT INTO BOOKING (BOOKING_DATE_TIME, PAYMENT_METHOD, RESERVED_SEATS, CUSTOMER_ID, FLIGHT_ID)
-- VALUES ('2024-12-01 09:00:00', 'Credit Card', ARRAY [1, 2, 3], 1, 1),
--        ('2024-12-01 10:00:00', 'Debit Card', ARRAY [4, 5], 2, 2),
--        ('2024-12-02 11:00:00', 'Cash', ARRAY [6, 7, 8], 3, 3);
--
-- INSERT INTO PASSENGER (FIRST_NAME, LAST_NAME, PASSPORT_NUMBER, CITIZENSHIP, BOOKING_ID)
-- VALUES ('Maria', 'Ivanova', 'A123456', 'Russia', 1),
--        ('Nargiza', 'Shuhratova', 'C987654', 'Uzbekistan', 2),
--        ('Kayrat', 'Nazarbaev', 'E876543', 'Kazakhstan', 3);

------------------------------------------------------------------------------------------------------------------------
-- Заполнение базы тестовыми данными
------------------------------------------------------------------------------------------------------------------------

-- Aircraft
INSERT INTO AIRCRAFT (MODEL, CAPACITY)
VALUES ('Boeing 737', 180),
       ('Airbus A320', 150),
       ('Boeing 747', 416),
       ('Airbus A380', 555),
       ('Boeing 777', 396),
       ('Embraer E195', 120),
       ('Bombardier CRJ900', 90),
       ('McDonnell Douglas MD-80', 150);

-- Airport
INSERT INTO AIRPORT (NAME, CITY, COUNTRY)
VALUES ('Pulkovo Airport', 'Saint-Petersburg', 'Russia'),
       ('Islam Karimov Tashkent International Airport', 'Tashkent', 'Uzbekistan'),
       ('Manas International Airport', 'Bishkek', 'Kyrgyzstan'),
       ('Ashgabat International Airport', 'Ashgabat', 'Turkmenistan'),
       ('Nursultan Nazarbayev International Airport', 'Astana', 'Kazakhstan'),
       ('Minsk National Airport', 'Minsk', 'Belarus'),
       ('Sheremetyevo International Airport', 'Moscow', 'Russia'),
       ('Almaty International Airport', 'Almaty', 'Kazakhstan');

-- Service Classes Info
INSERT INTO SERVICE_CLASSES_INFO (ECONOMY_CLASS_TOTAL_SEATS,
                                  BUSINESS_CLASS_TOTAL_SEATS,
                                  ECONOMY_CLASS_TICKET_PRICE,
                                  BUSINESS_CLASS_TICKET_PRICE)
VALUES (150, 30, 50000, 100000),
       (100, 50, 60000, 120000),
       (80, 40, 35000, 80000),
       (200, 50, 70000, 150000),
       (120, 30, 45000, 90000),
       (90, 20, 30000, 70000),
       (160, 40, 55000, 110000),
       (110, 25, 65000, 130000);

-- Flight Service
INSERT INTO FLIGHT_SERVICE (AIRCRAFT_ID)
VALUES (1),
       (2),
       (3),
       (4),
       (5),
       (6),
       (7),
       (8);

-- Employee
INSERT INTO EMPLOYEE (FIRST_NAME, LAST_NAME, OCCUPATION, FLIGHT_SERVICE_ID)
VALUES
    -- Crew 1
    ('Artur', 'Pilotyan', 'Pilot', 1),
    ('Amaliya', 'Cabinyan', 'Cabin Crew', 1),
    ('Robert', 'Maintanov', 'Maintenance', 1),
    ('Anna', 'Pilotova', 'Pilot', 1),
    ('Mihail', 'Cruev', 'Cabin Crew', 1),
    -- Crew 2
    ('Alik', 'Pilotyanw-Two', 'Pilot', 2),
    ('Anna', 'Cabinyan-Two', 'Cabin Crew', 2),
    ('Damir', 'Maintanov-Two', 'Maintenance', 2),
    ('Olga', 'Pilotova-Two', 'Pilot', 2),
    ('Egor', 'Cruev-Two', 'Cabin Crew', 2),
    -- Crew 3
    ('Aleksey', 'Pilotyan-Three', 'Pilot', 3),
    ('Irina', 'Cabinyan-Three', 'Cabin Crew', 3),
    ('Daler', 'Maintanov-Three', 'Maintenance', 3),
    ('Ekaterina', 'Pilotova-Three', 'Pilot', 3),
    ('Valeriy', 'Cruev-Three', 'Cabin Crew', 3),
    -- Crew 4
    ('Andrey', 'Pilotyan-Four', 'Pilot', 3),
    ('Irina', 'Cabinyan-Four', 'Cabin Crew', 3),
    ('Daler', 'Maintanov-Four', 'Maintenance', 3),
    ('Ekaterina', 'Pilotova-Four', 'Pilot', 3),
    ('Valeriy', 'Cruev-Four', 'Cabin Crew', 3),
    -- Crew 5
    ('Sergey', 'Pilotyan-Five', 'Pilot', 4),
    ('Tatiana', 'Cabinyan-Five', 'Cabin Crew', 4),
    ('Igor', 'Maintanov-Five', 'Maintenance', 4),
    ('Elena', 'Pilotova-Five', 'Pilot', 4),
    ('Vladimir ', 'Cruev-Five', 'Cabin Crew', 4);

-- Customer
INSERT INTO CUSTOMER (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES ('Alisa', 'Taylorova', 'alice.taylor@example.com', '1234567890'),
       ('David', 'Clarkov', 'david.clark@example.com', '0987654321'),
       ('Anna', 'Martynova', 'anna.martinez@example.com', '5678901234'),
       ('Oskar', 'Garcov', 'oliver.garcia@example.com', '4567890123'),
       ('Sophia', 'Hermanovich', 'sophia.hermanovich@example.com', '2345678901'),
       ('Maxim', 'Petrov', 'maxim.petrov@example.com', '3456789012'),
       ('Daria', 'Sidorova', 'daria.sidorova@example.com', '4567890123'),
       ('Igor', 'Kuznetsov', 'igor.kuznetsov@example.com', '5678901234');

-- Flight
INSERT INTO FLIGHT (FLIGHT_NUMBER,
                    DEPARTURE_DATE,
                    ARRIVAL_DATE,
                    DEPARTURE_AIRPORT_ID,
                    ARRIVAL_AIRPORT_ID,
                    FLIGHT_SERVICE_ID,
                    SERVICE_CLASSES_INFO_ID)
VALUES ('TS123', '2024-12-05 10:00:00', '2024-12-05 14:00:00', 1, 2, 1, 1),
       ('BK456', '2024-12-06 15:00:00', '2024-12-06 19:00:00', 2, 3, 2, 2),
       ('AG789', '2024-12-07 20:00:00', '2024-12-08 01:00:00', 3, 4, 3, 3),
       ('FL101', '2024-12-08 08:00:00', '2024-12-08 12:00:00', 4, 5, 1, 2),
       ('FL202', '2024-12-09 09:00:00', '2024-12-09 13:00:00', 5, 6, 2, 3),
       ('FL303', '2024-12-10 14:00:00', '2024-12-10 18:00:00', 6, 7, 3, 1),
       ('FL404', '2024-12-11 16:00:00', '2024-12-11 20:00:00', 7, 8, 1, 2),
       ('FL505', '2024-12-12 11:00:00', '2024-12-12 15:00:00', 8, 1, 2, 3);

-- Booking
INSERT INTO BOOKING (BOOKING_DATE_TIME, PAYMENT_METHOD, RESERVED_SEATS, CUSTOMER_ID, FLIGHT_ID)
VALUES ('2024-12-01 09:00:00', 'Credit Card', ARRAY [1, 2, 160], 1, 1),
       ('2024-12-01 10:00:00', 'Debit Card', ARRAY [4, 5, 110], 2, 2),
       ('2024-12-02 11:00:00', 'Cash', ARRAY [6, 7, 8, 9, 100], 3, 3),
       ('2024-12-03 12:00:00', 'Credit Card', ARRAY [1, 2], 4, 4),
       ('2024-12-04 13:00:00', 'Debit Card', ARRAY [150, 3, 4, 5], 5, 5),
       ('2024-12-05 14:00:00', 'Cash', ARRAY [6, 7], 6, 6),
       ('2024-12-06 15:00:00', 'Credit Card', ARRAY [1, 2, 3], 7, 7),
       ('2024-12-07 16:00:00', 'Debit Card', ARRAY [4, 5], 8, 8);

-- Passenger
INSERT INTO PASSENGER (FIRST_NAME, LAST_NAME, PASSPORT_NUMBER, CITIZENSHIP, BOOKING_ID)
VALUES
    -- For Booking ID 1 (Seats 1, 2, 160)
    ('Maria', 'Ivanova', 'A123456789', 'Russia', 1),          -- Seat 1
    ('Nargiza', 'Shuhratova', 'C987654321', 'Uzbekistan', 2), -- Seat 2
    ('John', 'Doe', 'X123456789', 'USA', 1),                  -- Seat 160

    -- For Booking ID 2 (Seats 4, 5, 110)
    ('Elena', 'Petrova', 'F123456780', 'Russia', 2),          -- Seat 4
    ('Oleg', 'Ivanov', 'I654321987', 'Russia', 2),            -- Seat 5
    ('Fatima', 'Alimova', 'J987654321', 'Uzbekistan', 2),     -- Seat 110

    -- For Booking ID 3 (Seats 6, 7, 8, 9, 100)
    ('Anna', 'Smith', 'H987654321', 'UK', 3),                 -- Seat 6
    ('David', 'Clarkov', 'D123456789', 'Russia', 3),          -- Seat 7
    ('Sophia', 'Hermanovich', 'S123456780', 'Russia', 3),     -- Seat 8
    ('Maxim', 'Petrov', 'M123456789', 'Russia', 3),           -- Seat 9
    ('Daria', 'Sidorova', 'D654321098', 'Russia', 3),         -- Seat 100

    -- For Booking ID 4 (Seats 1, 2)
    ('Igor', 'Kuznetsov', 'I123456789', 'Russia', 4),         -- Seat 1
    ('Tatiana', 'Sokolova', 'T654321098', 'Russia', 4),       -- Seat 2

    -- For Booking ID 5 (Seats 150, 3, 4, 5)
    ('Alisa', 'Taylorova', 'A123456780', 'Russia', 5),        -- Seat 150
    ('Robert', 'Maintanov', 'R123456789', 'Russia', 5),       -- Seat 3
    ('Olga', 'Pilotova', 'O654321987', 'Russia', 5),          -- Seat 4
    ('Egor', 'Cruev', 'E123456780', 'Russia', 5),             -- Seat 5

    -- For Booking ID 6 (Seats 6, 7)
    ('Maria', 'Ivanova', 'A987654321', 'Russia', 6),          -- Seat 6
    ('Nargiza', 'Shuhratova', 'C123456789', 'Uzbekistan', 6), -- Seat 7

    -- For Booking ID 7 (Seats 1, 2, 3)
    ('Aleksey', 'Pilotyan-Three', 'A123456123', 'Russia', 7), -- Seat 1
    ('Irina', 'Cabinyan-Three', 'I654321234', 'Russia', 7),   -- Seat 2
    ('Daler', 'Maintanov-Three', 'D123456456', 'Russia', 7),  -- Seat 3

    -- For Booking ID 8 (Seats 4, 5)
    ('Andrey', 'Pilotyan-Four', 'A123456456', 'Russia', 8),   -- Seat 4
    ('Valeriy', 'Cruev-Four', 'V654321345', 'Russia', 8); -- Seat 5