class Game
  attr_accessor :player_1, :player_2

  def initialize(player_1, player_2)
    @player_1 = Player.new(player_1)
    @player_2 = Player.new(player_2)
  end

  # Recieves action from button click  
  def turn(action)
    @player = action.key?("1") ? @player_1 : @player_2
    reduceHP(@player)
  end

  private
  def reduceHP(player)
    player.hp -= 20
  end
end
