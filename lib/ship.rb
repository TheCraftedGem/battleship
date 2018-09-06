require './lib/modules/ship_name'
require './lib/modules/ship_hit'

class Ship
  include ShipName
  include ShipHit

  attr_reader :length,
              :health,
              :sunk
  def initialize(length)
    @sunk = false
    @length = length
    @health = length
  end
end