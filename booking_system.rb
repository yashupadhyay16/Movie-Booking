require 'pry'
class BookingSystem
  attr_reader :movies, :bookings, :seat_numbers

  def initialize
    @movies = []
    @bookings = []
    @seat_numbers = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def add_total_seats(seat_numbers)
    @seat_numbers << seat_numbers
  end

  def maximum_booking
    movie_seat_count = {}
    max_booking = -1
    max_booking_movie_id = nil
    max_booking_show_id = nil

    @bookings.each do |booking|
      key_id = booking.movie_id + booking.show_id.to_s
      movie_seat_count[key_id] = (movie_seat_count.key?(key_id) ? movie_seat_count[key_id] : 0) + booking.seat_number.length
      if movie_seat_count[key_id] > max_booking
        max_booking_movie_id = booking.movie_id
        max_booking_show_id = booking.show_id
        max_booking = movie_seat_count[key_id]
      end
    end
    movie = movies.find {|movie| movie.id == max_booking_movie_id }
    show_timings = movie.show_timings[max_booking_show_id]
    if max_booking_movie_id
      puts "Maximum number of booking done for the day for movie #{movie.title} for show #{show_timings}"
      puts "Total seats booked: #{max_booking}"
    else
      puts "No bookings done yet"
    end
  end

  def book_ticket(show_index, movie_id, booking_size)
    movie = movies.find {|movie| movie.id == movie_id }
    if movie.available_seats[show_index] > 0
      movie.available_seats[show_index] -= 1
      # seat_number = movie.total_seats - movie.available_seats[show_index]
      size =  @seat_numbers.find { |seat_number| seat_number.movie_id == movie_id }.seat_size
      total_seat_size = size.pop(booking_size)
      booking = Booking.new(movie_id: movie_id, show_id: show_index, seat_number: total_seat_size)
      @bookings << booking
      puts "Your booking is successfully done with booking it #{booking.id} " \
      "Ticket booked for #{movie.title} at #{movie.show_timings[show_index]}. " \
      "Seat number: #{total_seat_size.join(', ')}"
    else
      puts "Sorry, no seats available for #{title} at #{show_timings[show_index]}."
    end
  end

  def cancel_ticket(booking_id)
    id = booking_id.gsub(' ', '')
    booking = bookings.find {|booking| booking.id == booking_id }
    movie = movies.find {|movie| movie.id == booking.movie_id }
    show_id = booking.show_id
    seat_number =  @seat_numbers.find { |seat_number| seat_number.movie_id == movie.id }
    total_seat_size = seat_number.seat_size.concat(booking.seat_number)
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
