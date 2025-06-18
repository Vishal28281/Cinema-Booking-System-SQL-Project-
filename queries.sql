1. How do you insert a new movie?

Explanation: Adds a new movie to the Movies table.

INSERT INTO Movies (movie_id, title, genre, duration_minutes)
VALUES (5, 'Kantara', 'Thriller', 135);

2. How do you view all available movies?

Explanation: Shows all records in the Movies table.

SELECT * FROM Movies;

3. How do you schedule a new show?

Explanation: Adds a show, linking a movie and theater with available seats.


INSERT INTO Shows (show_id, movie_id, theater_id, show_time, available_seats)
VALUES (101, 1, 2, '2025-06-18 18:00:00', 100);

4. How do you book seats for a show?

Explanation: Adds a booking and associates it with a customer and show.


INSERT INTO Bookings (booking_id, show_id, customer_id, seats_booked, booking_time)
VALUES (5, 101, 3, 2, getdate());

5. How to update available seats after a booking?

Explanation: Reduces the available_seats in Shows.

UPDATE Shows
SET available_seats = available_seats - 2
WHERE show_id = 101;

6. How to list all shows for a given movie?

Explanation: Uses a JOIN to find all shows for a specific movie title.

SELECT s.*
FROM Shows s
JOIN Movies m ON s.movie_id = m.movie_id
WHERE m.title = 'Inception';

7. How to get bookings for a customer?

Explanation: Filters the Bookings table by customer ID.

SELECT * FROM Bookings
WHERE customer_id = 1;

8. How to cancel a booking?

Explanation: Delete booking and restores seat count.

DELETE FROM Bookings
WHERE booking_id = 1;

UPDATE Shows
SET available_seats = available_seats + 2
WHERE show_id = 101;

9. How to find the most booked movie?

Explanation: Uses GROUP BY and SUM to count booked seats per movie.


SELECT  top 1 m.title, SUM(b.seats_booked) AS total
FROM Bookings b
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
GROUP BY m.title
ORDER BY total DESC

10. How to see upcoming shows?
Explanation: Filters future shows using current date.


SELECT * FROM Shows
WHERE show_time > getdate();

11. How to register a new customer?

Explanation: Inserts a customer into the Customers table.


INSERT INTO Customers (customer_id, name, email)
VALUES (3, 'John Doe', 'john@example.com');

12. How to find all fully booked shows?
Explanation: List shows where no seats are available.


SELECT * FROM Shows
WHERE available_seats = 1;

13. How to list customers who booked for a specific movie?

Explanation: Joins multiple tables to match customers to movie bookings.


SELECT DISTINCT c.name
FROM Customers c
JOIN Bookings b ON c.customer_id = b.customer_id
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
WHERE m.title = 'Inception';

14. How to count total bookings made today?

Explanation: Uses GETDATE() to filter today’s bookings.

SELECT COUNT(*)
FROM Bookings
WHERE booking_time = sysdatetime();

15. How to get total revenue (assuming ₹150 per seat)?
Explanation: Calculates revenue using sum of seats booked.

SELECT SUM(seats_booked) * 150 AS revenue
FROM Bookings;