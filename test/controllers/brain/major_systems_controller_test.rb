require "test_helper"

class Brain::MajorSystemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in(brains(:rich))
  end

  test "should get index" do
    get brain_major_systems_url
    assert_response :success
  end

  test "should get show" do
    get brain_major_systems_url
    assert_response :success
  end
end
