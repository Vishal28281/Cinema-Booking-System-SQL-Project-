-- schema.sql: Cinema Booking System

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    duration_minutes INT,
    release_date DATE
);

CREATE TABLE Theaters (
    theater_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE Shows (
    show_id INT PRIMARY KEY,
    movie_id INT,
    theater_id INT,
    show_time DATETIME,
    total_seats INT,
    available_seats INT,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    show_id INT,
    customer_id INT,
    seats_booked INT,
    booking_time DATETIME,
    FOREIGN KEY (show_id) REFERENCES Shows(show_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);