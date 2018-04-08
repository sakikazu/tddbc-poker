class Card
  attr_reader :suit, :rank

  SUIT_HEART = '(h)' #'♥'
  SUIT_SPADE = '(s)' #'♠'
  SUIT_DAIYA = '(d)' #'◆'
  SUIT_CLUB = '(c)'  #'♣'
  SUITS = [SUIT_HEART, SUIT_SPADE, SUIT_DAIYA, SUIT_CLUB]

  RANKS = {
    'A' => 14,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    '10' => 10,
    'J' => 11,
    'Q' => 12,
    'K' => 13
  }

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
end

