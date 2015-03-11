#!/usr/bin/env ruby

require_relative "../lib/app"

# Create a host
host = Host.new("John Doe")

# Create few offers
cheerful_room = Offer.new(:room, "Cheerful Room in Berlin", 100)
sunny_apartment = Offer.new(:apartment, "Sunny Apartment", 200)
small_room = Offer.new(:room, "My small Room", 50)

# Assign offers to the host
host.add_offer(cheerful_room)
host.add_offer(sunny_apartment)
host.add_offer(small_room)

# Make some reservations
cheerful_room.add_reservation(Reservation.new(3))
sunny_apartment.add_reservation(Reservation.new(2))
cheerful_room.add_reservation(Reservation.new(10))

# Calculate how much we should pay to the host
p host.total_payout
