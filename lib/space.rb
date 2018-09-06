require './lib/ship'

class Space
  attr_reader :ship,
              :state

  def initialize
    @ship = nil
    @state = " "
  end

  def fill(ship)
    @ship = ship
  end

  def shot
    if @ship == nil
      @state = 'M'
    else
      @ship.hit
      @state = 'H'
    end
  end

  def show_sunk
    if @ship != nil && @ship.sunk
        @state = 'X'
    end
  end
end