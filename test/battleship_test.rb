require './test/test_helper'
require './lib/battleship'

class BattleshipTest < Minitest::Test
  def test_place_two_ship_if_valid
    battleship = Battleship.new

    assert_instance_of Battleship, battleship
  end

  def test_initializes_text_computer_player_class
    battleship = Battleship.new

    assert_instance_of Text, battleship.text
    assert_instance_of Computer, battleship.computer
    assert_instance_of Player, battleship.player
  end

  def test_turns_starts_at_zero
    battleship = Battleship.new

    assert_equal 0, battleship.turns
  end

  def test_game_over_is_false_initially
    battleship = Battleship.new

    refute battleship.game_over
  end

  def test_placement_of_valid_cruiser
    battleship = Battleship.new

    assert battleship.place_cruiser_if_valid('A1 A2')
  end

  def test_set_cruiser
    battleship = Battleship.new
    assert battleship.set_cruiser('A1 A2')
  end

  def test_three_ship_if_valid
    battleship = Battleship.new

    assert battleship.place_destroyer_if_valid('A1 A3')
  end

  def test_set_destroyer
    battleship = Battleship.new
    assert battleship.set_destroyer('A1 A3')
  end

  def test_fire_if_possible
    battleship = Battleship.new

    assert_equal 'A1', battleship.fire_if_possible('A1')
  end

  def test_check_shot_result
    battleship = Battleship.new

    assert_nil battleship.check_shot_result('A1')
    battleship.computer.board.place_ship(['A2'])
    battleship.computer.board.shoot('A2')
    expected = battleship.computer.board.spaces['A'][2]
    actual = battleship.check_shot_result('A2')
    assert_equal expected, actual
  end

  def test_restart
    battleship = Battleship.new
    assert battleship.restart('R')
    assert battleship.game_over
  end

  def test_computer_winning_shot
    battleship = Battleship.new

    refute battleship.winning_shot
    battleship.computer.board.add_hit
    battleship.computer.board.add_hit
    battleship.computer.board.add_hit
    battleship.computer.board.add_hit
    battleship.computer.board.add_hit
    assert battleship.winning_shot
  end

  def test_player_winning_shot
    battleship = Battleship.new

    refute battleship.losing_shot
    battleship.player.board.add_hit
    battleship.player.board.add_hit
    battleship.player.board.add_hit
    battleship.player.board.add_hit
    battleship.player.board.add_hit
    assert battleship.losing_shot
  end

  def test_add_turn
    battleship = Battleship.new

    assert_equal 0, battleship.turns
    assert_equal 1, battleship.add_turn
  end
end