require './test/test_helper'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_it_exists
    player = Player.new

    assert_instance_of Player, player
  end

  def test_it_initializes_a_board
    player = Player.new

    assert_instance_of Board, player.board
  end

  def test_starts_with_potencial_shot_choices
    player = Player.new
    expected = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]
    actual = player.potential_placement

    assert_equal expected, actual
  end

  def test_initializes_check_class_for_input_validation
   skip
    player = Player.new

    assert_instance_of Validate, player.validate
  end

  def test_enter_cruiser_into_ship_location
    player = Player.new
    assert player.enter_cruiser('A1 A2')

    refute player.enter_cruiser('A1 A3')

    assert_equal [['A1', 'A2']], player.ship_locations
  end

  def test_enter_two_ships_adds_to_fill_locations
    player = Player.new

    assert player.enter_cruiser('A1 A2')

    assert_equal ['A1','A2'], player.filled_spots
  end

  def test_enter_three_ship_adds_array_of_3_to_ship_locations
    player = Player.new

    player.enter_cruiser('A1 A2')
    player.enter_destroyer('B2 B4')
    refute player.enter_destroyer('A1 A2')

    expected = [['A1', 'A2'], ['B2', 'B3', 'B4']]
    actual = player.ship_locations

    assert_equal expected, actual
  end

  def test_enter_three_changes_and_returns_flattened_array_of_filled_spots
    player = Player.new

    assert player.enter_cruiser('A1 A2')
    assert player.enter_destroyer('B2 B4')

    expected2 = ['A1', 'A2', 'B2', 'B3', 'B4']
    actual = player.filled_spots

    assert_equal expected2, actual
  end

  def test_it_sets_up_ships_using_arrays_in_ship_locations
    player = Player.new

    player.enter_cruiser('A1 A2')
    player.enter_destroyer('B2 B4')
    player.set_up_ships

    assert_instance_of Ship, player.board.spaces['A'][1].ship
    assert_equal 'cruiser', player.board.spaces['A'][1].ship.name
    assert_instance_of Ship, player.board.spaces['A'][2].ship
    assert_equal 'cruiser', player.board.spaces['A'][2].ship.name
    assert_instance_of Ship, player.board.spaces['B'][2].ship
    assert_equal 'destroyer', player.board.spaces['B'][2].ship.name
    assert_instance_of Ship, player.board.spaces['B'][3].ship
    assert_equal 'destroyer', player.board.spaces['B'][3].ship.name
    assert_instance_of Ship, player.board.spaces['B'][4].ship
    assert_equal 'destroyer', player.board.spaces['B'][4].ship.name
  end

  def test_array_of_ship_points_doesnt_overlap_with_already_placed_ships
    player = Player.new

    player.enter_cruiser('A1 A2')

    assert player.no_overlap('B1 B3')
    refute player.no_overlap('A1 A3')
  end

  def test_it_removes_guess_from_possible_guesses
    player = Player.new
    expected1 = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]
    assert_equal expected1, player.potential_placement

    expected2 = %w[A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]
    player.remove_guess_from_potencial_placement('A1')
    assert_equal expected2, player.potential_placement
  end
end
