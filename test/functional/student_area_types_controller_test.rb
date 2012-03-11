require 'test_helper'

class StudentAreaTypesControllerTest < ActionController::TestCase
  setup do
    @student_area_type = student_area_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_area_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_area_type" do
    assert_difference('StudentAreaType.count') do
      post :create, student_area_type: @student_area_type.attributes
    end

    assert_redirected_to student_area_type_path(assigns(:student_area_type))
  end

  test "should show student_area_type" do
    get :show, id: @student_area_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_area_type.to_param
    assert_response :success
  end

  test "should update student_area_type" do
    put :update, id: @student_area_type.to_param, student_area_type: @student_area_type.attributes
    assert_redirected_to student_area_type_path(assigns(:student_area_type))
  end

  test "should destroy student_area_type" do
    assert_difference('StudentAreaType.count', -1) do
      delete :destroy, id: @student_area_type.to_param
    end

    assert_redirected_to student_area_types_path
  end
end
