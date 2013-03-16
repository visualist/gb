require 'test_helper'

class GuestBookControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "byguest should narrow results" do
    send_params = {"username" => "lev"}
    get :byguest, send_params
    assert_response :success
    p assigns(:posts)
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
