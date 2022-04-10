require "test_helper"

class Api::V1::RegionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_region = api_v1_regions(:one)
  end

  test "should get index" do
    get api_v1_regions_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_region_url
    assert_response :success
  end

  test "should create api_v1_region" do
    assert_difference('Api::V1::Region.count') do
      post api_v1_regions_url, params: { api_v1_region: { country_id: @api_v1_region.country_id, currency_id: @api_v1_region.currency_id, tax_id: @api_v1_region.tax_id, title: @api_v1_region.title } }
    end

    assert_redirected_to api_v1_region_url(Api::V1::Region.last)
  end

  test "should show api_v1_region" do
    get api_v1_region_url(@api_v1_region)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_region_url(@api_v1_region)
    assert_response :success
  end

  test "should update api_v1_region" do
    patch api_v1_region_url(@api_v1_region), params: { api_v1_region: { country_id: @api_v1_region.country_id, currency_id: @api_v1_region.currency_id, tax_id: @api_v1_region.tax_id, title: @api_v1_region.title } }
    assert_redirected_to api_v1_region_url(@api_v1_region)
  end

  test "should destroy api_v1_region" do
    assert_difference('Api::V1::Region.count', -1) do
      delete api_v1_region_url(@api_v1_region)
    end

    assert_redirected_to api_v1_regions_url
  end
end
