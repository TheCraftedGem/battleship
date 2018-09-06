require './lib/board'
require 'pry'

class Computer

  attr_reader :board,
              :potential_placement

  def initialize
    @board = Board.new('Opponents Grid')
    @cruisers = [%w[B1 C1], %w[B3 C3], %w[D3 D4]]
    @destroyers = [%w[A1 A2 A3], %w[B2 C2 D2], %w[A4 B4 C4]]
    @potential_placement = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]
  end

  def set_up_ships(cruisers = @cruisers.sample, destroyers = @destroyers.sample)
    [cruisers, destroyers].each {|ship| @board.place_ship(ship)}
  end

  def remove_potential_placement(entry)
    @potential_placement.delete(entry)
  end
end
