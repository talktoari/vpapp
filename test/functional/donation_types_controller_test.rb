require 'test_helper'

class DonationTypesControllerTest < ActionController::TestCase
  setup do
    @donation_type = donation_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:donation_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create donation_type" do
    assert_difference('DonationType.count') do
      post :create, donation_type: @donation_type.attributes
    end

    assert_redirected_to donation_type_path(assigns(:donation_type))
  end

  test "should show donation_type" do
    get :show, id: @donation_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @donation_type.to_param
    assert_response :success
  end

  test "should update donation_type" do
    put :update, id: @donation_type.to_param, donation_type: @donation_type.attributes
    assert_redirected_to donation_type_path(assigns(:donation_type))
  end

  test "should destroy donation_type" do
    assert_difference('DonationType.count', -1) do
      delete :destroy, id: @donation_type.to_param
    end

    assert_redirected_to donation_types_path
  end
end
