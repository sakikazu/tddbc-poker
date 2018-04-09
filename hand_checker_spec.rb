require './hand_checker'

describe HandChecker do
  let(:hand_checker) { HandChecker.new(cards) }

  describe 'result' do
    context '2(h), 1(h), 3(h)' do
      let(:cards) { [2, 1, 3].map { |rank| Card.new(Card::SUIT_HEART, rank) } }

      it 'should be StraightFlushHand class' do
        expect(hand_checker.result.class).to eq StraightFlushHand
      end
    end

    context '2(c), 2(h), 2(d)' do
      let(:cards) { [
        Card.new(Card::SUIT_CLUB, 2),
        Card.new(Card::SUIT_HEART, 2),
        Card.new(Card::SUIT_DAIYA, 2)
      ] }

      it 'should be ThreeOfAKindHand class' do
        expect(hand_checker.result.class).to eq ThreeOfAKindHand
      end
    end

    context '2(h), 1(c), 3(h)' do
      let(:cards) { [
        Card.new(Card::SUIT_HEART, 2),
        Card.new(Card::SUIT_CLUB, 1),
        Card.new(Card::SUIT_HEART, 3)
      ] }

      it 'should be StraightHand class' do
        expect(hand_checker.result.class).to eq StraightHand
      end
    end

    context '2(h), 1(h), 5(h)' do
      let(:cards) { [2, 1, 5].map { |rank| Card.new(Card::SUIT_HEART, rank) } }

      it 'should be FlushHand class' do
        expect(hand_checker.result.class).to eq FlushHand
      end
    end

    context '2(c), 2(h), 9(d)' do
      let(:cards) { [
        Card.new(Card::SUIT_CLUB, 2),
        Card.new(Card::SUIT_HEART, 2),
        Card.new(Card::SUIT_DAIYA, 9)
      ] }

      it 'should be PairHand class' do
        expect(hand_checker.result.class).to eq PairHand
      end
    end

    context '2(c), 12(h), 9(d)' do
      let(:cards) { [
        Card.new(Card::SUIT_CLUB, 2),
        Card.new(Card::SUIT_HEART, 12),
        Card.new(Card::SUIT_DAIYA, 9)
      ] }

      it 'should be HighCardHand class' do
        expect(hand_checker.result.class).to eq HighCardHand
      end
    end

  end

  describe 'straight?' do
    context 'rank: 2, 1, 3' do
      let(:cards) { [2, 1, 3].map { |rank| Card.new(Card::SUIT_HEART, rank) } }

      it 'should be true' do
        expect(hand_checker.straight?).to eq true
      end
    end

    context 'rank: 13, 12, 1' do
      let(:cards) { [13, 12, 1].map { |rank| Card.new(Card::SUIT_HEART, rank) } }

      it 'should be true' do
        expect(hand_checker.straight?).to eq true
      end
    end

    context 'rank: 13, 1, 2' do
      let(:cards) { [13, 1, 2].map { |rank| Card.new(Card::SUIT_HEART, rank) } }

      it 'should be false' do
        expect(hand_checker.straight?).to eq false
      end
    end

    context 'rank: 6, 7, 9' do
      let(:cards) { [6, 7, 9].map { |rank| Card.new(Card::SUIT_HEART, rank) } }

      it 'should be false' do
        expect(hand_checker.straight?).to eq false
      end
    end

  end
end

