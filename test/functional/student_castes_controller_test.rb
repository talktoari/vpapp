require 'test_helper'

class StudentCastesControllerTest < ActionController::TestCase
  setup do
    @student_caste = student_castes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_castes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_caste" do
    assert_difference('StudentCaste.count') do
      post :create, student_caste: @student_caste.attributes
    end

    assert_redirected_to student_caste_path(assigns(:student_caste))
  end

  test "should show student_caste" do
    get :show, id: @student_caste.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_caste.to_param
    assert_response :success
  end

  test "should update student_caste" do
    put :update, id: @student_caste.to_param, student_caste: @student_caste.attributes
    assert_redirected_to student_caste_path(assigns(:student_caste))
  end

  test "should destroy student_caste" do
    assert_difference('StudentCaste.count', -1) do
      delete :destroy, id: @student_caste.to_param
    end

    assert_redirected_to student_castes_path
  end
end
