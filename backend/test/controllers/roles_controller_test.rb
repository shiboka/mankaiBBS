require "test_helper"

class RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    setup_auth
    @role = roles(:admin)
  end

  test "should get index" do
    get roles_url, headers: { "Authorization": "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test "should create role" do
    assert_difference("Role.count") do
      post roles_url, headers: { "Authorization": "Bearer #{@token}" },
        params: { role: { name: "test" } }, as: :json
    end

    assert_response :created
  end

  test "should show role" do
    get role_url(@role), headers: { "Authorization": "Bearer #{@token}" }, as: :json
    assert_response :success
  end

  test "should update role" do
    patch role_url(@role), headers: { "Authorization": "Bearer #{@token}" },
      params: { role: { name: "test" } }, as: :json
    assert_response :success
  end

  test "should destroy role" do
    assert_difference("Role.count", -1) do
      delete role_url(@role), headers: { "Authorization": "Bearer #{@token}" }, as: :json
    end

    assert_response :no_content
  end
end
