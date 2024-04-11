# Movie Ticket Booking System

This is a simple Ruby program that simulates a movie ticket booking system. It allows users to view available movies, show timings, book tickets, cancel bookings, and display available seats for each show.

## Features

- **Multiple Movies and Shows:** The system supports multiple movies with different show timings.
- **Booking:** Users can book tickets for a specific movie and showtime. The system keeps track of the number of available seats for each show.
- **Seat Allocation:** When a user books a ticket, the system allocates the next available seat for the chosen show.
- **Ticket Cancellation:** Users can cancel their booked tickets, and canceled seats become available for booking again.
- **Booking Confirmation and Display:** Upon successful booking, users receive a confirmation with details such as movie title, showtime, and seat number. The system also displays the current status of booked and available seats for each show.

## Usage

1. **Setup:**
   - Make sure you have Ruby installed on your system.
   - Clone this repository to your local machine.

2. **Run the Program:**
   - Open a terminal and navigate to the directory containing the program files.
   - Run the command `ruby main.rb` to start the program.

3. **Interact with the Program:**
   - Follow the on-screen instructions to view available movies, book tickets, cancel bookings, and display available seats.
   - Use the provided options to navigate through the menu and perform actions.

4. **Sample Usage:**
   - Upon running the program, you will see a list of available movies with their show timings.
   - You can select a movie and showtime to book tickets. The system will allocate the next available seat for you.
   - You can also cancel a booked ticket by specifying the movie, showtime, and seat number.

## Code Structure

- `movie.rb`: Contains the `Movie` class definition with methods for managing movie details and ticket bookings.
- `booking_system.rb`: Defines the `BookingSystem` class responsible for managing multiple movies and coordinating ticket bookings.
- `main.rb`: Main program file that initializes the booking system, adds movies, and handles user interactions.
