require "spec_helper"

describe Host do
  let(:host) { described_class.new("John Doe") }

  describe "#total_payout" do
    it "works correctly" do
      # Create few offers
      cheerful_room = Offer.new(Offer::Type::ROOM,
                                "Cheerful Room in Berlin", 100)
      sunny_apartment = Offer.new(Offer::Type::APARTMENT,
                                  "Sunny Apartment", 200)
      small_room = Offer.new(Offer::Type::ENTIRE_HOUSE, "My small Room", 50)

      # Assign offers to the host
      host.add_offer(cheerful_room)
      host.add_offer(sunny_apartment)
      host.add_offer(small_room)

      # Make some reservations
      cheerful_room.add_reservation(Reservation.new(3))
      sunny_apartment.add_reservation(Reservation.new(2))
      cheerful_room.add_reservation(Reservation.new(10))

      # calculate how much we should pay to the host
      expect(host.total_payout).to eql(1660.0)
    end
  end
end
