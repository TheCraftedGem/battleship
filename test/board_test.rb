require './test/test_helper'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test
  def test_it_exists
    board = Board.new('comp')

    assert_instance_of Board, board
  end

  def test_spaces_initializes_a_hash_of_hashes_containing_space_objects
    board = Board.new('comp')

    assert_instance_of Space, board.spaces['A'][1]
    assert_instance_of Space, board.spaces['B'][2]
    assert_instance_of Space, board.spaces['C'][3]
    assert_instance_of Space, board.spaces['D'][4]
  end

  def test_get_numbers
    board = Board.new('comp')

    expected = [1, 2, 3]
    actual = board.get_numbers(['A1', 'A2', 'A3'])

    assert_equal expected, actual
  end

  def test_it_shoots_at_correct_position
    board = Board.new('Opponents Grid')
    assert_nil board.spaces['A'][1].ship
    assert_nil board.spaces['A'][2].ship

    board.place_ship(['A1', 'A2'])

    assert_instance_of Ship, board.spaces['A'][1].ship
    assert_instance_of Ship, board.spaces['A'][2].ship
  end

  def test_get_letters
    board = Board.new('Opponents Grid')

    expected = ['A', 'A', 'A']
    actual = board.get_letters(['A1', 'A2', 'A3'])

    assert_equal expected, actual
  end

  def test_it_places_ship_object
    board = Board.new('Opponents Grid')

    board.place_ship(["A1", "A2"])
    expected = "cruiser"
    actual1 = board.spaces['A'][1].ship.name
    actual2 = board.spaces['A'][2].ship.name

    assert_equal expected, actual1
    assert_equal expected, actual2
  end

  def test_it_shoots_at_position
    board = Board.new('Opponents Grid')

    board.shoot("A2")
    expected = "M"
    actual = board.spaces['A'][2].state

    assert_equal expected, actual
  end

  def test_add_hit_adds_one_to_hits
    board = Board.new('Player Grid')

    assert_equal 0, board.hits
    assert_equal 1, board.add_hit
    assert_equal 1, board.hits
  end

  def test_displays_board
    board = Board.new('Player Grid')
    actual = board.display
    expected = "\nPlayer Grid
=========
. 1 2 3 4
A        
B        
C        
D        
========="
    assert_equal expected, actual
  end
end