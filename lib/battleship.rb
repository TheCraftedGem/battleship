require './lib/computer'
require './lib/player'
require './lib/text'
require './lib/validate'
require './lib/modules/ship_set_up'
require './lib/modules/turns'
require './lib/modules/timer'
require './lib/modules/validation'
require 'pry'

class Battleship
  include ShipSetUp
  include Turns
  include Timer
  include Validation

  attr_reader :player,
              :computer,
              :text,
              :game_over,
              :turns

  attr_accessor :start_time

  def initialize
    @game_over = false
    @text = Text.new
    @computer = Computer.new
    @player = Player.new
    @turns = 0
  end
  #initialize
  def start_game
      puts @text.welcome
    loop do
      puts @text.intro
      break if @text.decision(@text.input)
    end
  end
  #action
  def player_fires
    puts @computer.board.display
    puts @text.enter_position
    entry = @text.input
    puts `clear`
    fire_if_possible(entry)
  end
  #action
  def fire_at_computer(entry)
    add_turn
    @computer.board.shoot(entry)
    check_shot_result(entry)
    @player.remove_guess_from_potencial_placement(entry)
  end
  #action/query
  def player_hit_sequence(entry, space)
    @computer.board.add_hit
    space.show_sunk
    puts @text.hit(entry)
    if space.state == 'X'
      check_if_won(space)
    end
    space
  end
  #action
  def computer_fires
    entry = @computer.potential_placement.sample
    puts `clear`
    @player.board.shoot(entry)
    check_comp_shot_result(entry)
    @computer.remove_guess_from_potencial_placement(entry)
  end
  #action
  def restart(entry)
    if entry == 'R'
      @game_over = true
    elsif entry == 'Q'
      puts @text.quit_game
      exit
    else
      restart
    end
  end
  #refactor to make more dynamic
  def winning_shot
    @computer.board.hits == 5
  end

  def losing_shot
    @player.board.hits == 5
  end
end
