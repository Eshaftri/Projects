require('minitest/autorun')
require('minitest/rg')
require_relative('../models/attendant')

class AttendantTest < Minitest::Test

  def setup
    @attenant1 = Attendant.new(2, 3)
  end

  def test_crest_class
    assert_equal(Attendant, @attenant1.class)
  end



end
