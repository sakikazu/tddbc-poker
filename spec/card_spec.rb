require_relative '../src/card'

describe Card do
  describe 'notation' do
    context '(s) and A' do
      let(:card) { Card.new("(s)", "A") }

      it 'should be A(s)' do
        expect(card.notation).to eq "A(s)"
      end
    end

    context '(s) and 1' do
      let(:card) { Card.new("(s)", 1) }

      it 'should be A(s)' do
        expect(card.notation).to eq "A(s)"
      end
    end
  end

  describe 'has_same_suit?' do
    let(:card1) { Card.new("(s)", "3") }
    let(:card2) { Card.new("(s)", "A") }
    let(:card3) { Card.new("(d)", "A") }

    context '3(s) and A(s)' do
      it 'should be true' do
        expect(card1.has_same_suit?(card2)).to eq true
      end
    end

    context 'A(d) and A(s)' do
      it 'should be false' do
        expect(card1.has_same_suit?(card3)).to eq false
      end
    end
  end
end
