require "application_system_test_case"

class BrainMajorSystemTest < ApplicationSystemTestCase
  def setup
    login_as brains(:rich)
    @rich_system = brains(:rich).major_systems.first
  end

  test "#index displays a brain's major systems" do
    visit brain_major_systems_url
    assert_selector "h1", text: "Your major systems"
    assert_selector ".card-body", count: 1
  end

  test "#show displays a brain's specific major system" do
    visit brain_major_system_url(@rich_system)
    assert_selector "h1", text: @rich_system.origin
  end

  test "brains can go editing their system's pegs" do
    visit brain_major_system_url(@rich_system)

    click_on "Edit", match: :first

    assert find("input[value=\"Update Peg\"]")
  end

  test "brain can delete a major system" do
    visit brain_major_system_url(@rich_system)
    accept_confirm do
      click_button "Forget it! 🚮"
    end
    assert_current_path brain_major_systems_path
    assert find("p", text: "Successfully forgotten")
  end
end
