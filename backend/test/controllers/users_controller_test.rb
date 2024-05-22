require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    setup_variables
  end

  test "should get index" do
    get users_url, headers: { "Authorization": "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, headers: { "Authorization": "Bearer #{@token}" },
        params: { user: { password: "test", username: "test" } }, as: :json
    end

    assert_response :created
  end

  test "should show user" do
    get user_url(@user), headers: { "Authorization": "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), headers: { "Authorization": "Bearer #{@token}" },
      params: { user: { password: "test", username: "test" } }, as: :json
    assert_response :success
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user), headers: { "Authorization": "Bearer #{@token}" }, as: :json
    end

    assert_response :no_content
  end
end