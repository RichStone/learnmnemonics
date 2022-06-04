require "test_helper"

class MajorSystemPegTest < ActiveSupport::TestCase
  test "#image" do
    peg = major_system_pegs(:one)
    assert peg.image.attached?
    assert_not_nil peg.image.download
  end
end
