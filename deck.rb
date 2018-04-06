require './card'

class Deck
  attr_reader :cards

  def initialize(joker)
    @cards = []
    ["♥", "♠", "◆", "♣"].each do |suit|
      1.upto 12 do |rank|
        @cards << Card.new(suit, rank.to_s)
      end
    end
  end

  def shuffle
    @cards = @cards.sample(@cards.size)
  end
end
