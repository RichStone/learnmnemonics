require "test_helper"

class PegsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @peg = pegs(:one)
  end

  test "should get index" do
    get admin_pegs_url, headers: {"HTTP_AUTHORIZATION" => basic_auth_header_value}
    assert_response :success
  end

  test "should get new" do
    get new_admin_peg_url, headers: {"HTTP_AUTHORIZATION" => basic_auth_header_value}
    assert_response :success
  end

  test "should create peg" do
    assert_difference("Peg.count") do
      post admin_pegs_url,
        params: {
          peg: {
            number: @peg.number,
            phrase: @peg.phrase,
            mnemonic_system_id: @peg.major_system.id
          }
        },
        headers: {"HTTP_AUTHORIZATION" => basic_auth_header_value}
    end

    assert_redirected_to admin_peg_url(Peg.last)
  end

  test "should show peg" do
    get admin_peg_url(@peg), headers: {"HTTP_AUTHORIZATION" => basic_auth_header_value}
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_peg_url(@peg), headers: {"HTTP_AUTHORIZATION" => basic_auth_header_value}
    assert_response :success
  end

  test "should update peg" do
    patch admin_peg_url(@peg), params: {
      peg: { number: @peg.number, phrase: @peg.phrase }
    }, headers: {"HTTP_AUTHORIZATION" => basic_auth_header_value}

    assert_redirected_to admin_peg_url(@peg)
  end

  test "should destroy peg" do
    assert_difference("Peg.count", -1) do
      delete admin_peg_url(@peg), headers: {"HTTP_AUTHORIZATION" => basic_auth_header_value}
    end

    assert_redirected_to admin_pegs_url
  end
end
