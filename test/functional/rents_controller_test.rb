require File.dirname(__FILE__) + '/../test_helper'

class RentsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:rents)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_rent
    assert_difference('Rent.count') do
      post :create, :rent => { }
    end

    assert_redirected_to rent_path(assigns(:rent))
  end

  def test_should_show_rent
    get :show, :id => rents(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => rents(:one).id
    assert_response :success
  end

  def test_should_update_rent
    put :update, :id => rents(:one).id, :rent => { }
    assert_redirected_to rent_path(assigns(:rent))
  end

  def test_should_destroy_rent
    assert_difference('Rent.count', -1) do
      delete :destroy, :id => rents(:one).id
    end

    assert_redirected_to rents_path
  end
end
