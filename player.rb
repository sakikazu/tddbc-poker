class Player
  attr_accessor :cd, :cards_set, :hand

  def initialize(cd)
    @cards_set = CardsSet.new
    @cd = "Player#{cd}"
  end

  def deal_cards(deck, card_count)
    cards = []
    1.upto(card_count) do
      cards << deck.cards.shift
    end
    @cards_set.build(cards)
    @hand = @cards_set.check_hand
  end
end
