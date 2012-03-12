require 'test_helper'

class DonationPurposesControllerTest < ActionController::TestCase
  setup do
    @donation_purpose = donation_purposes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:donation_purposes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create donation_purpose" do
    assert_difference('DonationPurpose.count') do
      post :create, donation_purpose: @donation_purpose.attributes
    end

    assert_redirected_to donation_purpose_path(assigns(:donation_purpose))
  end

  test "should show donation_purpose" do
    get :show, id: @donation_purpose.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @donation_purpose.to_param
    assert_response :success
  end

  test "should update donation_purpose" do
    put :update, id: @donation_purpose.to_param, donation_purpose: @donation_purpose.attributes
    assert_redirected_to donation_purpose_path(assigns(:donation_purpose))
  end

  test "should destroy donation_purpose" do
    assert_difference('DonationPurpose.count', -1) do
      delete :destroy, id: @donation_purpose.to_param
    end

    assert_redirected_to donation_purposes_path
  end
end
