require 'test_helper'

class YearlyDetailStreamsControllerTest < ActionController::TestCase
  setup do
    @yearly_detail_stream = yearly_detail_streams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yearly_detail_streams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yearly_detail_stream" do
    assert_difference('YearlyDetailStream.count') do
      post :create, yearly_detail_stream: @yearly_detail_stream.attributes
    end

    assert_redirected_to yearly_detail_stream_path(assigns(:yearly_detail_stream))
  end

  test "should show yearly_detail_stream" do
    get :show, id: @yearly_detail_stream.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yearly_detail_stream.to_param
    assert_response :success
  end

  test "should update yearly_detail_stream" do
    put :update, id: @yearly_detail_stream.to_param, yearly_detail_stream: @yearly_detail_stream.attributes
    assert_redirected_to yearly_detail_stream_path(assigns(:yearly_detail_stream))
  end

  test "should destroy yearly_detail_stream" do
    assert_difference('YearlyDetailStream.count', -1) do
      delete :destroy, id: @yearly_detail_stream.to_param
    end

    assert_redirected_to yearly_detail_streams_path
  end
end
