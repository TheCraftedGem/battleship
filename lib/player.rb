require './lib/board'
require './lib/ship'
require './lib/validate'
require './lib/modules/ship_set_up'
require './lib/modules/validation'

class Player
  include ShipSetUp
  include Validation

  attr_reader :board,
              :potential_placement,
              :ship_locations,
              :filled_spots,
              :validate

  def initialize
    @board = Board.new('Your Board:')
    @validate = Validate.new
    @ship_locations = []
    @filled_spots = []
    @potential_placement = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]
  end

  def remove_guess_from_potencial_placement(entry)
    @potential_placement.delete(entry)
  end
end
