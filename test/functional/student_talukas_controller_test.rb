require 'test_helper'

class StudentTalukasControllerTest < ActionController::TestCase
  setup do
    @student_taluka = student_talukas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_talukas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_taluka" do
    assert_difference('StudentTaluka.count') do
      post :create, student_taluka: @student_taluka.attributes
    end

    assert_redirected_to student_taluka_path(assigns(:student_taluka))
  end

  test "should show student_taluka" do
    get :show, id: @student_taluka.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_taluka.to_param
    assert_response :success
  end

  test "should update student_taluka" do
    put :update, id: @student_taluka.to_param, student_taluka: @student_taluka.attributes
    assert_redirected_to student_taluka_path(assigns(:student_taluka))
  end

  test "should destroy student_taluka" do
    assert_difference('StudentTaluka.count', -1) do
      delete :destroy, id: @student_taluka.to_param
    end

    assert_redirected_to student_talukas_path
  end
end
