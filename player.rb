class Player
  attr_accessor :cd, :cards

  def initialize(cd)
    @cards = []
    @cd = "Player#{cd}"
  end

  def deal_cards(deck, card_count)
    1.upto(card_count) do
      @cards << deck.cards.shift
    end
  end

end
