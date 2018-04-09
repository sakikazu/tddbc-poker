require './poker'

describe Poker do
  let(:poker) { Poker.new(2, 3) }

  describe 'play' do
    it 'should has @players count 2' do
      expect(poker.players.size).to eq 2
    end
  end

  describe 'display' do
    before do
      poker.play
    end
    it 'should output result' do
      # TODO ()だと別のエラーになる。なぜ？
      expect {poker.display}.to output(/ランキング/).to_stdout
    end
  end
end

