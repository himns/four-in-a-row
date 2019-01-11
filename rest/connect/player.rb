class Player

  attr_accessor :name, :disc_position

  def initialize(name)
    @name = name
    @disc_position = []
  end

  def store_disc_position(x, y)
    @disc_position << [x, y]
  end 

end