require 'test_helper'

class GarbagesControllerTest < ActionController::TestCase
  setup do
    @garbage = garbages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:garbages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create garbage" do
    assert_difference('Garbage.count') do
      post :create, garbage: { image: @garbage.image, name: @garbage.name }
    end

    assert_redirected_to garbage_path(assigns(:garbage))
  end

  test "should show garbage" do
    get :show, id: @garbage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @garbage
    assert_response :success
  end

  test "should update garbage" do
    patch :update, id: @garbage, garbage: { image: @garbage.image, name: @garbage.name }
    assert_redirected_to garbage_path(assigns(:garbage))
  end

  test "should destroy garbage" do
    assert_difference('Garbage.count', -1) do
      delete :destroy, id: @garbage
    end

    assert_redirected_to garbages_path
  end
end
