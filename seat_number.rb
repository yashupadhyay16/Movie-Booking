class SeatNumber
  attr_reader :movie_id, :seat_size

  def initialize(total_seat_size, movie_id)
    @seat_size = Array.new(total_seat_size) { |seat_size| seat_size + 1 }
    @movie_id = movie_id
  end
end