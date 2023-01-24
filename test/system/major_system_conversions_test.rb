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

  test "displays an additional major system after logged in brain converts one" do
    login_as @rich_brain

    visit public_major_systems_path
    system_card = find("h5", text: @public_system.origin).sibling(".card-body")
    within system_card do
      click_link "Check it out 👀"
    end

    assert_selector "h1", text: "Major System from #{@public_system.origin}"


    find("a", text: "Memorize 🧠").click

    # Check new system shows same data as original.
    assert find("p", text: "Successfully shoved into brain")
    assert find("strong", text: "Origin:").sibling("a", text: @public_system.origin)
    assert find("span", text: "English")
  end

  test "brain sees error when trying to convert a system if limit reached" do
    skip "TODO"
  end
end
