require 'test_helper'

class DonorTypesControllerTest < ActionController::TestCase
  setup do
    @donor_type = donor_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:donor_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create donor_type" do
    assert_difference('DonorType.count') do
      post :create, donor_type: @donor_type.attributes
    end

    assert_redirected_to donor_type_path(assigns(:donor_type))
  end

  test "should show donor_type" do
    get :show, id: @donor_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @donor_type.to_param
    assert_response :success
  end

  test "should update donor_type" do
    put :update, id: @donor_type.to_param, donor_type: @donor_type.attributes
    assert_redirected_to donor_type_path(assigns(:donor_type))
  end

  test "should destroy donor_type" do
    assert_difference('DonorType.count', -1) do
      delete :destroy, id: @donor_type.to_param
    end

    assert_redirected_to donor_types_path
  end
end
