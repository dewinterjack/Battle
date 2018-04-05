require 'sinatra/base'
require_relative './lib/player.rb'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    # session[:player1_HP] = 100
    # session[:player2_HP] = 100
    erb(:index)
  end

  post '/names' do
    session[:player_1] = Player.new(params[:player1_name])
    session[:player_2] = Player.new(params[:player2_name])
    redirect to('/play')
  end

  get '/play' do
    @player1_HP = session[:player_1].hp
    @player2_HP = session[:player_2].hp
    @player1_name = session[:player_1].name
    @player2_name = session[:player_2].name
    erb :play
  end

  post '/attack_player2' do
    session[:player2].hp -= 20
    redirect to('/play')
  end

  post '/attack_player1' do
    session[:player1].hp -= 20
    redirect to('/play')
  end

  run! if app_file == $0
end
