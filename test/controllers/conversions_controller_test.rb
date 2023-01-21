require "test_helper"

class ConversionsControllerTest < ActionDispatch::IntegrationTest
  # Most of the functionality is tested in MajorSystemConversion system tests.
  test "#new" do
    get new_conversion_path
    # When not logged in, anonymous brain is redirected to sign in.
    assert_redirected_to new_brain_session_path
  end

  test "#create" do
    post conversions_path
    # When not logged in, anonymous brain is redirected to sign in.
    assert_redirected_to new_brain_session_path
  end

  test "#create requires a resource ID to be present" do
    assert_raises ActionController::ParameterMissing do
      post conversions_path, headers: {"HTTP_AUTHORIZATION" => basic_auth_header_value}
    end
  end
end
