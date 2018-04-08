require './card'

class CardsSet
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def set_order_index
    @cards.each do |card|
      card.number_index = Card::RANKS.keys.index(card.rank)
      card.point_index = Card::RANKS.sort_by { |k, v| v }.map { |rank| rank[0] }.index(card.rank)
    end
  end

  def check_hand
    formed_hands = []
    formed_hands << HANDS::STRAIGHT_FLUSH if straight? and flush?
    formed_hands << HANDS::THREE_OF_A_KIND if three_cards?
    formed_hands << HANDS::STRAIGHT if straight?
    formed_hands << HANDS::FLUSH if flush?
    formed_hands << HANDS::PAIR if pair?
    formed_hands
    # todo
    [
      { hand_point: HANDS::HIGH_CARD, handing_cards: [1,2] },
    ]
  end

  def straight?
    continuous_rank?
  end

  def flush?
    base_suit = @cards.first
    @cards.all? { |card| card.suit == base_suit }
  end

  def three_cards?
    same_rank_count == 3
  end

  def pair?
    same_rank_count == 2
  end

  def best_hand
    hands = check_hand
    hands.max { |h| h.hand_point }
  end

  def compare(cards_set)
    hand = self.best_hand
    opponent_hand = cards_set.best_hand
  end

  private

  def same_rank_count
    @cards.group_by { |card| card.rank }.map { |k, v| v.size }.max
  end

  def continuous_rank?
    number_indexes = @cards.sort_by { |card| card.number_index }.map { |card| card.number_index }
    point_indexes = @cards.sort_by { |card| card.point_index }.map { |card| card.point_index }
    continuous?(number_indexes) or continuous?(point_indexes)
  end

  def continuous?(ordered_numbers)
    return false if !ordered_numbers.is_a?(Array) or ordered_numbers.size < 2
    prev_number = ordered_numbers.shift
    ordered_numbers.each do |num|
      return false unless prev_number + 1 == num
      prev_number = num
    end
    true
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
