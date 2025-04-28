require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login form" do
    get login_url
    assert_response :success
  end

  test "should login a user" do
    user = User.create!(name: "TestUser", email: "test@example.com")
    post login_url, params: { name: user.name }
    assert_redirected_to root_path
  end

  test "should logout a user" do
    delete logout_url
    assert_redirected_to login_path
  end
end
