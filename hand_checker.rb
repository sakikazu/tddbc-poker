require './card'
require './hand'

class HandChecker
  def initialize(cards)
    @cards = cards
  end

  def result
    return StraightFlushHand.new(@cards) if straight? and flush?
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
