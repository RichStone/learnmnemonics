require "application_system_test_case"

class BrainMajorSystemTest < ApplicationSystemTestCase
  def setup
    login_as brains(:rich)
    @richs_system = brains(:rich).major_systems.first
  end

  test "#index shows a brain's major systems" do
    visit brain_major_systems_url
    assert_selector "h1", text: "Your major systems"
  end

  test "#show displays a brain's specific major system" do
    visit brain_major_system_url(@richs_system)
    assert_selector "h1", text: @richs_system.origin
  end

  test "#show does not display someone else's major system" do
    skip "TODO"
  end
end
