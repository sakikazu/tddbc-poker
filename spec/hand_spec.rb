require_relative '../src/hand'

describe Hand do
  describe HighCardHand do
    describe 'compare_cards' do
      before do
        card1 = Card.new('(h)', 10)
        card2 = Card.new('(h)', 7)
        card3 = Card.new('(h)', 1)
        @hand1 = HighCardHand.new([card1, card2, card3])

        card4 = Card.new('(h)', 5)
        card5 = Card.new('(h)', 7)
        card6 = Card.new('(h)', 1)
        @hand2 = HighCardHand.new([card4, card5, card6])
      end

      it 'should be -1' do
        expect(@hand1.compare(@hand2)).to eq -1
      end
    end

    describe 'match_cards_notation' do
      before do
        card1 = Card.new('(h)', 10)
        card2 = Card.new('(h)', 7)
        card3 = Card.new('(h)', 1)
        @hand = HighCardHand.new([card1, card2, card3])
      end

      it 'should be 7(h)|10(h)|A(h)' do
        expect(@hand.match_cards_notation).to eq '7(h)|10(h)|A(h)'
      end
    end
  end

  describe PairHand do
    describe 'match_cards_notation' do
      before do
        card1 = Card.new('(h)', 1)
        card2 = Card.new('(c)', 10)
        card3 = Card.new('(s)', 1)
        @hand = PairHand.new([card1, card2, card3])
      end

      it 'should be A(h)|A(s)' do
        expect(@hand.match_cards_notation).to eq 'A(h)|A(s)'
      end
    end
  end
end

