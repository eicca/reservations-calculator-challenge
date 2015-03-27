# Represents offers created by host.
class Offer
  # Understands specifics of concrete offer type.
  # Once the calculation logic becomes more complicated it would make
  # sense to create different Payout classes and initialize it with
  # nightly_rate.
  class Type
    attr_reader :factor

    def initialize(factor)
      @factor = factor
    end

    ROOM = new(1.0)
    APARTMENT = new(0.9)
    ENTIRE_HOUSE = new(0.8)
  end

  def initialize(type, title, nightly_rate)
    @type, @title, @nightly_rate = type, title, nightly_rate
    @reservations = []
  end

  def add_reservation(reservation)
    @reservations << reservation
  end

  def payout
    @reservations.reduce(0.0) do |a, e|
      a + e.payout(@nightly_rate) * @type.factor
    end
  end
end
