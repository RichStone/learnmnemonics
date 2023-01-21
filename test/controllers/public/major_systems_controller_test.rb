require "test_helper"

class Public::MajorSystemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @major_system = major_systems(:wikipedia_en_original)
  end

  test "should get index" do
    get public_major_systems_url
    assert_response :success
  end

  test "should get show" do
    get public_major_system_url(@major_system)
    assert_response :success
  end

  test "#new converts major system and redirects to the newly created one" do
    skip "TODO"
  end
end
