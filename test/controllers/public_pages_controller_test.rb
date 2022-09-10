require "test_helper"

class PublicPagesControllerTest < ActionDispatch::IntegrationTest
  test "#major_systems is reachable" do
    get public_major_systems_path
    assert_response :success
  end
end
