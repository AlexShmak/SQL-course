------------------------------------------------------------------------------------------------------------------------
-- Процедура для регистрации нового клиента
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION register_customer(first_name VARCHAR, last_name VARCHAR, email VARCHAR, phone VARCHAR)
    RETURNS VOID AS
$$
BEGIN
    INSERT INTO CUSTOMER (FIRST_NAME, LAST_NAME, EMAIL, PHONE) VALUES (first_name, last_name, email, phone);
END;
$$ LANGUAGE plpgsql;

------------------------------------------------------------------------------------------------------------------------
-- Процедура для создания нового бронирования
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION create_booking(payment_method VARCHAR, customer_id INTEGER, flight_id INTEGER,
                                          reserved_seats INTEGER[])
    RETURNS VOID AS
$$
BEGIN
    INSERT INTO BOOKING (PAYMENT_METHOD, CUSTOMER_ID, FLIGHT_ID, RESERVED_SEATS)
    VALUES (payment_method, customer_id, flight_id, reserved_seats);
END;
$$ LANGUAGE plpgsql;

------------------------------------------------------------------------------------------------------------------------
-- Процедура для обновления информации о рейсе
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION update_flight(flight_id_to_update INTEGER, new_flight_number VARCHAR,
                                         new_departure_date TIMESTAMP,
                                         new_arrival_date TIMESTAMP, new_departure_airport_id INTEGER,
                                         new_arrival_airport_id INTEGER)
    RETURNS VOID AS
$$
BEGIN
    UPDATE FLIGHT
    SET FLIGHT_NUMBER        = new_flight_number,
        DEPARTURE_DATE       = new_departure_date,
        ARRIVAL_DATE         = new_arrival_date,
        DEPARTURE_AIRPORT_ID = new_departure_airport_id,
        ARRIVAL_AIRPORT_ID   = new_arrival_airport_id
    WHERE FLIGHT_ID = flight_id_to_update;
END;
$$ LANGUAGE plpgsql;

------------------------------------------------------------------------------------------------------------------------
-- Вызов процедур (пример)
------------------------------------------------------------------------------------------------------------------------
SELECT register_customer('John', 'Doe', 'john@example.com', '1234567890');
SELECT create_booking('Credit Card', 1, 1, ARRAY [1, 2, 3]);
SELECT update_flight(1, 'AB123', '2023-12-01 10:00:00', '2023-12-01 12:00:00', 1, 2);
