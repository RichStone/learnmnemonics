require "application_system_test_case"

class PegsTest < ApplicationSystemTestCase
  setup do
    @peg = pegs(:one)
  end

  test "visiting the index" do
    # FIXME: While we only show German pegs in the admin.
    visit_basic_auth admin_pegs_url(set_id: @peg.major_system.id)
    assert_selector "h1"
    # FIXME: While we only show German pegs in the admin.
    assert_selector(:xpath, "//div[@id='quick-links']//a", count: @peg.major_system.pegs.count)
  end

  test "#index shows a peg image" do
    # FIXME: While we only show German pegs.
    visit_basic_auth admin_pegs_url(set_id: @peg.major_system.id)
    assert_selector(:xpath, "//img[@class='peg-image']")
  end

  test "should create peg" do
    visit_basic_auth admin_pegs_url
    click_on "New Peg"

    fill_in "Number", with: @peg.number
    fill_in "Phrase", with: @peg.phrase
    fill_in "Mnemonic system ID", with: @peg.major_system.id
    click_on "Create Peg"

    assert_text "Peg was successfully created"
    click_on "List"
  end

  test "should update peg" do
    visit_basic_auth admin_peg_url(@peg)
    click_on "Edit", match: :first

    fill_in "Number", with: @peg.number
    fill_in "Phrase", with: @peg.phrase
    click_on "Update Peg"

    assert_text "Peg was successfully updated"
    click_on "List"
  end

  test "should destroy peg" do
    visit_basic_auth admin_peg_url(@peg)
    click_on "Destroy", match: :first

    assert_text "Peg was successfully destroyed"
  end
end
