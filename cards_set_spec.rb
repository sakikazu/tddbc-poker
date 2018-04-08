require './cards_set'

describe CardsSet do
  describe 'straight?' do
    context 'rank: 2, 1, 3' do
      let(:cards_set) { CardsSet.new }
      before do
        [2, 1, 3].each do |rank|
          cards_set.cards << Card.new(Card::SUIT_HEART, rank)
        end
        cards_set.set_order_index
      end

      it 'should be true' do
        expect(cards_set.straight?).to eq true
      end
    end

    context 'rank: 13, 12, 1' do
      let(:cards_set) { CardsSet.new }
      before do
        [13, 12, 1].each do |rank|
          cards_set.cards << Card.new(Card::SUIT_HEART, rank)
        end
        cards_set.set_order_index
      end

      it 'should be true' do
        expect(cards_set.straight?).to eq true
      end
    end

    context 'rank: 1, 13, 2' do
      let(:cards_set) { CardsSet.new }
      before do
        [1, 13, 2].each do |rank|
          cards_set.cards << Card.new(Card::SUIT_HEART, rank)
        end
        cards_set.set_order_index
      end

      it 'should be false' do
        expect(cards_set.straight?).to eq false
      end
    end

    context 'rank: 6, 7, 3' do
      let(:cards_set) { CardsSet.new }
      before do
        [6, 7, 3].each do |rank|
          cards_set.cards << Card.new(Card::SUIT_HEART, rank)
        end
        cards_set.set_order_index
      end

      it 'should be false' do
        expect(cards_set.straight?).to eq false
      end
    end

  end
end

