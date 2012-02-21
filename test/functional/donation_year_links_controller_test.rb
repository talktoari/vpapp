require 'test_helper'

class DonationYearLinksControllerTest < ActionController::TestCase
  setup do
    @donation_year_link = donation_year_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:donation_year_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create donation_year_link" do
    assert_difference('DonationYearLink.count') do
      post :create, donation_year_link: @donation_year_link.attributes
    end

    assert_redirected_to donation_year_link_path(assigns(:donation_year_link))
  end

  test "should show donation_year_link" do
    get :show, id: @donation_year_link.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @donation_year_link.to_param
    assert_response :success
  end

  test "should update donation_year_link" do
    put :update, id: @donation_year_link.to_param, donation_year_link: @donation_year_link.attributes
    assert_redirected_to donation_year_link_path(assigns(:donation_year_link))
  end

  test "should destroy donation_year_link" do
    assert_difference('DonationYearLink.count', -1) do
      delete :destroy, id: @donation_year_link.to_param
    end

    assert_redirected_to donation_year_links_path
  end
end
