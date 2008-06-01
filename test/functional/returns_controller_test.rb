require File.dirname(__FILE__) + '/../test_helper'

class ReturnsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:returns)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_return
    assert_difference('Return.count') do
      post :create, :return => { }
    end

    assert_redirected_to return_path(assigns(:return))
  end

  def test_should_show_return
    get :show, :id => returns(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => returns(:one).id
    assert_response :success
  end

  def test_should_update_return
    put :update, :id => returns(:one).id, :return => { }
    assert_redirected_to return_path(assigns(:return))
  end

  def test_should_destroy_return
    assert_difference('Return.count', -1) do
      delete :destroy, :id => returns(:one).id
    end

    assert_redirected_to returns_path
  end
end
