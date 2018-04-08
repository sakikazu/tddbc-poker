class CardsSet
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def check_hand
    [
      { hand_point: HANDS::HIGH_CARD, handing_cards: [1,2] },
    ]
  end

  def best_hand
    hands = check_hand
    hands.max { |h| h.hand_point }
  end

  def compare(cards_set)
    hand = self.best_hand
    opponent_hand = cards_set.best_hand
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
