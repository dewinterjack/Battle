require 'sinatra/base'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:game] = Game.new(params[:player_1_name], params[:player_2_name])
    redirect to('/play')
  end

  get '/play' do
    p session[:game]
    @player_1 = session[:game].player_1
    @player_2 = session[:game].player_2
    erb :play
  end

  post '/attack_player' do
    session[:game].turn(params)
    redirect to('/play')
  end

  run! if app_file == $0
end
