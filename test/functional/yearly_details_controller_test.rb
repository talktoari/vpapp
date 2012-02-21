require 'test_helper'

class YearlyDetailsControllerTest < ActionController::TestCase
  setup do
    @yearly_detail = yearly_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yearly_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yearly_detail" do
    assert_difference('YearlyDetail.count') do
      post :create, yearly_detail: @yearly_detail.attributes
    end

    assert_redirected_to yearly_detail_path(assigns(:yearly_detail))
  end

  test "should show yearly_detail" do
    get :show, id: @yearly_detail.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yearly_detail.to_param
    assert_response :success
  end

  test "should update yearly_detail" do
    put :update, id: @yearly_detail.to_param, yearly_detail: @yearly_detail.attributes
    assert_redirected_to yearly_detail_path(assigns(:yearly_detail))
  end

  test "should destroy yearly_detail" do
    assert_difference('YearlyDetail.count', -1) do
      delete :destroy, id: @yearly_detail.to_param
    end

    assert_redirected_to yearly_details_path
  end
end
