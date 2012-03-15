require 'test_helper'

class YearlyDetailYearsControllerTest < ActionController::TestCase
  setup do
    @yearly_detail_year = yearly_detail_years(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yearly_detail_years)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yearly_detail_year" do
    assert_difference('YearlyDetailYear.count') do
      post :create, yearly_detail_year: @yearly_detail_year.attributes
    end

    assert_redirected_to yearly_detail_year_path(assigns(:yearly_detail_year))
  end

  test "should show yearly_detail_year" do
    get :show, id: @yearly_detail_year.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yearly_detail_year.to_param
    assert_response :success
  end

  test "should update yearly_detail_year" do
    put :update, id: @yearly_detail_year.to_param, yearly_detail_year: @yearly_detail_year.attributes
    assert_redirected_to yearly_detail_year_path(assigns(:yearly_detail_year))
  end

  test "should destroy yearly_detail_year" do
    assert_difference('YearlyDetailYear.count', -1) do
      delete :destroy, id: @yearly_detail_year.to_param
    end

    assert_redirected_to yearly_detail_years_path
  end
end
