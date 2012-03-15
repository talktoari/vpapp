require 'test_helper'

class YearlyDetailCoursesControllerTest < ActionController::TestCase
  setup do
    @yearly_detail_course = yearly_detail_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yearly_detail_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yearly_detail_course" do
    assert_difference('YearlyDetailCourse.count') do
      post :create, yearly_detail_course: @yearly_detail_course.attributes
    end

    assert_redirected_to yearly_detail_course_path(assigns(:yearly_detail_course))
  end

  test "should show yearly_detail_course" do
    get :show, id: @yearly_detail_course.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yearly_detail_course.to_param
    assert_response :success
  end

  test "should update yearly_detail_course" do
    put :update, id: @yearly_detail_course.to_param, yearly_detail_course: @yearly_detail_course.attributes
    assert_redirected_to yearly_detail_course_path(assigns(:yearly_detail_course))
  end

  test "should destroy yearly_detail_course" do
    assert_difference('YearlyDetailCourse.count', -1) do
      delete :destroy, id: @yearly_detail_course.to_param
    end

    assert_redirected_to yearly_detail_courses_path
  end
end
