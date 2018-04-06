require 'sinatra/base'
require_relative './lib/player.rb'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:player_1] = Player.new(params[:player1_name])
    session[:player_2] = Player.new(params[:player2_name])
    redirect to('/play')
  end

  get '/play' do
    @player_1 = session[:player_1]
    @player_2 = session[:player_2]
    erb :play
  end

  post '/attack_player' do
    p params
    params.has_key?("2") ? session[:player_2].hp -= 20 : session[:player_1].hp -= 20
    redirect to('/play')
  end

  run! if app_file == $0
end
