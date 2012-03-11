require 'test_helper'

class StudentStudyMedsControllerTest < ActionController::TestCase
  setup do
    @student_study_med = student_study_meds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_study_meds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_study_med" do
    assert_difference('StudentStudyMed.count') do
      post :create, student_study_med: @student_study_med.attributes
    end

    assert_redirected_to student_study_med_path(assigns(:student_study_med))
  end

  test "should show student_study_med" do
    get :show, id: @student_study_med.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_study_med.to_param
    assert_response :success
  end

  test "should update student_study_med" do
    put :update, id: @student_study_med.to_param, student_study_med: @student_study_med.attributes
    assert_redirected_to student_study_med_path(assigns(:student_study_med))
  end

  test "should destroy student_study_med" do
    assert_difference('StudentStudyMed.count', -1) do
      delete :destroy, id: @student_study_med.to_param
    end

    assert_redirected_to student_study_meds_path
  end
end
