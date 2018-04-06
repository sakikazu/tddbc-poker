require './card'

describe Card do
  describe 'notation' do
    context '♠ and 3' do
      let(:card) { Card.new("♠", "3") }

      it 'should show 3♠' do
        expect(card.notation).to eq "3♠"
      end
    end
  end

  describe 'has_same_suit?' do
    let(:card1) { Card.new("♠", "3") }
    let(:card2) { Card.new("♠", "A") }
    let(:card3) { Card.new("◆", "A") }

    context '3♠ and A♠' do
      it 'should be true' do
        expect(card1.has_same_suit?(card2)).to eq true
      end
    end

    context 'A◆ and A♠' do
      it 'should be false' do
        expect(card1.has_same_suit?(card3)).to eq false
      end
    end
  end
end
