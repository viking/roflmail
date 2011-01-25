require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get index for logged-in user" do
    sign_in Factory(:user)
    get :index
    assert_response :success
  end

  test "should require logged-in user for index" do
    get :index
    assert_redirected_to new_user_session_url
  end
end
