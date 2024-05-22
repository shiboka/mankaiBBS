require "test_helper"

class ThredsControllerTest < ActionDispatch::IntegrationTest
  setup do
    setup_variables
  end

  test "should get index" do
    get board_threds_url(@board.path), headers: { "Authorization": "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test "should create thred" do
    assert_difference("Thred.count") do
      post board_threds_url, headers: { "Authorization": "Bearer #{@token}" },
        params: { thred: { name: "test", message: "test", subject: "test", board_id: @board.id } }, as: :json
    end

    assert_response :created
  end

  test "should show thred" do
    get thred_url(@thred), headers: { "Authorization": "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test "should update thred" do
    patch thred_url(@thred), headers: { "Authorization": "Bearer #{@token}" },
      params: { thred: { subject: "test", board_id: @board.id } }, as: :json
    assert_response :success
  end

  test "should destroy thred" do
    assert_difference("Thred.count", -1) do
      delete thred_url(@thred), headers: { "Authorization": "Bearer #{@token}" }, as: :json
    end

    assert_response :no_content
  end
end
