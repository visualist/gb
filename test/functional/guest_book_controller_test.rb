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
    posts = assigns(:posts)
    assert_equal 1, posts.size, "lev should have 1"

    send_params = {"username" => "wade"}
    get :byguest, send_params
    assert_response :success
    posts = assigns(:posts)
    assert_equal 3, posts.size, "wade should have 3"
  end

  test "should get 302 without username" do
    get :byguest
    assert_response 302
  end

  test "should get submit" do
    get :submit
    assert_response :success
  end

end
