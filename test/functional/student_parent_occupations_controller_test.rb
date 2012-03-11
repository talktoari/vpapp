require 'test_helper'

class StudentParentOccupationsControllerTest < ActionController::TestCase
  setup do
    @student_parent_occupation = student_parent_occupations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_parent_occupations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_parent_occupation" do
    assert_difference('StudentParentOccupation.count') do
      post :create, student_parent_occupation: @student_parent_occupation.attributes
    end

    assert_redirected_to student_parent_occupation_path(assigns(:student_parent_occupation))
  end

  test "should show student_parent_occupation" do
    get :show, id: @student_parent_occupation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_parent_occupation.to_param
    assert_response :success
  end

  test "should update student_parent_occupation" do
    put :update, id: @student_parent_occupation.to_param, student_parent_occupation: @student_parent_occupation.attributes
    assert_redirected_to student_parent_occupation_path(assigns(:student_parent_occupation))
  end

  test "should destroy student_parent_occupation" do
    assert_difference('StudentParentOccupation.count', -1) do
      delete :destroy, id: @student_parent_occupation.to_param
    end

    assert_redirected_to student_parent_occupations_path
  end
end
