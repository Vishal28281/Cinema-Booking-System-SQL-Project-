-- insert_data.sql: Sample Data for Cinema Booking System

INSERT INTO Movies VALUES 
(1, 'Inception', 'Sci-Fi', 148, '2010-07-16'),
(2, 'The Godfather', 'Crime', 175, '1972-03-24'),
(3, 'Avengers: Endgame', 'Action', 181, '2019-04-26');

INSERT INTO Theaters VALUES 
(1, 'Cineplex A', 'Downtown'),
(2, 'MovieMax', 'Uptown');

INSERT INTO Shows VALUES 
(1, 1, 1, '2025-06-20 18:00:00', 100, 100),
(2, 2, 2, '2025-06-21 20:00:00', 80, 80),
(3, 3, 1, '2025-06-22 21:00:00', 120, 120);

INSERT INTO Customers VALUES 
(1, 'John Doe', 'john@example.com', '1234567890'),
(2, 'Jane Smith', 'jane@example.com', '0987654321');

INSERT INTO Bookings VALUES 
(1, 1, 1, 2, '2025-06-16 10:00:00'),
(2, 2, 2, 4, '2025-06-16 11:00:00');