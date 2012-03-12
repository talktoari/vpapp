require 'test_helper'

class DonationStatusesControllerTest < ActionController::TestCase
  setup do
    @donation_status = donation_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:donation_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create donation_status" do
    assert_difference('DonationStatus.count') do
      post :create, donation_status: @donation_status.attributes
    end

    assert_redirected_to donation_status_path(assigns(:donation_status))
  end

  test "should show donation_status" do
    get :show, id: @donation_status.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @donation_status.to_param
    assert_response :success
  end

  test "should update donation_status" do
    put :update, id: @donation_status.to_param, donation_status: @donation_status.attributes
    assert_redirected_to donation_status_path(assigns(:donation_status))
  end

  test "should destroy donation_status" do
    assert_difference('DonationStatus.count', -1) do
      delete :destroy, id: @donation_status.to_param
    end

    assert_redirected_to donation_statuses_path
  end
end
