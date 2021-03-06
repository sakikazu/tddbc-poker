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
