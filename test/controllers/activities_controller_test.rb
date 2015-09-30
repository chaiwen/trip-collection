require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  setup do
    @activity = activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity" do
    assert_difference('Activity.count') do
      post :create, activity: { address: @activity.address, city: @activity.city, cost: @activity.cost, country: @activity.country, date: @activity.date, days: @activity.days, description: @activity.description, hrs: @activity.hrs, lat: @activity.lat, lng: @activity.lng, name: @activity.name, rating: @activity.rating }
    end

    assert_redirected_to activity_path(assigns(:activity))
  end

  test "should show activity" do
    get :show, id: @activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity
    assert_response :success
  end

  test "should update activity" do
    patch :update, id: @activity, activity: { address: @activity.address, city: @activity.city, cost: @activity.cost, country: @activity.country, date: @activity.date, days: @activity.days, description: @activity.description, hrs: @activity.hrs, lat: @activity.lat, lng: @activity.lng, name: @activity.name, rating: @activity.rating }
    assert_redirected_to activity_path(assigns(:activity))
  end

  test "should destroy activity" do
    assert_difference('Activity.count', -1) do
      delete :destroy, id: @activity
    end

    assert_redirected_to activities_path
  end
end
