require_relative './player.rb'

class Game
  attr_accessor :player_1, :player_2
  ATTACK_HP = 15
  def initialize(player_1, player_2)
    @player_1 = Player.new(player_1)
    @player_2 = Player.new(player_2)
  end

  # Recieves action from button click
  def turn(action)
    if action.key?("1") then
      @player = @player_1
      @move = action["1"]
    else
      @player = @player_2
      @move = action["2"]
    end

    reduceHP(@player, @move)
  end
  private

  def reduceHP(player, move)
    damage = calcDmg(move)
    player.hp -= damage if (player.hp - damage) >= 0
  end

  def calcDmg(move)
    case move
    when "Scratch"
      damage = 20
    else 
      damage = 10
    end
    return damage 
  end
end
