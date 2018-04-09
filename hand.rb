require './card'

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
    compare_recursive(match_cards, opponent_hand.match_cards, match_cards.size-1)
  end

  # TODO loopでいけるんじゃ？
  def compare_recursive(cards, opponent_cards, n)
    return 0 if n < 0
    if cards[n].point_index > opponent_cards[n].point_index
      -1
    elsif opponent_cards[n].point_index > cards[n].point_index
      1
    else
      compare_recursive(cards, opponent_cards, n-1)
    end
  end
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
    found_pair_cards[1]
  end

  require 'byebug'
  # todo ペアのランクが同じなら、もう一つのカードで判定するのか・・matchとotherとを分ける必要がある
  def compare_cards(opponent_hand)
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
  end

  def compare_cards(opponent_hand)
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
  end

  def compare_cards(opponent_hand)
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
  end

  def compare_cards(opponent_hand)
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
  end

  def compare_cards(opponent_hand)
  end
end
