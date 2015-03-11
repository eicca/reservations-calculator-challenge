# Represents reservation made by customer.
class Reservation
  attr_accessor :nights

  def initialize(nights)
    @nights = nights
  end
end
