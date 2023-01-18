require "application_system_test_case"

class BrainMajorSystemTest < ApplicationSystemTestCase
  def setup
    login_as brains(:rich)
    @richs_system = brains(:rich).major_systems.first
  end

  test "#index displays a brain's major systems" do
    visit brain_major_systems_url
    assert_selector "h1", text: "Your major systems"
    assert_selector ".card-body", count: 1
  end

  test "#index displays an additional major system after brain converts one" do
    visit public_major_systems_path
    within find("h5", text: @richs_system.origin).sibling(".card-body") do
      click_link "Check it out 👀"
    end

    assert_selector "h1", text: "Major System from #{@richs_system.origin}"

    assert_difference "MnemonicSystem.count" do
      find("a", text: "Memorize 🧠").click
    end

    # Check new system shows same data as original.
    new_system = MnemonicSystem.last
    assert_redirected_to brain_major_system_path(new_system)
    assert find("strong", text: "Origin").sibling("a", text: @richs_system.origin)
    assert find("strong", text: "Language").sibling("span", text: "English")
  end

  test "brain has a max amount of systems that it can copy" do
    skip "TODO"
  end

  test "brain can delete its major systems" do
    skip "TODO"
  end

  test "#show displays a brain's specific major system" do
    visit brain_major_system_url(@richs_system)
    assert_selector "h1", text: @richs_system.origin
  end

  test "#show does not display someone else's major system" do
    skip "TODO"
  end
end
