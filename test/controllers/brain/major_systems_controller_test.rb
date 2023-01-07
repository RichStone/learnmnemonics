require "test_helper"

class Brain::MajorSystemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get brain_major_systems_index_url
    assert_response :success
  end

  test "should get show" do
    get brain_major_systems_show_url
    assert_response :success
  end
end
