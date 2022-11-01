require "test_helper"

class Public::HomepagesControllerTest < ActionDispatch::IntegrationTest
  test "#show renders the homepage" do
    get public_homepage_url
    assert_response :success
  end
end
