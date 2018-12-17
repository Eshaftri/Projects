require('minitest/autorun')
require('minitest/rg')
require_relative('../models/member')

class MemberTest < Minitest::Test

  def setup
    @member1 = Member.new("mohamed", "eshaftri", "MR", "st albons", "20/09/1977")
  end

  def test_create_class
    assert_equal(Member, @member1.class)
  end

end
