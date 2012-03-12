require 'test_helper'

class DonorTitlesControllerTest < ActionController::TestCase
  setup do
    @donor_title = donor_titles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:donor_titles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create donor_title" do
    assert_difference('DonorTitle.count') do
      post :create, donor_title: @donor_title.attributes
    end

    assert_redirected_to donor_title_path(assigns(:donor_title))
  end

  test "should show donor_title" do
    get :show, id: @donor_title.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @donor_title.to_param
    assert_response :success
  end

  test "should update donor_title" do
    put :update, id: @donor_title.to_param, donor_title: @donor_title.attributes
    assert_redirected_to donor_title_path(assigns(:donor_title))
  end

  test "should destroy donor_title" do
    assert_difference('DonorTitle.count', -1) do
      delete :destroy, id: @donor_title.to_param
    end

    assert_redirected_to donor_titles_path
  end
end
