require 'test_helper'

class CreateUsersTest < ActionDispatch::IntegrationTest

  test "get signup form and create new user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {
        username: "test_username",
        email: "test@user.com",
        password: "password"
      } }
      follow_redirect!
    end
    assert_match "test_username", response.body
  end

end
