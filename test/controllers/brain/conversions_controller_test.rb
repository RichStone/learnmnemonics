require "test_helper"

class Brain::ConversionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "#create redirects to sign in if not authenticated" do
    post brain_conversions_path
    assert_redirected_to new_brain_session_path
  end
end
