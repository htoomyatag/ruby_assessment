require "test_helper"

class Api::V1::StoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_store = api_v1_stores(:one)
  end

  test "should get index" do
    get api_v1_stores_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_store_url
    assert_response :success
  end

  test "should create api_v1_store" do
    assert_difference('Api::V1::Store.count') do
      post api_v1_stores_url, params: { api_v1_store: { region_id: @api_v1_store.region_id, title: @api_v1_store.title } }
    end

    assert_redirected_to api_v1_store_url(Api::V1::Store.last)
  end

  test "should show api_v1_store" do
    get api_v1_store_url(@api_v1_store)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_store_url(@api_v1_store)
    assert_response :success
  end

  test "should update api_v1_store" do
    patch api_v1_store_url(@api_v1_store), params: { api_v1_store: { region_id: @api_v1_store.region_id, title: @api_v1_store.title } }
    assert_redirected_to api_v1_store_url(@api_v1_store)
  end

  test "should destroy api_v1_store" do
    assert_difference('Api::V1::Store.count', -1) do
      delete api_v1_store_url(@api_v1_store)
    end

    assert_redirected_to api_v1_stores_url
  end
end
