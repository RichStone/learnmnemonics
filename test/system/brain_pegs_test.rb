require "application_system_test_case"

class BrainPegsTest < ApplicationSystemTestCase
  setup do
    login_as brains(:rich)
    @peg = brains(:rich).major_systems.first.pegs.first
  end

  test "brains update their pegs" do
    visit edit_brain_peg_url(@peg)

    fill_in "Number", with: @peg.number
    fill_in "Phrase", with: @peg.phrase
    # TODO: Update image too.
    click_on "Update Peg"

    assert_text "Your peg was successfully updated"

    # TODO: Assert data update visible for the user.
    click_on "Back"
    assert_text @peg.major_system.origin
  end
end
