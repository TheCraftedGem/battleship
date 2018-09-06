module Validation
  def no_overlap(input)
    @validate.expand(input).each do |point|
      return false if @filled_spots.include?(point)
    end
    true
  end

  def check_if_won(space)
    puts @text.sunk_ship(space.ship.name)
    if winning_shot
      puts @text.winner(finish_time, turns)
      puts @computer.board.display
      puts @text.restart_prompt
      entry = @text.input
      restart(entry)
    end

    def check_if_lost(space)
      puts @text.comp_sunk(space.ship.name)
      if losing_shot
        puts @text.loser
        puts @player.board.display
        puts @text.restart_prompt
        entry = @text.input
        restart(entry)
      end
    end

    def check_computer_shot_result(entry)
      space = @player.board.spaces[entry[0]][entry[1].to_i]
      if space.state == 'M'
        puts @text.miss_comp(entry)
      elsif space.state == 'H'
        @player.board.add_hit
        computer_check_if_sunk(entry, space)
      end
    end
  end


  def fire_if_possible(entry)
    if @player.potential_placement.include?(entry)
      fire_at_computer(entry)
    else
      puts @text.cant_fire
      player_fires
    end
  end

  def check_shot_result(entry)
    space = @computer.board.spaces[entry[0]][entry[1].to_i]
    if space.state == 'M'
      puts @text.miss(entry)
    elsif space.state == 'H'
      player_hit_sequence(entry, space)
    end
  end
  
  def computer_check_if_sunk(entry, space)
    space.show_sunk
    puts @text.hit_comp(entry)
    if space.state == 'X'
      check_if_lost(space)
    end
  end
end