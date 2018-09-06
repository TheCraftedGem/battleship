module ShipName
  def name
    if @length == 2
      "cruiser"
    elsif @length == 3
      "destroyer"
    end
  end
end