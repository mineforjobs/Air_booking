require 'test_helper'

class SeatTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  def test_should_find_seat
    seat_id = seats(:one).id
    assert_nothing_raised {Seat.find(seat_id)}
  end

  def test_should_destroy_seat
    seat = seats(:one)
    seat.destroy
    assert_raise(ActiveRecord::RecordNotFound) {Seat.find(seat.id)
    }
    end

end
