require File.dirname(__FILE__) + '/../test_helper'

class CastsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:casts)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_cast
    assert_difference('Cast.count') do
      post :create, :cast => { }
    end

    assert_redirected_to cast_path(assigns(:cast))
  end

  def test_should_show_cast
    get :show, :id => casts(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => casts(:one).id
    assert_response :success
  end

  def test_should_update_cast
    put :update, :id => casts(:one).id, :cast => { }
    assert_redirected_to cast_path(assigns(:cast))
  end

  def test_should_destroy_cast
    assert_difference('Cast.count', -1) do
      delete :destroy, :id => casts(:one).id
    end

    assert_redirected_to casts_path
  end
end
