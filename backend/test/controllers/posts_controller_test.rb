require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    setup_variables
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url, headers: { "Authorization": "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post posts_url, headers: { "Authorization": "Bearer #{@token}" },
        params: { post: { message: "test", name: "test", thred_id: @thred.id } }, as: :json
    end

    assert_response :created
  end

  test "should show post" do
    get post_url(@post), headers: { "Authorization": "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), headers: { "Authorization": "Bearer #{@token}" },
      params: { post: { message: "test", name: "test", thred_id: @thred.id } }, as: :json
    assert_response :success
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post), headers: { "Authorization": "Bearer #{@token}" }, as: :json
    end

    assert_response :no_content
  end
end
