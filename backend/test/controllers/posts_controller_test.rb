require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    setup_auth
    @board = boards(:one)
    @thred = threds(:one)
    @post = posts(:one)
  end

  test "should get index" do
    get board_thred_posts_url(@board.path, @thred.post_num),
      headers: { "Authorization": "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post board_thred_posts_url(@board.path, @thred.post_num),
        headers: { "Authorization": "Bearer #{@token}" },
        params: { post: { message: "test", name: "test" } }, as: :json
    end

    assert_response :created
  end

  test "should show post" do
    get board_thred_post_url(@board.path, @thred.post_num, @post.post_num),
      headers: { "Authorization": "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test "should update post" do
    patch board_thred_post_url(@board.path, @thred.post_num, @post.post_num),
      headers: { "Authorization": "Bearer #{@token}" },
      params: { post: { message: "test", name: "test" } }, as: :json
    assert_response :success
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete board_thred_post_url(@board.path, @thred.post_num, @post.post_num),
        headers: { "Authorization": "Bearer #{@token}" }, as: :json
    end

    assert_response :no_content
  end
end
