class BookingSystem
  attr_reader :movies, :bookings

  def initialize
    @movies = []
    @bookings = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def book_ticket(show_index, movie_id)
    movie = movies.find {|movie| movie.id == movie_id }
    if movie.available_seats[show_index] > 0
      movie.available_seats[show_index] -= 1
      seat_number = movie.total_seats - movie.available_seats[show_index]
      booking = Booking.new(movie_id: movie_id, show_id: show_index, seat_number: seat_number)
      @bookings << booking
      puts "Your booking is successfully done with booking it #{booking.id} " \
      "Ticket booked for #{movie.title} at #{movie.show_timings[show_index]}. " \
      "Seat number: #{seat_number}"
    else
      puts "Sorry, no seats available for #{title} at #{show_timings[show_index]}."
    end
  end

  def cancel_ticket(booking_id)
    id = booking_id.gsub(' ', '')
    booking = bookings.find {|booking| booking.id == booking_id }
    movie = movies.find {|movie| movie.id == booking.movie_id }
    show_id = booking.show_id
    
    movie.available_seats[show_id] += 1
    puts "Ticket canceled for #{movie.title} at #{movie.show_timings[show_id]}."
  end

  def available_movies
    puts "Available Movies: "
    movies.each_with_index do |movie, index|
      puts "#{movie.id}. #{movie.title}"
    end
  end

  def booked_seats
    bookings.each do |booking|    
      puts "Booking number: #{booking.id}"
    end
  end

  def available_show_timings(movie_id)
    movie = movies.find {|movie| movie.id == movie_id }
    puts "Show Timings for #{movie.title}: "
    movie.show_timings.each_with_index do |timing, index|
      puts "#{index + 1}. #{timing}"
    end
  end
end
