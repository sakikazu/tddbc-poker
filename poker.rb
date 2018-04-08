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
    buttle
    display
  end

  def deal_cards
    @players.each do |player|
      player.deal_cards(@deck, @play_card_size)
    end
  end

  def buttle
    @players.sort! do |a, b|
      a.hand.compare(b.hand)
    end
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

  def display
    print "ランキング\n"
    @players.each do |player|
      print "#{player.cd}:#{player.hand.name}[#{player.hand.match_cards_notation}]\n"
    end
  end
end
