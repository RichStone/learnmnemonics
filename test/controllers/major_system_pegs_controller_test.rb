require "test_helper"

class MajorSystemPegsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @major_system_peg = major_system_pegs(:major_system_peg_one)
  end

  test "should get index" do
    get major_system_pegs_url
    assert_response :success
  end

  test "should get new" do
    get new_major_system_peg_url
    assert_response :success
  end

  test "should create major_system_peg" do
    assert_difference("MajorSystemPeg.count") do
      post major_system_pegs_url, params: { major_system_peg: { number: @major_system_peg.number, phrase: @major_system_peg.phrase } }
    end

    assert_redirected_to major_system_peg_url(MajorSystemPeg.last)
  end

  test "should show major_system_peg" do
    get major_system_peg_url(@major_system_peg)
    assert_response :success
  end

  test "should get edit" do
    get edit_major_system_peg_url(@major_system_peg)
    assert_response :success
  end

  test "should update major_system_peg" do
    patch major_system_peg_url(@major_system_peg), params: { major_system_peg: { number: @major_system_peg.number, phrase: @major_system_peg.phrase } }
    assert_redirected_to major_system_peg_url(@major_system_peg)
  end

  test "should destroy major_system_peg" do
    assert_difference("MajorSystemPeg.count", -1) do
      delete major_system_peg_url(@major_system_peg)
    end

    assert_redirected_to major_system_pegs_url
  end
end
