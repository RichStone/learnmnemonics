require "application_system_test_case"

class MajorSystemPegsTest < ApplicationSystemTestCase
  setup do
    @major_system_peg = major_system_pegs(:one)
  end

  test "visiting the index" do
    visit major_system_pegs_url
    assert_selector "h1", text: "Major system pegs"
    image = page.first(:css, ".peg-image")
    visit image[:src]
    assert_selector :xpath, "//img[contains(@src, 'hat.png')]"
  end

  test "should create major system peg" do
    visit major_system_pegs_url
    click_on "New major system peg"

    fill_in "Number", with: @major_system_peg.number
    fill_in "Phrase", with: @major_system_peg.phrase
    click_on "Create Major system peg"

    assert_text "Major system peg was successfully created"
    click_on "Back"
  end

  test "should update Major system peg" do
    visit major_system_peg_url(@major_system_peg)
    click_on "Edit this major_system_peg", match: :first

    fill_in "Number", with: @major_system_peg.number
    fill_in "Phrase", with: @major_system_peg.phrase
    click_on "Update Major system peg"

    assert_text "Major system peg was successfully updated"
    click_on "Back"
  end

  test "should destroy Major system peg" do
    visit major_system_peg_url(@major_system_peg)
    click_on "Destroy this major_system_peg", match: :first

    assert_text "Major system peg was successfully destroyed"
  end
end
