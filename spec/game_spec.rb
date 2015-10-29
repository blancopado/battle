require 'game'

describe Game do 

  subject(:game) { described_class.new }
  let(:player) { double :player }

  describe '#attack' do
    it 'damages the player' do
      expect(player).to receive(:receive_damage)
      game.attack(player)
    end
  end
	
end