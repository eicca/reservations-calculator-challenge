# Represents hosts
class Host
  def initialize(name)
    @name = name
    @offers = []
  end

  def add_offer(offer)
    @offers << offer
  end

  def total_payout
    outcome = 0
    @offers.each do |offer|
      tmp_payout = 0
      offer.reservations.each do |reservation|
        case offer.type
        when :room
          tmp_payout += offer.nightly_rate * reservation.nights
        when :apartment
          tmp_payout += offer.nightly_rate * reservation.nights * 0.9
        when :entire_house
          tmp_payout += offer.nightly_rate * reservation.nights * 0.8
        end
      end

      outcome += tmp_payout
    end
    outcome
  end
end
