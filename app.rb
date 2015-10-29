require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  def save_state
    @player_1 = $game.player1
    @player_2 = $game.player2
    @current_turn = $game.current_turn
    @opponent = $game.opponent
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    save_state
    @current_turn = $game.current_turn
    erb :play
  end

  post '/attack' do
    save_state
    $game.attack(@opponent)
    if $game.game_over?
      redirect '/game_over'
    else
      redirect '/attack'
    end
  end

  get '/attack' do
    save_state
    $game.switch_turns
    erb :attack
  end

  get '/game_over' do
    @loser = $game.loser
    erb (:game_over)
  end

  post '/new_game' do
    redirect '/'
  end
    # start the server if ruby file executed directly
  run! if app_file == $0
end
