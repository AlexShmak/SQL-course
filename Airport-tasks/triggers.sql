-- Триггер для автоматического обновления количества забронированных мест (эконом- и бизнес-класса) мест в FLIGHT_BOOKINGS при создании нового бронирования
CREATE OR REPLACE FUNCTION update_flight_bookings_trigger() RETURNS TRIGGER AS
$$
BEGIN
    UPDATE FLIGHT_BOOKINGS
    SET ECONOMY_CLASS_SEATS_BOOKED  = ECONOMY_CLASS_SEATS_BOOKED + (SELECT COUNT(*)
                                                                    FROM unnest(NEW.RESERVED_SEATS) AS seat
                                                                    WHERE seat <= (SELECT ECONOMY_CLASS_TOTAL_SEATS
                                                                                   FROM SERVICE_CLASSES_INFO
                                                                                   WHERE SERVICE_CLASSES_INFO_ID =
                                                                                         (SELECT SERVICE_CLASSES_INFO_ID
                                                                                          FROM FLIGHT
                                                                                          WHERE FLIGHT_ID = NEW.FLIGHT_ID))),
        BUSINESS_CLASS_SEATS_BOOKED = BUSINESS_CLASS_SEATS_BOOKED + (SELECT COUNT(*)
                                                                     FROM unnest(NEW.RESERVED_SEATS) AS seat
                                                                     WHERE seat > (SELECT ECONOMY_CLASS_TOTAL_SEATS
                                                                                   FROM SERVICE_CLASSES_INFO
                                                                                   WHERE SERVICE_CLASSES_INFO_ID =
                                                                                         (SELECT SERVICE_CLASSES_INFO_ID
                                                                                          FROM FLIGHT
                                                                                          WHERE FLIGHT_ID = NEW.FLIGHT_ID)))
    WHERE FLIGHT_BOOKING_ID = (SELECT FLIGHT_BOOKING_ID FROM FLIGHT WHERE FLIGHT_ID = NEW.FLIGHT_ID);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER booking_insert
    AFTER INSERT
    ON BOOKING
    FOR EACH ROW
EXECUTE FUNCTION update_flight_bookings_trigger();

-- Триггер для автоматического удаления бронирования
CREATE OR REPLACE FUNCTION delete_booking_trigger() RETURNS TRIGGER AS
$$
BEGIN
    DELETE FROM BOOKING WHERE BOOKING_ID = OLD.BOOKING_ID;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER booking_delete
    AFTER DELETE
    ON BOOKING
    FOR EACH ROW
EXECUTE FUNCTION delete_booking_trigger();

-- Триггер для обновления информации о клиенте
CREATE OR REPLACE FUNCTION update_customer_trigger() RETURNS TRIGGER AS
$$
BEGIN
    UPDATE CUSTOMER
    SET FIRST_NAME = NEW.FIRST_NAME,
        LAST_NAME  = NEW.LAST_NAME,
        EMAIL      = NEW.EMAIL,
        PHONE      = NEW.PHONE
    WHERE CUSTOMER_ID = OLD.CUSTOMER_ID;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER customer_update
    AFTER UPDATE
    ON CUSTOMER
    FOR EACH ROW
EXECUTE FUNCTION update_customer_trigger();

-- Триггер для создания записи в таблице FLIGHT_BOOKINGS при добавлении нового полёта
CREATE OR REPLACE FUNCTION create_flight_booking() RETURNS TRIGGER AS
$$
DECLARE
    new_booking_id INTEGER;
BEGIN
    -- Добавляем новую запись в таблицу FLIGHT_BOOKINGS и получаем сгенерированный ID
    INSERT INTO FLIGHT_BOOKINGS DEFAULT VALUES RETURNING FLIGHT_BOOKING_ID INTO new_booking_id;

    -- Устанавливаем FLIGHT_BOOKING_ID в новой записи в таблице FLIGHT
    NEW.FLIGHT_BOOKING_ID := new_booking_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_flight
    BEFORE INSERT
    ON FLIGHT
    FOR EACH ROW
EXECUTE FUNCTION create_flight_booking();