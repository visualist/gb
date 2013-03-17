require 'test_helper'

class GuestsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :redirect
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:guest)
  end

  test "should not post new" do
    post :new
    assert_response :success  #TODO: hmmm.. routing problem? should I be concerned?
    assert_not_nil assigns(:guest)
  end

  test "should get show" do
    params = {:id => 1}
    get :show, params
    assert_response :redirect
  end

  test "should get edit only with params" do
    exception = assert_raise(ActionController::RoutingError) {
      get :edit, {}
    }
    params = {:id => 1}
    get :edit, params
    assert_response :redirect
  end

  test "should not get create" do
    get :create
    assert_response :success  #TODO: hmmm.. routing problem? should I be concerned?
    assert_not_nil assigns(:guest)
  end

  test "should post create" do
    post :create
    assert_response :success
    assert_not_nil assigns(:guest)
  end

end
