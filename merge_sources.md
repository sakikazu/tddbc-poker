# 2018/04/13時点のソースコード一覧

## poker.rb
```
require_relative 'deck'
require_relative 'card'
require_relative 'hand_checker'
require_relative 'player'

class Poker
  attr_reader :deck, :players

  def initialize(player_count, play_card_count)
    @deck = Deck.new
    @players = Player.participate(player_count)
    @play_card_count = play_card_count
  end

  def play
    @deck.build
    deal_cards
    buttle
  end

  def display
    print "ランキング\n"
    @players.each do |player|
      print "#{player.cd}:#{player.hand.name}[#{player.hand.match_cards_notation}]\n"
    end
  end

  private

  def deal_cards
    @players.each do |player|
      player.deal_cards(@deck, @play_card_count)
    end
  end

  def buttle
    @players.sort! do |a, b|
      a.hand.compare(b.hand)
    end
  end
end
```

## deck.rb
```
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
```

## player.rb
```
require_relative 'hand_checker'

class Player
  attr_accessor :cd, :cards, :hand

  def initialize(cd)
    @cards = []
    @cd = "Player#{cd}"
  end

  def deal_cards(deck, card_count)
    @cards.clear
    1.upto(card_count) do
      @cards << deck.cards.shift
    end
    @hand = HandChecker.new(@cards).result
  end

  def self.participate(count)
    (1..count).map { |n| new(n) }
  end
end
```

## hand.rb
```
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
  def matched_cards
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end

  def unmatched_cards
    Card.sort_by_point(@cards - matched_cards)
  end

  def match_cards_notation
    matched_cards.map { |card| card.notation }.join("|")
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

  def matched_cards
    Card.sort_by_point(@cards)
  end

  def compare_cards(opponent_hand)
    self_cards = matched_cards
    opponent_cards = opponent_hand.matched_cards
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

  def matched_cards
    _target_rank, found_pair_cards = @cards.group_by { |card| card.rank }.find { |k, v| v.size == 2 }
    Card.sort_by_point(found_pair_cards)
  end

  # NOTE: ペアのランクが同じなら、もう一つのカードで判定する
  def compare_cards(opponent_hand)
    strongest_card = matched_cards.last
    opponent_strongest_card = opponent_hand.matched_cards.last
    result = Hand.compare_point(strongest_card, opponent_strongest_card)
    return result if result != 0 || unmatched_cards.size == 0
    (unmatched_cards.size-1).downto 0 do |n|
      result = Hand.compare_point(unmatched_cards[n], opponent_hand.unmatched_cards[n])
      return result if result != 0
    end
    0
  end
end

class FlushHand < Hand
  def name
    "フラッシュ"
  end

  def point
    2
  end

  def matched_cards
    Card.sort_by_point(@cards)
  end

  def compare_cards(opponent_hand)
    self_cards = matched_cards
    opponent_cards = opponent_hand.matched_cards
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

  def matched_cards
    cards_ordered_number = @cards.sort_by { |card| card.number_index }
    # TODO: どうにかしないと
    if cards_ordered_number.map(&:rank) == ["A", "2", "3"]
      return cards_ordered_number
    end
    Card.sort_by_point(@cards)
  end

  def compare_cards(opponent_hand)
    strongest_card = matched_cards.last
    opponent_strongest_card = opponent_hand.matched_cards.last
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

  def matched_cards
    _target_rank, found_three_cards = @cards.group_by { |card| card.rank }.find { |k, v| v.size == 3 }
    Card.sort_by_point(found_three_cards)
  end

  def compare_cards(opponent_hand)
    strongest_card = matched_cards.last
    opponent_strongest_card = opponent_hand.matched_cards.last
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

  def matched_cards
    cards_ordered_number = @cards.sort_by { |card| card.number_index }
    if cards_ordered_number.map(&:rank) == ["A", "2", "3"]
      return cards_ordered_number
    end
    Card.sort_by_point(@cards)
  end

  def compare_cards(opponent_hand)
    strongest_card = matched_cards.last
    opponent_strongest_card = opponent_hand.matched_cards.last
    Hand.compare_point(strongest_card, opponent_strongest_card)
  end
end
```

## hand_checker.rb
```
require_relative 'card'
require_relative 'hand'

# TODO: Handにまとめても良い気がする
class HandChecker
  def initialize(cards)
    @cards = cards
  end

  def result
    return StraightFlushHand.new(@cards) if straight? && flush?
    return ThreeOfAKindHand.new(@cards) if three_cards?
    return StraightHand.new(@cards) if straight?
    return FlushHand.new(@cards) if flush?
    return PairHand.new(@cards) if pair?
    HighCardHand.new(@cards)
  end

  def straight?
    continuous_rank?
  end

  def flush?
    base_suit = @cards.first.suit
    @cards.all? { |card| card.suit == base_suit }
  end

  def three_cards?
    same_rank_count == 3
  end

  def pair?
    same_rank_count == 2
  end

  private

  def same_rank_count
    @cards.group_by { |card| card.rank }.map { |k, v| v.size }.max
  end

  def continuous_rank?
    number_indexes = @cards.sort_by { |card| card.number_index }.map { |card| card.number_index }
    point_indexes = @cards.sort_by { |card| card.point_index }.map { |card| card.point_index }
    continuous_number?(number_indexes) || continuous_number?(point_indexes)
  end

  def continuous_number?(ordered_numbers)
    return false if !ordered_numbers.is_a?(Array) || ordered_numbers.size < 2
    prev_number = ordered_numbers.shift
    ordered_numbers.each do |num|
      return false unless prev_number + 1 == num
      prev_number = num
    end
    true
  end
end
```

## card.rb
```
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
              rank
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

  def self.sort_by_point(cards)
    cards.sort_by { |card| card.point_index }
  end
end

```

