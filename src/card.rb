class Card
  attr_reader :suit, :rank, :number_index, :point_index

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

  # NOTE: rankの引数は'A'でも1でも可
  def initialize(suit, rank)
    @suit = suit
    @rank = if rank.is_a?(Integer)
              RANKS.keys[rank-1]
            else
              @rank = rank
            end
    @number_index = Card.ranks_sorted_by_number.index(@rank)
    @point_index = Card.ranks_sorted_by_point.index(@rank)
  end

  def notation
    "#{@rank}#{@suit}"
  end

  def has_same_suit?(card)
    self.suit == card.suit
  end

  def self.ranks_sorted_by_number
    self::RANKS.keys
  end

  def self.ranks_sorted_by_point
    self::RANKS.sort_by { |k, v| v }.map { |rank| rank[0] }
  end
end

