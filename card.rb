class Card

  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def notation
    "#{@rank}#{@suit}"
  end

  def has_same_suit?(card)
    self.suit == card.suit
  end

  def self.best_hand(cards)
    HANDS::HIGH_CARD
  end
end

module HANDS
  HIGH_CARD =        0
  PAIR =             1
  FLUSH =            2
  STRAIGHT =         3
  THREE_OF_A_KIND =  4
  STRAIGHT_FLUSH =   5
  # HANDS = %(HIGH_CARD PAIR FLUSH STRAIGHT THREE_OF_A_KIND STRAIGHT_FLUSH)
end
