require 'test_helper'

class DonorsControllerTest < ActionController::TestCase
  test "should get upload_validate_donor" do
    get :upload_validate_donor
    assert_response :success
  end

end
