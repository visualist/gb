require 'test_helper'

class GuestsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

# TODO: login/logout to be moved

# test "should get login" do
#   get :login
#   assert_response :success
# end

# test "should get logout" do
#   get :logout
#   assert_response :success
# end

  test "should get show" do
    params = {:id => 1}
    get :show, params
    assert_response :redirect
    # TODO: pick up guest-edit development
  end

  test "should get edit" do
    params = {:id => 1}
    get :edit, params
    assert_response :redirect
    # TODO: pick up guest-edit development
  end

end
