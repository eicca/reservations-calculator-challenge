# Represents offers created by host.
class Offer
  attr_accessor :type, :title, :nightly_rate, :reservations

  def initialize(type, title, nightly_rate)
    @type, @title, @nightly_rate = type, title, nightly_rate
    @reservations = []
  end

  def add_reservation(reservation)
    @reservations << reservation
  end
end
