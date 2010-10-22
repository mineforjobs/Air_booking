require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  def test_should_create_flight
  flight = Flight.new(:dipature=> flights(:one).dipature,:arrival=>flights(:one).arrival,:destination=>flights(:one).destination,:baggage_allowance=>flights(:one).baggage_allowance,:capacity=>flights(:one).capacity)
    assert flight.save
  end

  def test_should_find_flight
    flight = flights(:one).id
    assert_nothing_raised {Flight.find(flight)}
  end

  def test_should_destroy_flight
    flight = flights(:two)
    flight.destroy
    assert_raise(ActiveRecord::RecordNotFound) {Flight.find(flight.id)
    }
    end

end
