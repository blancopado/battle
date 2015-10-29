require 'game'

describe Game do 
  
  let(:player1) { double :player }
  let(:player2) { double :player }
  subject(:game) { described_class.new(player1, player2) }

  describe 'initialize' do
	  describe '#player_1' do
	    it 'retrieves the first player' do
	      expect(game.player1).to eq player1
	    end
	  end

	  describe '#player_2' do
	    it 'retrieves the second player' do
	      expect(game.player2).to eq player2
	    end
	  end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(player1).to receive(:receive_damage)
      game.attack(player1)
    end
  end
	
end