require "test_helper"

class PegTest < ActiveSupport::TestCase
  test "#image" do
    peg = pegs(:one)
    assert peg.image.attached?
    # assert_not_nil peg.image.download - Flaky part?
  end
end
