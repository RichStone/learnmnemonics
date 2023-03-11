require "application_system_test_case"

class SuperAdminMajorSystemsTest < ApplicationSystemTestCase
  setup do
    @major_system = major_systems(:richs_wikipedia_en)
  end

  test "visiting the index" do
    visit_basic_auth admin_major_systems_url
    assert_selector "h1", text: "Major systems"
  end

  test "should create major system" do
    visit_basic_auth admin_major_systems_url
    click_on "New major system"

    fill_in "Brain", with: @major_system.brain_id
    fill_in "Language iso", with: @major_system.language_iso
    fill_in "Origin", with: @major_system.origin
    fill_in "Origin URL", with: @major_system.origin_url
    click_on "Create Major system"

    assert_text "Major system was successfully created"
    click_on "Back"
  end

  test "should update Major system" do
    visit_basic_auth admin_major_system_url(@major_system)
    click_on "Edit this major system", match: :first

    fill_in "Brain", with: @major_system.brain_id
    fill_in "Language iso", with: @major_system.language_iso
    fill_in "Origin", with: @major_system.origin
    click_on "Update Major system"

    assert_text "Major system was successfully updated"
    click_on "Back"
  end

  test "should destroy Major system" do
    visit_basic_auth admin_major_system_url(@major_system)
    click_on "Destroy this major system", match: :first

    assert_text "Major system was successfully destroyed"
  end
end
