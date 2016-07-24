require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'
require './lib/round.rb'

class RockPaperScissors < Sinatra::Base

  before do
    @game = Game.instance
    @weapon_list = Game.weapon_list
  end 

  get '/' do
    erb(:index)
  end

  get '/enter_names' do
    @players = params[:players]
    erb(:enter_names)
  end 

  post '/names' do
    player_1 = Player.new(name: params[:player_1])
  	player_2 = Player.new(name: params[:player_2])
    @game = Game.create(player_1: player_1, player_2: player_2)
    redirect '/select_game'
  end

  get '/select_game' do
    @options = [["Rock, Paper, Scissors, Lizard, Spock","RPSLS"], "Fantasy", "Space", "Dinosaurs"]
    erb(:select_game)
  end

  post '/game_type' do
    Game.set_game_type(type: params[:game_type])
    redirect '/play'
  end

  get '/play' do
	 erb(:play)
  end

  post '/choose_weapon' do
    @game.start_round
    @game.player_1.choose_weapon(weapon: params[:chosen_weapon_1])
    @game.player_2.choose_weapon(weapon: params[:chosen_weapon_2])
    redirect '/result'
  end

  get '/result' do
    @game.round.execute
    erb(:result)
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
