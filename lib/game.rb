class Game
  attr_accessor :player_1, :player_2
  ATTACK_HP = 15
  def initialize(player_1, player_2)
    @player_1 = Player.new(player_1)
    @player_2 = Player.new(player_2)
  end

  # Recieves action from button click
  def turn(action)
    @player = action.key?("1") ? @player_1 : @player_2
    reduceHP(@player)
  end

  def reduceHP(player)
    player.hp -= ATTACK_HP if (player.hp - ATTACK_HP) >= 0
  end

end
