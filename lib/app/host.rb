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
    @offers.reduce(0.0) { |a, e| a + e.payout }
  end
end
