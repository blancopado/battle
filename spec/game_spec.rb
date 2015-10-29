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

    describe 'current_turn' do
      it 'is player 1 turn on a new game' do
        expect(game.current_turn).to eq player1
      end
    end
  end

  describe '#opponent_of' do
    it 'lets us know who the opponent is' do
      expect(game.opponent).to eq player2
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(player1).to receive(:receive_damage)
      game.attack(player1)
    end
  end

  describe '#switch turns' do
    it 'switches turns' do
      game.switch_turns
      expect(game.current_turn).to eq player2
    end
  end
  describe '#loser' do
    it 'returns a loser if a player has zero hit points' do
      allow(player1).to receive(:hit_points).and_return(0)
      allow(player2).to receive(:hit_points).and_return(10)
      expect(game.loser).to eq player1
    end
  end
  describe '#game_over' do
    it 'says game over if a player has no hit points' do
      allow(player1).to receive(:hit_points).and_return(0)
      allow(player2).to receive(:hit_points).and_return(10)
      expect(game.game_over?).to be true
    end
  end

    describe '#kick_attack' do
    it 'kicks the player' do
      expect(player1).to receive(:receive_kick_damage)
      game.kick_attack(player1)
    end
  end

end
