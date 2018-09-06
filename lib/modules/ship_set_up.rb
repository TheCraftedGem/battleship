module ShipSetUp
  def set_up_ships
    if @ship_locations.length == 2
      @ship_locations.each {|location| @board.place_ship(location)}
    end
  end

  def enter_cruiser(input)
    if @validate.cruiser(input)
      @ship_locations << input.split(" ").sort
      @filled_spots = @ship_locations.flatten
      true
    else
      false
    end
  end

  def enter_destroyer(input)
    if @validate.destroyer(input)
      if no_overlap(input)
        @ship_locations << @validate.expand(input)
        @filled_spots = @ship_locations.flatten
        true
      end
    else
      false
    end
  end

  def place_computer_ships
    @computer.set_up_ships
    puts @text.computer_place_ships
  end

  def place_first_ship
    puts @text.cruiser
    input = @text.input
    place_cruiser_if_valid(input)
  end
 
  def place_second_ship
    puts @text.destroyer
    input = @text.input
    place_destroyer_if_valid(input)
  end

  def set_destroyer(input)
    if @player.validate.destroyer(input) && @player.no_overlap(input)
      puts `clear`
      @player.enter_destroyer(input)
      @start_time = Time.now
    else
      puts @text.not_destroyer
      place_second_ship
    end
  end

  def place_destroyer_if_valid(input)
    if @player.validate.valid(input)
      return set_destroyer(input)
    else
      puts @text.invalid('A1 A3')
      place_second_ship
    end
  end

  def set_cruiser(input)
    if @player.validate.cruiser(input)
      puts @text.placed
      @player.enter_cruiser(input)
    else
      puts @text.not_cruiser
      place_first_ship
    end
  end

  def place_cruiser_if_valid(input)
    if @player.validate.valid(input)
      set_cruiser(input)
    else
      puts @text.invalid('A1 A2')
      place_first_ship
    end
  end

end