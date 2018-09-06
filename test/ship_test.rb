require './test/test_helper'
require './lib/ship'

class ShipTest < Minitest::Test
  def test_it_exists
    ship = Ship.new(2)

    assert_instance_of Ship, ship
  end

  def test_length
    ship = Ship.new(2)

    assert_equal 2, ship.length
  end

  def test_health_equal_to_length
    ship = Ship.new(2)

    assert_equal 2, ship.health
  end

  def test_not_sunk_on_initialize
    ship = Ship.new(2)

    refute ship.sunk
  end

  def test_different_ship_name_based_on_length
    cruiser = Ship.new(2)
    destroyer = Ship.new(3)

    assert_equal 'cruiser', cruiser.name
    assert_equal 'destroyer', destroyer.name
  end

  def test_hit_subtracts_health
    ship = Ship.new(2)

    assert_equal 2, ship.health

    ship.hit
    refute ship.sunk
    assert_equal 1, ship.health
  end

  def test_sunk_a_cruiser
    cruiser = Ship.new(2)

    assert_equal 2, cruiser.health
    refute cruiser.sunk

    cruiser.hit
    cruiser.hit

    assert cruiser.hit
    assert_equal 0, cruiser.health
    assert cruiser.sunk
  end
end