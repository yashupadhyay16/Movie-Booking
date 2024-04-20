require_relative 'booking'
require 'securerandom'

class Movie
  attr_reader :id, :title, :genre, :show_timings, :total_seats, :available_seats

  def initialize(title, genre, show_timings, total_seats)
    @id = SecureRandom.uuid
    @title = title
    @genre = genre
    @show_timings = show_timings
    @total_seats = total_seats
    @available_seats = Array.new(show_timings.length) { total_seats }
  end

  def display_details
    puts "Title: #{title}"
    puts "Genre: #{genre}"
    puts "Show Timings: #{show_timings.join(", ")}"
  end

  def display_available_seats(show_index)
    puts "Available seats for #{show_timings[show_index]}: #{@available_seats[show_index]}"
  end
end
