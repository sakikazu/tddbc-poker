require './card'

class Deck
  attr_reader :cards

  def initialize(joker)
    @cards = []
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank, _point|
        @cards << Card.new(suit, rank)
      end
    end
  end

  def shuffle
    @cards = @cards.sample(@cards.size)
  end
end
