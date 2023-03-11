require "test_helper"

class MajorSystemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @major_system = major_systems(:richs_wikipedia_en)
  end

  test "should get index" do
    get admin_major_systems_url, headers: {"HTTP_AUTHORIZATION" => basic_auth_header_value}
    assert_response :success
  end

  test "should get new" do
    get new_admin_major_system_url, headers: {"HTTP_AUTHORIZATION" => basic_auth_header_value}
    assert_response :success
  end

  test "should create major_system" do
    assert_difference("MajorSystem.count") do
      post admin_major_systems_url,
        params: {
          major_system: {
            brain_id: @major_system.brain_id,
            language_iso: @major_system.language_iso,
            origin: @major_system.origin,
            origin_url: @major_system.origin_url
          }
        }, headers: {"HTTP_AUTHORIZATION" => basic_auth_header_value}
    end

    assert_redirected_to admin_major_system_url(MajorSystem.last)
  end

  test "should show major_system" do
    get admin_major_system_url(@major_system),
      headers: {"HTTP_AUTHORIZATION" => basic_auth_header_value}

    assert_response :success
  end

  test "should get edit" do
    get edit_admin_major_system_url(@major_system),
      headers: {"HTTP_AUTHORIZATION" => basic_auth_header_value}

    assert_response :success
  end

  test "should update major_system" do
    patch admin_major_system_url(@major_system),
      params: {
        major_system: {
          brain_id: @major_system.brain_id,
          language_iso: @major_system.language_iso,
          origin: @major_system.origin
        }
      }, headers: {"HTTP_AUTHORIZATION" => basic_auth_header_value}

    assert_redirected_to admin_major_system_url(@major_system)
  end

  test "should destroy major_system" do
    assert_difference("MajorSystem.count", -1) do
      delete admin_major_system_url(@major_system),
        headers: {"HTTP_AUTHORIZATION" => basic_auth_header_value}
    end

    assert_redirected_to admin_major_systems_url
  end
end
