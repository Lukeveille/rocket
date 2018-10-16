require "minitest/autorun"
require_relative "rocket"

class RocketTest < Minitest::Test
  # Testing rocket initial state
  def test_rocket_has_name
    test_rocket = Rocket.new
    assert test_rocket.name, 'Rocket cannot be created without a name.'
  end
  def test_rocket_has_colour
    test_rocket = Rocket.new
    assert test_rocket.colour, 'Rocket cannot be created without a colour.'
  end
  def test_rocket_is_landed_when_created
    test_rocket = Rocket.new
    refute test_rocket.flying?, 'Rocket must be landed when it is create.'
  end

  # Testing rocket lift off and landing
  def test_rocket_lifts_off
    test_rocket = Rocket.new
    test_rocket.lift_off
    assert test_rocket.flying?, 'Rocket should be flying after lift off.'
  end
  def test_lift_when_flying_returns_false
    test_rocket = Rocket.new
    test_rocket.lift_off
    test_return = test_rocket.lift_off
    refute test_return, 'Lift off should return false if rocket is already flying.'
  end
  def test_landing_when_flying
    test_rocket = Rocket.new
    test_rocket.lift_off
    test_rocket.land
    refute test_rocket.flying?, 'Rocket should not be flying after a land.'
  end
  def test_landing_when_landed
    test_rocket = Rocket.new
    refute test_rocket.land, 'Rocket should not be able to land while landed.'
  end

  # Testing status messages
  def test_status_message_when_landed
    test_rocket = Rocket.new
    assert test_rocket.status == "Rocket #{test_rocket.name} is ready for lift off!", 'That is not the correct status message for a landed rocket.'
  end
  def test_status_message_when_landed
    test_rocket = Rocket.new
    test_rocket.lift_off
    assert test_rocket.status == "Rocket #{test_rocket.name} is flying through the sky!", 'That is not the correct status message for a flying rocket.'
  end
end