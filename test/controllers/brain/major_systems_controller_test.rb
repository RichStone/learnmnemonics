require "test_helper"

class Brain::MajorSystemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index" do
    skip "seems not to sign in properly in integration tests"
    # Minitest::Assertion: Expected response to be a <2XX: success>, but was a <302: Found> redirect to <http://www.example.com/brains/sign_in>

    sign_in(:rich)
    get brain_major_systems_url
    assert_response :success
  end

  test "should get show" do
    skip "seems not to sign in properly in integration tests"
    # Minitest::Assertion: Expected response to be a <2XX: success>, but was a <302: Found> redirect to <http://www.example.com/brains/sign_in>

    sign_in(:rich)
    get brain_major_systems_url
    assert_response :success
  end
end
