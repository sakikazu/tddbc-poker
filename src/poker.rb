require_relative 'deck'
require_relative 'card'
require_relative 'hand_checker'
require_relative 'player'

class Poker
  attr_reader :deck, :players

  def initialize(player_count, play_card_count)
    @deck = build_deck
    @players = participate(player_count)
    @play_card_count = play_card_count
  end

  def play
    deal_cards
    buttle
  end

  def display
    print "ランキング\n"
    @players.each do |player|
      print "#{player.cd}:#{player.hand.name}[#{player.hand.match_cards_notation}]\n"
    end
  end

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

  private

  def participate(count)
    (1..count).map do |n|
      Player.new(n)
    end
  end

  def build_deck(joker = false)
    # todo includes_joker = false
    deck = Deck.new(joker)
    deck.shuffle
    deck
  end
end
