require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
  end

  def build(includes_joker = false)
    @cards = []
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank, _point|
        @cards << Card.new(suit, rank)
      end
    end
    shuffle
  end

  def shuffle
    @cards.shuffle!
  end
end
