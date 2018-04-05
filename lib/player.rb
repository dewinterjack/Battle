class Player
  attr_accessor :name, :hp
  DEFAULT_HP = 100
  def initialize(name, hp = DEFAULT_HP)
    @name = name
    @hp = hp
  end
end
