# load '/Users/sakikazu/dev/ruby/tddbc/poker/deck.rb'
# load '/Users/sakikazu/dev/ruby/tddbc/poker/card.rb'
# load '/Users/sakikazu/dev/ruby/tddbc/poker/player.rb'
require './deck'
require './card'
require './player'

class Poker
  def initialize(player_count, play_card_count)
    @deck = build_deck
    @players = participate(player_count)
    @play_card_count = play_card_count
  end

  def play
    deal_cards
    winner = buttle
    display(winner)
  end

  private

  def deal_cards
    @players.each do |player|
      player.deal_cards(@deck, @play_card_count)
    end
  end

  def participate(count)
    players = []
    1.upto(count) do |n|
      players << Player.new(n)
    end
    players
  end

  def build_deck(joker = true)
    # todo includes_joker = false
    deck = Deck.new(joker)
    deck.shuffle
    deck
  end

  def buttle
    @players.each do |play|
    end
    # todo
    @players.first
  end

  def display(winner)
    print "勝者: #{winner.cd}\n"
  end
end
