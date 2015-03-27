# Represents reservation made by customer.
class Reservation
  def initialize(nights)
    @nights = nights
  end

  def payout(nightly_rate)
    @nights * nightly_rate
  end
end
