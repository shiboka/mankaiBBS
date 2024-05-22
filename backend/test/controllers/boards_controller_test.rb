require "test_helper"

class BoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    setup_variables
    @board = boards(:one)
  end

  test "should get index" do
    get boards_url, headers: { "Authorization": "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test "should create board" do
    assert_difference("Board.count") do
      post boards_url, headers: { "Authorization": "Bearer #{@token}" },
        params: { board: { name: "test2", path: "test2" } }, as: :json
    end

    assert_response :created
  end

  test "should show board" do
    get board_url(@board.path), headers: { "Authorization": "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test "should update board" do
    patch board_url(@board.path), headers: { "Authorization": "Bearer #{@token}" },
      params: { board: { name: "test2", path: "test2" } }, as: :json
    assert_response :success
  end

  test "should destroy board" do
    assert_difference("Board.count", -1) do
      delete board_url(@board.path), headers: { "Authorization": "Bearer #{@token}" }, as: :json
    end

    assert_response :no_content
  end
end
