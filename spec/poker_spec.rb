require_relative '../src/poker'

describe Poker do
  let(:poker) { Poker.new(2, 3) }

  describe 'play' do
    it 'should has @players count 2' do
      expect(poker.players.size).to eq 2
    end

    xit 'should sort @players by strength' do
      # TODO スタブでできる？もしくはwrite_attributeみたいなやつ
    end
  end

  describe 'display' do
    before do
      poker.play
    end
    it 'should output result' do
      # TODO expectにブロック渡しじゃないと別のエラーになる。なぜ？
      expect {poker.display}.to output(/ランキング/).to_stdout
    end
  end
end

