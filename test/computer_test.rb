require './test/test_helper'
require './lib/computer'

class ComputerTest < Minitest::Test
  def setup
    @computer = Computer.new
  end
  def test_if_it_exists
    assert_instance_of Computer, @computer
  end

  def test_it_initializes_a_board
    assert_instance_of Board, @computer.board
  end

  def test_initializes_possible_shot_choices
    expected = (%w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4])
    actual = @computer.potential_placement

    assert_equal expected, actual
  end

  def test_sets_up_ships_using_entered_arrays
    @computer.set_up_ships(%w[A1 A2], %w[B2 B3 B4])

    assert_instance_of Ship, @computer.board.spaces['A'][1].ship
    assert_equal 'cruiser', @computer.board.spaces['A'][1].ship.name
    assert_instance_of Ship, @computer.board.spaces['A'][2].ship
    assert_equal 'cruiser', @computer.board.spaces['A'][2].ship.name
    assert_instance_of Ship, @computer.board.spaces['B'][2].ship
    assert_equal 'destroyer', @computer.board.spaces['B'][2].ship.name
    assert_instance_of Ship, @computer.board.spaces['B'][3].ship
    assert_equal 'destroyer', @computer.board.spaces['B'][3].ship.name
    assert_instance_of Ship, @computer.board.spaces['B'][4].ship
    assert_equal 'destroyer', @computer.board.spaces['B'][4].ship.name
  end

  def test_it_removes_guess_from_potential_placement
    unaltered_choices = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]
    assert_equal unaltered_choices, @computer.potential_placement

    altered_choices = %w[A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]
    @computer.remove_potential_placement('A1')
    assert_equal altered_choices, @computer.potential_placement
  end
end
