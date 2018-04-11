require_relative '../src/hand'

describe Hand do
  describe HighCardHand do
    describe 'compare_cards' do
      context '[10(h), 7(h), 1(h)] AND [5(h), 7(h), 1(h)]' do
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
    end

    describe 'match_cards_notation' do
      context '10(h), 7(h), 1(h)' do
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
  end

  describe PairHand do
    describe 'compare_cards' do
      context '[7(h), 7(h), 1(h)] AND [1(h), 7(h), 1(h)]' do
        before do
          card1 = Card.new('(h)', 7)
          card2 = Card.new('(h)', 7)
          card3 = Card.new('(h)', 1)
          @hand1 = PairHand.new([card1, card2, card3])

          card4 = Card.new('(h)', 1)
          card5 = Card.new('(h)', 7)
          card6 = Card.new('(h)', 1)
          @hand2 = PairHand.new([card4, card5, card6])
        end

        it 'should be 1' do
          expect(@hand1.compare(@hand2)).to eq 1
        end
      end

      context 'same rank' do
        context '[7(h), 7(h), 1(h)] AND [7(h), 13(h), 7(h)]' do
          before do
            card1 = Card.new('(h)', 7)
            card2 = Card.new('(h)', 7)
            card3 = Card.new('(h)', 1)
            @hand1 = PairHand.new([card1, card2, card3])

            card4 = Card.new('(h)', 7)
            card5 = Card.new('(h)', 13)
            card6 = Card.new('(h)', 7)
            @hand2 = PairHand.new([card4, card5, card6])
          end

          it 'should be -1' do
            expect(@hand1.compare(@hand2)).to eq -1
          end
        end
      end
    end

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

  describe StraightFlushHand do
    describe 'match_cards_notation' do
      context '2(h), 3(h), A(h)' do
        before do
          card1 = Card.new('(h)', 2)
          card2 = Card.new('(h)', 3)
          card3 = Card.new('(h)', 1)
          @hand = StraightFlushHand.new([card1, card2, card3])
        end

        it 'should be A(h)|2(h)|3(h)' do
          expect(@hand.match_cards_notation).to eq 'A(h)|2(h)|3(h)'
        end
      end

      context 'K(h), A(h), Q(h)' do
        before do
          card1 = Card.new('(h)', 13)
          card2 = Card.new('(h)', 1)
          card3 = Card.new('(h)', 12)
          @hand = StraightFlushHand.new([card1, card2, card3])
        end

        it 'should be Q(h)|K(h)|A(h)' do
          expect(@hand.match_cards_notation).to eq 'Q(h)|K(h)|A(h)'
        end
      end
    end

    describe 'compare_cards' do
      context 'same hand' do
        context '[2(h), 3(h), A(h)] AND [K(h), A(h), Q(h)]' do
          before do
            card1 = Card.new('(h)', 2)
            card2 = Card.new('(h)', 3)
            card3 = Card.new('(h)', 1)
            @hand1 = StraightFlushHand.new([card1, card2, card3])

            card4 = Card.new('(h)', 13)
            card5 = Card.new('(h)', 1)
            card6 = Card.new('(h)', 12)
            @hand2 = StraightFlushHand.new([card4, card5, card6])
          end

          it 'should be 1' do
            expect(@hand1.compare(@hand2)).to eq 1
          end
        end
      end
    end
  end
end

