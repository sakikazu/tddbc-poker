require_relative 'deck'
require_relative 'card'
require_relative 'hand_checker'
require_relative 'player'

class Poker
  attr_reader :deck, :players

  def initialize(player_count, play_card_count)
    @deck = Deck.new
    @players = Player.participate(player_count)
    @play_card_count = play_card_count
  end

  def play
    @deck.build
    deal_cards
    buttle
  end

  def display
    print "ランキング\n"
    @players.each do |player|
      print "#{player.cd}:#{player.hand.name}[#{player.hand.match_cards_notation}]\n"
    end
  end

  private

  def deal_cards
    @players.each do |player|
      player.deal_cards(@deck, @play_card_count)
    end
  end

  def buttle
    @players.sort! do |a, b|
      a.hand.compare(b.hand)
    end
  end
end
