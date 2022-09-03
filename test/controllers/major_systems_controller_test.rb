require "test_helper"

class MajorSystemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @major_system = major_systems(:richs_wikipedia_en)
  end

  test "should get index" do
    get major_systems_url
    assert_response :success
  end

  test "should get new" do
    get new_major_system_url
    assert_response :success
  end

  test "should create major_system" do
    assert_difference("MajorSystem.count") do
      post major_systems_url, params: { major_system: { brain_id: @major_system.brain_id, language_iso: @major_system.language_iso, origin: @major_system.origin } }
    end

    assert_redirected_to major_system_url(MajorSystem.last)
  end

  test "should show major_system" do
    get major_system_url(@major_system)
    assert_response :success
  end

  test "should get edit" do
    get edit_major_system_url(@major_system)
    assert_response :success
  end

  test "should update major_system" do
    patch major_system_url(@major_system), params: { major_system: { brain_id: @major_system.brain_id, language_iso: @major_system.language_iso, origin: @major_system.origin } }
    assert_redirected_to major_system_url(@major_system)
  end

  test "should destroy major_system" do
    assert_difference("MajorSystem.count", -1) do
      delete major_system_url(@major_system)
    end

    assert_redirected_to major_systems_url
  end
end
