require "test_helper"

class PasswordResetControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get password_reset_new_url
    assert_response :success
  end
end
