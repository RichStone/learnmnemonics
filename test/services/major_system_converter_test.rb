require "test_helper"

class MajorSystemConverterTest < ActiveSupport::TestCase
  def setup
    @brain = brains(:rich)
    @major_system = major_systems(:wikipedia_en_original)
  end

  test ".convert physically copies the system with the right attributes" do
    assert_difference "MajorSystem.count" do
      conversion = MajorSystemConverter.convert(@major_system, @brain)

      assert_equal @major_system.origin, conversion.origin
      assert_equal @major_system.origin_url, conversion.origin_url
      assert_equal @major_system.language_iso, conversion.language_iso

      # Timestamps are not the same.
      assert_not_equal @major_system.updated_at, conversion.updated_at
      assert_not_equal @major_system.created_at, conversion.created_at

      # The brain gets associated with the conversion; old system stays nil.
      assert_nil @major_system.brain
      assert_equal @brain, conversion.brain
    end
  end

  test ".convert does only reference original peg images instead of copying" do
    skip "TODO"
  end

  test ".convert should throw error for non-public systems" do
    skip "TODO - e. g. for major_systems(:dave_system)"
  end
end
