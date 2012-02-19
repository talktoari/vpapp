require 'test_helper'

class StudentDonationLinksControllerTest < ActionController::TestCase
  setup do
    @student_donation_link = student_donation_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_donation_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_donation_link" do
    assert_difference('StudentDonationLink.count') do
      post :create, student_donation_link: @student_donation_link.attributes
    end

    assert_redirected_to student_donation_link_path(assigns(:student_donation_link))
  end

  test "should show student_donation_link" do
    get :show, id: @student_donation_link.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_donation_link.to_param
    assert_response :success
  end

  test "should update student_donation_link" do
    put :update, id: @student_donation_link.to_param, student_donation_link: @student_donation_link.attributes
    assert_redirected_to student_donation_link_path(assigns(:student_donation_link))
  end

  test "should destroy student_donation_link" do
    assert_difference('StudentDonationLink.count', -1) do
      delete :destroy, id: @student_donation_link.to_param
    end

    assert_redirected_to student_donation_links_path
  end
end
