------------------------------------------------------------------------------------------------------------------------
-- Удаление таблиц
------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS SERVICE_CLASSES_INFO CASCADE;
DROP TABLE IF EXISTS PASSENGER CASCADE;
DROP TABLE IF EXISTS FLIGHT_SERVICE CASCADE;
DROP TABLE IF EXISTS FLIGHT_BOOKINGS CASCADE;
DROP TABLE IF EXISTS FLIGHT CASCADE;
DROP TABLE IF EXISTS EMPLOYEE CASCADE;
DROP TABLE IF EXISTS CUSTOMER CASCADE;
DROP TABLE IF EXISTS BOOKING CASCADE;
DROP TABLE IF EXISTS AIRPORT CASCADE;
DROP TABLE IF EXISTS AIRCRAFT CASCADE;

------------------------------------------------------------------------------------------------------------------------
-- Удаление триггеров
------------------------------------------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS booking_insert ON BOOKING;
DROP TRIGGER IF EXISTS booking_delete ON BOOKING;
DROP TRIGGER IF EXISTS customer_update ON CUSTOMER;

------------------------------------------------------------------------------------------------------------------------
-- Удаление представлений
------------------------------------------------------------------------------------------------------------------------
DROP VIEW IF EXISTS flight_info;
DROP VIEW IF EXISTS customer_bookings;
DROP VIEW IF EXISTS flight_load_report;

------------------------------------------------------------------------------------------------------------------------
-- Удаление хранимых процедур
------------------------------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS register_customer(VARCHAR, VARCHAR, VARCHAR, VARCHAR);
DROP FUNCTION IF EXISTS create_booking(INTEGER, INTEGER, INTEGER[]);
DROP FUNCTION IF EXISTS update_flight(INTEGER, VARCHAR, TIMESTAMP, TIMESTAMP);