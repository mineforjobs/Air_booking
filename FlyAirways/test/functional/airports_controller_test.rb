require 'test_helper'

class AirportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:airports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create airport" do
    assert_difference('Airport.count') do
      post :create, :airport => { }
    end

    assert_redirected_to airport_path(assigns(:airport))
  end

  test "should show airport" do
    get :show, :id => airports(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => airports(:one).to_param
    assert_response :success
  end

  test "should update airport" do
    put :update, :id => airports(:one).to_param, :airport => { }
    assert_redirected_to airport_path(assigns(:airport))
  end

  test "should destroy airport" do
    assert_difference('Airport.count', -1) do
      delete :destroy, :id => airports(:one).to_param
    end

    assert_redirected_to airports_path
  end
end
