require 'test_helper'

class SettoriControllerTest < ActionController::TestCase
  setup do
    @settore = settori(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:settori)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create settore" do
    assert_difference('Settore.count') do
      post :create, settore: @settore.attributes
    end

    assert_redirected_to settore_path(assigns(:settore))
  end

  test "should show settore" do
    get :show, id: @settore.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @settore.to_param
    assert_response :success
  end

  test "should update settore" do
    put :update, id: @settore.to_param, settore: @settore.attributes
    assert_redirected_to settore_path(assigns(:settore))
  end

  test "should destroy settore" do
    assert_difference('Settore.count', -1) do
      delete :destroy, id: @settore.to_param
    end

    assert_redirected_to settori_path
  end
end
