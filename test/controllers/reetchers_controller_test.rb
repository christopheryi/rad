require 'test_helper'

class ReetchersControllerTest < ActionController::TestCase
  setup do
    @reetcher = reetchers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reetchers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reetcher" do
    assert_difference('Reetcher.count') do
      post :create, reetcher: { email: @reetcher.email, password: @reetcher.password, password_confirmation: @reetcher.password_confirmation, username: @reetcher.username }
    end

    assert_redirected_to reetcher_path(assigns(:reetcher))
  end

  test "should show reetcher" do
    get :show, id: @reetcher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reetcher
    assert_response :success
  end

  test "should update reetcher" do
    patch :update, id: @reetcher, reetcher: { email: @reetcher.email, password: @reetcher.password, password_confirmation: @reetcher.password_confirmation, username: @reetcher.username }
    assert_redirected_to reetcher_path(assigns(:reetcher))
  end

  test "should destroy reetcher" do
    assert_difference('Reetcher.count', -1) do
      delete :destroy, id: @reetcher
    end

    assert_redirected_to reetchers_path
  end
end
