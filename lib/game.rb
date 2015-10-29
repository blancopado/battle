class Game

  attr_reader :current_turn, :opponent

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_turn = player1
    @opponent = opponent_of(@current_turn)
  end

  def attack(player)
    player.receive_damage
  end

  def player1
    @players.first
  end

  def player2
    @players.last
  end

  def switch_turns
    @current_turn = opponent_of(@current_turn)
    @opponent = opponent_of(@current_turn)
  end

  def loser
    losing_players.first
  end

  def game_over?
    losing_players.any?
  end

  def kick_attack(player)
    player.receive_kick_damage
  end

  private
  def opponent_of(player)
    @players.select { |current_player| current_player != player }.first
  end
  def losing_players
    @players.select {|player| player.hit_points <= 0 }
  end

end
