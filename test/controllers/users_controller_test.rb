require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should create user with valid params" do
    assert_difference('User.count', 1) do
      post users_url, params: { user: { name: "TestUser", email: "test@example.com" } }
    end
    assert_redirected_to channel_messages_path(1)
  end

  test "should not create user with invalid params" do
    assert_no_difference('User.count') do
      post users_url, params: { user: { name: "", email: "" } }
    end
    assert_response :unprocessable_entity
  end
end
