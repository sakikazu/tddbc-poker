require './cards_set'

describe CardsSet do
  describe 'straight?' do
    context 'rank: 2, 1, 3' do
      let(:cards_set) { CardsSet.new }
      before do
        cards = [2, 1, 3].map { |rank| Card.new(Card::SUIT_HEART, rank) }
        cards_set.build(cards)
      end

      it 'should be true' do
        expect(cards_set.straight?).to eq true
      end
    end

    context 'rank: 13, 12, 1' do
      let(:cards_set) { CardsSet.new }
      before do
        cards = [13, 12, 1].map { |rank| Card.new(Card::SUIT_HEART, rank) }
        cards_set.build(cards)
      end

      it 'should be true' do
        expect(cards_set.straight?).to eq true
      end
    end

    context 'rank: 13, 1, 2' do
      let(:cards_set) { CardsSet.new }
      before do
        cards = [13, 1, 2].map { |rank| Card.new(Card::SUIT_HEART, rank) }
        cards_set.build(cards)
      end

      it 'should be false' do
        expect(cards_set.straight?).to eq false
      end
    end

    context 'rank: 6, 7, 3' do
      let(:cards_set) { CardsSet.new }
      before do
        cards = [6, 7, 3].map { |rank| Card.new(Card::SUIT_HEART, rank) }
        cards_set.build(cards)
      end

      it 'should be false' do
        expect(cards_set.straight?).to eq false
      end
    end

  end
end

