require 'test_helper'

class GuestBookControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get byguest" do
    get :byguest
    assert_response :success
  end

  test "should get submit" do
    get :submit
    assert_response :success
  end

end
