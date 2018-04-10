require_relative 'card'

class Hand
  def initialize(cards)
    @cards = cards
  end

  def name
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end

  def point
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end

  # TODO: HandCheckerでやるべきだと思う。その際に、ストレートの強さの仕様など含めて、強い順で取得できるように
  def match_cards
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end

  def match_cards_notation
    match_cards.map { |card| card.notation }.join("|")
  end

  # NOTE: 順序：強い順
  def compare(opponent_hand)
    if point > opponent_hand.point
      -1
    elsif opponent_hand.point > point
      1
    else
      compare_cards(opponent_hand)
    end
  end

  def compare_cards(opponent_hand)
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end

  def self.compare_point(card1, card2)
    if card1.point_index > card2.point_index
      return -1
    elsif card2.point_index > card1.point_index
      return 1
    else
      0
    end
  end
end

class HighCardHand < Hand
  def name
    "ハイカード"
  end

  def point
    0
  end

  def match_cards
    @cards.sort_by { |card| card.point_index }
  end

  def compare_cards(opponent_hand)
    self_cards = match_cards
    opponent_cards = opponent_hand.match_cards
    (self_cards.size-1).downto 0 do |n|
      result = Hand.compare_point(self_cards[n], opponent_cards[n])
      return result if result != 0
    end
    0
  end

  # NOTE: 再帰でやる必要なかった
  # def compare_recursive(cards, opponent_cards, n)
    # return 0 if n < 0
    # if cards[n].point_index > opponent_cards[n].point_index
      # -1
    # elsif opponent_cards[n].point_index > cards[n].point_index
      # 1
    # else
      # compare_recursive(cards, opponent_cards, n-1)
    # end
  # end
end

class PairHand < Hand
  def name
    "ペア"
  end

  def point
    1
  end

  def match_cards
    found_pair_cards = @cards.group_by { |card| card.rank }.find { |k, v| v.size == 2 }
    found_pair_cards[1].sort_by { |card| card.point_index }
  end

  # NOTE: ペアのランクが同じなら、もう一つのカードで判定する
  def compare_cards(opponent_hand)
    strongest_card = match_cards.last
    opponent_strongest_card = opponent_hand.match_cards.last
    Hand.compare_point(strongest_card, opponent_strongest_card)
  end
end

class FlushHand < Hand
  def name
    "フラッシュ"
  end

  def point
    2
  end

  def match_cards
    @cards.sort_by { |card| card.point_index }
  end

  def compare_cards(opponent_hand)
    self_cards = match_cards
    opponent_cards = opponent_hand.match_cards
    (self_cards.size-1).downto 0 do |n|
      result = Hand.compare_point(self_cards[n], opponent_cards[n])
      return result if result != 0
    end
    0
  end
end

class StraightHand < Hand
  def name
    "ストレート"
  end

  def point
    3
  end

  def match_cards
    cards_ordered_number = @cards.sort_by { |card| card.number_index }
    if cards_ordered_number.map(&:rank) == ["A", "2", "3"]
      return cards_ordered_number
    end
    @cards.sort_by { |card| card.point_index }
  end

  def compare_cards(opponent_hand)
    strongest_card = match_cards.last
    opponent_strongest_card = opponent_hand.match_cards.last
    Hand.compare_point(strongest_card, opponent_strongest_card)
  end
end

class ThreeOfAKindHand < Hand
  def name
    "スリーカード"
  end

  def point
    4
  end

  def match_cards
    found_three_cards = @cards.group_by { |card| card.rank }.find { |k, v| v.size == 3 }
    found_three_cards[1].sort_by { |card| card.point_index }
  end

  def compare_cards(opponent_hand)
    strongest_card = match_cards.last
    opponent_strongest_card = opponent_hand.match_cards.last
    Hand.compare_point(strongest_card, opponent_strongest_card)
  end
end

class StraightFlushHand < Hand
  def name
    "ストレートフラッシュ"
  end

  def point
    5
  end

  def match_cards
    cards_ordered_number = @cards.sort_by { |card| card.number_index }
    if cards_ordered_number.map(&:rank) == ["A", "2", "3"]
      return cards_ordered_number
    end
    @cards.sort_by { |card| card.point_index }
  end

  def compare_cards(opponent_hand)
    strongest_card = match_cards.last
    opponent_strongest_card = opponent_hand.match_cards.last
    Hand.compare_point(strongest_card, opponent_strongest_card)
  end
end
