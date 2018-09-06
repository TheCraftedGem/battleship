require './lib/space'
require './lib/ship'

class Board
  attr_accessor :name,
                :spaces,
                :hits

  def initialize(name)
    @name = name
    @spaces = { 'A' => {1=>Space.new, 2=>Space.new, 3=>Space.new, 4=>Space.new},
                'B' => {1=>Space.new, 2=>Space.new, 3=>Space.new, 4=>Space.new},
                'C' => {1=>Space.new, 2=>Space.new, 3=>Space.new, 4=>Space.new},
                'D' => {1=>Space.new, 2=>Space.new, 3=>Space.new, 4=>Space.new}
              }
    @hits = 0
  end

  def add_hit
    @hits += 1
  end

  def update_board_if_ship_sunk
    @spaces.each do |row|
      row[1].each do |space|
        space[1].show_sunk
      end
    end
  end

  def shoot(position)
    @spaces[position[0]][position[1].to_i].shot
  end

  def display
    update_board_if_ship_sunk
"\n#{@name}
=========
. 1 2 3 4
A #{@spaces['A'][1].state} #{@spaces['A'][2].state} #{@spaces['A'][3].state} #{@spaces['A'][4].state}
B #{@spaces['B'][1].state} #{@spaces['B'][2].state} #{@spaces['B'][3].state} #{@spaces['B'][4].state}
C #{@spaces['C'][1].state} #{@spaces['C'][2].state} #{@spaces['C'][3].state} #{@spaces['C'][4].state}
D #{@spaces['D'][1].state} #{@spaces['D'][2].state} #{@spaces['D'][3].state} #{@spaces['D'][4].state}
========="
  end

  def place_ship(position_input)
      numbers = get_numbers(position_input)
      letters = get_letters(position_input)
      ship = Ship.new(position_input.length)
      letters.each_with_index do |letter, index|
          @spaces[letter][numbers[index]].fill(ship)
      end
  end

  def letters
    ['A', 'B', 'C', 'D']
  end

  def get_letters(spaces)
    spaces.map {|space| space[0]}
  end

  def get_numbers(spaces)
    spaces.map {|space| space[1].to_i}
  end
end