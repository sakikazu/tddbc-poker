require './hand_checker'

class Player
  attr_accessor :cd, :cards, :hand

  def initialize(cd)
    @cards = []
    @cd = "Player#{cd}"
  end

  def deal_cards(deck, card_count)
    1.upto(card_count) do
      @cards << deck.cards.shift
    end
    @hand = HandChecker.new(@cards).result
  end
end
