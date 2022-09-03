require "application_system_test_case"

class PegsTest < ApplicationSystemTestCase
  setup do
    @peg = pegs(:one)
  end

  test "visiting the index" do
    visit pegs_url
    assert_selector "h1"
    assert_selector(:xpath, "//div[@id='quick-links']/a", count: Peg.count)
  end

  test "#index has a peg image with a valid link" do
    visit pegs_url
    image = page.first(:css, ".peg-image")
    assert_not_empty image[:src]
  end

  test "should create peg" do
    visit pegs_url
    click_on "New Peg"

    fill_in "Number", with: @peg.number
    fill_in "Phrase", with: @peg.phrase
    click_on "Create Peg"

    assert_text "Peg was successfully created"
    click_on "Back"
  end

  test "should update peg" do
    visit peg_url(@peg)
    click_on "Edit this peg", match: :first

    fill_in "Number", with: @peg.number
    fill_in "Phrase", with: @peg.phrase
    click_on "Update Peg"

    assert_text "Peg was successfully updated"
    click_on "Back"
  end

  test "should destroy peg" do
    visit peg_url(@peg)
    click_on "Destroy this peg", match: :first

    assert_text "Peg was successfully destroyed"
  end
end
