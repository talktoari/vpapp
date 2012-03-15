require 'test_helper'

class StudentDistrictsControllerTest < ActionController::TestCase
  setup do
    @student_district = student_districts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_districts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_district" do
    assert_difference('StudentDistrict.count') do
      post :create, student_district: @student_district.attributes
    end

    assert_redirected_to student_district_path(assigns(:student_district))
  end

  test "should show student_district" do
    get :show, id: @student_district.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_district.to_param
    assert_response :success
  end

  test "should update student_district" do
    put :update, id: @student_district.to_param, student_district: @student_district.attributes
    assert_redirected_to student_district_path(assigns(:student_district))
  end

  test "should destroy student_district" do
    assert_difference('StudentDistrict.count', -1) do
      delete :destroy, id: @student_district.to_param
    end

    assert_redirected_to student_districts_path
  end
end
