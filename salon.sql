-- Create customers table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    phone VARCHAR(255) UNIQUE,
    name VARCHAR(255)
);

-- Create services table
CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- Insert three rows in the services table
INSERT INTO services (name) VALUES
    ('Cut'),
    ('Color'),
    ('Style');

-- Create appointments table
CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    service_id INTEGER REFERENCES services(service_id),
    time VARCHAR(255)
);
