require 'test_helper'

class AdPlacesControllerTest < ActionController::TestCase
  setup do
    @ad_place = ad_places(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ad_places)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ad_place" do
    assert_difference('AdPlace.count') do
      post :create, ad_place: { code: @ad_place.code, name: @ad_place.name }
    end

    assert_redirected_to ad_place_path(assigns(:ad_place))
  end

  test "should show ad_place" do
    get :show, id: @ad_place
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ad_place
    assert_response :success
  end

  test "should update ad_place" do
    put :update, id: @ad_place, ad_place: { code: @ad_place.code, name: @ad_place.name }
    assert_redirected_to ad_place_path(assigns(:ad_place))
  end

  test "should destroy ad_place" do
    assert_difference('AdPlace.count', -1) do
      delete :destroy, id: @ad_place
    end

    assert_redirected_to ad_places_path
  end
end
