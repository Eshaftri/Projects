require('minitest/autorun')
require('minitest/rg')
require_relative('../models/event')

class EventTest < Minitest::Test

  def setup
    @event1 = Event.new("zomba", "29/12/18", "20:10", 2)
  end

  def test_create_class
    assert_equal(Event, @event1.class)
  end


end
