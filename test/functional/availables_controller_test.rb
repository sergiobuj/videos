require File.dirname(__FILE__) + '/../test_helper'

class AvailablesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:availables)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_available
    assert_difference('Available.count') do
      post :create, :available => { }
    end

    assert_redirected_to available_path(assigns(:available))
  end

  def test_should_show_available
    get :show, :id => availables(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => availables(:one).id
    assert_response :success
  end

  def test_should_update_available
    put :update, :id => availables(:one).id, :available => { }
    assert_redirected_to available_path(assigns(:available))
  end

  def test_should_destroy_available
    assert_difference('Available.count', -1) do
      delete :destroy, :id => availables(:one).id
    end

    assert_redirected_to availables_path
  end
end
