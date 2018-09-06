module ShipHit
  def hit
    if @sunk == false
      @health -= 1
    end
    if @health == 0
      @sunk = true
    end
  end
end