# load '/Users/sakikazu/dev/ruby/tddbc/poker/deck.rb'
# load '/Users/sakikazu/dev/ruby/tddbc/poker/card.rb'
# load '/Users/sakikazu/dev/ruby/tddbc/poker/player.rb'
require './deck'
require './card'
require './cards_set'
require './player'

class Poker
  def initialize(player_count, play_card_size)
    @deck = build_deck
    @players = participate(player_count)
    @play_card_size = play_card_size
  end

  def play
    deal_cards
    winner = buttle
    display(winner)
  end

  def deal_cards
    @players.each do |player|
      player.deal_cards(@deck, @play_card_size)
    end
  end

  def buttle
    # todo
    @players.each do |player|
      player.cards_set.compare(player.cards_set)
    end
    @players.first
  end

  private

  def participate(count)
    (1..count).map do |n|
      Player.new(n)
    end
  end

  def build_deck(joker = true)
    # todo includes_joker = false
    deck = Deck.new(joker)
    deck.shuffle
    deck
  end

  def display(winner)
    print "勝者: #{winner.cd}\n"
  end
end
