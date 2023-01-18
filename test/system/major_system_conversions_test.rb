require "application_system_test_case"

class MajorSystemConversionsTest < ApplicationSystemTestCase
  def setup
    @rich_brain = brains(:rich)
    @public_system = major_systems(:buzan_en)
  end

  test "conversion redirects to sign in for anonymous brains" do
    visit public_major_systems_path
    find_all("a", text: "Check it out 👀").first.click
    find("a", text: "Memorize 🧠").click
    assert_current_path new_brain_session_path
  end

  test "displays an additional major system after brain converts one" do
    visit public_major_systems_path
    within find("h5", text: @public_system.origin).sibling(".card-body") do
      click_link "Check it out 👀"
    end

    assert_selector "h1", text: "Major System from #{@public_system.origin}"

    assert_difference "MnemonicSystem.count" do
      find("a", text: "Memorize 🧠").click
    end

    # Check new system shows same data as original.
    new_system = MnemonicSystem.last
    assert_current_path brain_major_system_path(new_system)
    assert find("strong", text: "Origin").sibling("a", text: @richs_system.origin)
    assert find("strong", text: "Language").sibling("span", text: "English")
  end

  test "brain sees error when trying to convert a system if limit reached" do
    skip "TODO"
  end
end
