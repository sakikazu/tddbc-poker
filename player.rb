class Player
  attr_accessor :cd, :cards_set

  def initialize(cd)
    @cards_set = CardsSet.new
    @cd = "Player#{cd}"
  end

  def deal_cards(deck, card_count)
    1.upto(card_count) do
      @cards_set.cards << deck.cards.shift
    end
    @cards_set.set_order_index
  end
end
