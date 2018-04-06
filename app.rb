require 'sinatra/base'
require_relative './lib/player.rb'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_1 = Player.new(params[:player1_name])
    $player_2 = Player.new(params[:player2_name])
    redirect to('/play')
  end

  get '/play' do
    erb :play
  end

  post '/attack_player' do
    $player.hp -= 20
    redirect to('/play')
  end


  post '/attack_player2' do
    $player_2.hp -= 20
    redirect to('/play')
  end

  post '/attack_player1' do
    p params
    $player_1.hp -= 20
    redirect to('/play')
  end

  run! if app_file == $0
end
