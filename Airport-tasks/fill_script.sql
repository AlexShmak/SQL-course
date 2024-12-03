-- Insert test data into AIRCRAFT
INSERT INTO
    AIRCRAFT (MODEL, CAPACITY)
VALUES
    ('Boeing 737', 180),
    ('Airbus A320', 150),
    ('Boeing 747', 416);

-- Insert test data into AIRPORT
INSERT INTO
    AIRPORT (NAME, CITY, COUNTRY)
VALUES
    ('Islam Karimov Tashkent International Airport', 'Tashkent', 'Uzbekistan'),
    ('Manas International Airport', 'Bishkek', 'Kyrgyzstan'),
    ('Ashgabat International Airport', 'Ashgabat', 'Turkmenistan'),
    ('Nursultan Nazarbayev International Airport', 'Astana', 'Kazakhstan'),
    ('Minsk National Airport', 'Minsk', 'Belarus');

-- Insert test data into SERVICE_CLASSES_INFO
INSERT INTO
    SERVICE_CLASSES_INFO (
        ECONOMY_CLASS_TOTAL_SEATS,
        BUSINESS_CLASS_TOTAL_SEATS,
        ECONOMY_CLASS_TICKET_PRICE,
        BUSINESS_CLASS_TICKET_PRICE
    )
VALUES
    (150, 30, 50000, 100000),
    (100, 50, 60000, 120000),
    (80, 40, 35000, 80000);

-- Insert test data into FLIGHT_SERVICE
INSERT INTO
    FLIGHT_SERVICE (AIRCRAFT_ID)
VALUES
    (1),
    (2),
    (3);

-- Insert test data into EMPLOYEE
INSERT INTO
    EMPLOYEE (FIRST_NAME, LAST_NAME, OCCUPATION, FLIGHT_SERVICE_ID)
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
    ('Valeriy', 'Cruev-Three', 'Cabin Crew', 3);

-- Insert test data into CUSTOMER
INSERT INTO
    CUSTOMER (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES
    ('Alisa', 'Taylorova', 'alice.taylor@example.com', '1234567890'),
    ('David', 'Clarkov', 'david.clark@example.com', '0987654321'),
    ('Anna', 'Martynova', 'anna.martinez@example.com', '5678901234'),
    ('Oskar', 'Garcov', 'oliver.garcia@example.com', '4567890123'),
    ('Sophia', 'Hermanovich', 'sophia.hermanovich@example.com', '2345678901');

-- Insert test data into FLIGHT_BOOKINGS
INSERT INTO
    FLIGHT_BOOKINGS (ECONOMY_CLASS_SEATS_BOOKED, BUSINESS_CLASS_SEATS_BOOKED)
VALUES
    (0, 0),
    (0, 0),
    (0, 0);

-- Insert test data into FLIGHT
INSERT INTO
    FLIGHT (
        FLIGHT_NUMBER,
        DEPARTURE_DATE,
        ARRIVAL_DATE,
        DEPARTURE_AIRPORT_ID,
        ARRIVAL_AIRPORT_ID,
        FLIGHT_SERVICE_ID,
        FLIGHT_BOOKING_ID,
        SERVICE_CLASSES_INFO_ID
    )
VALUES
    ('TS123', '2024-12-05 10:00:00', '2024-12-05 14:00:00', 1, 2, 1, 1, 1),
    ('BK456', '2024-12-06 15:00:00', '2024-12-06 19:00:00', 2, 3, 2, 2, 2),
    ('AG789', '2024-12-07 20:00:00', '2024-12-08 01:00:00', 3, 4, 3, 3, 3);

-- Insert test data into BOOKING
INSERT INTO
    BOOKING (BOOKING_DATE_TIME, PAYMENT_METHOD, RESERVED_SEATS, CUSTOMER_ID, FLIGHT_ID)
VALUES
    ('2024-12-01 09:00:00', 'Credit Card', ARRAY[1, 2, 3], 1, 1),
    ('2024-12-01 10:00:00', 'Debit Card', ARRAY[4, 5], 2, 2),
    ('2024-12-02 11:00:00', 'Cash', ARRAY[6, 7, 8], 3, 3);

-- Insert test data into PASSENGER
INSERT INTO
    PASSENGER (FIRST_NAME, LAST_NAME, PASSPORT_NUMBER, CITIZENSHIP, BOOKING_ID)
VALUES
    ('Maria', 'Ivanova', 'A123456', 'Russia', 1),
    ('Nargiza', 'Shuhratova', 'C987654', 'Uzbekistan', 2),
    ('Kayrat', 'Nazarbaev', 'E876543', 'Kazakhstan', 3);
