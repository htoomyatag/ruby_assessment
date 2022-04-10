require "test_helper"

class Api::V1::CountriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_country = api_v1_countries(:one)
  end

  test "should get index" do
    get api_v1_countries_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_country_url
    assert_response :success
  end

  test "should create api_v1_country" do
    assert_difference('Api::V1::Country.count') do
      post api_v1_countries_url, params: { api_v1_country: { country_code: @api_v1_country.country_code, title: @api_v1_country.title } }
    end

    assert_redirected_to api_v1_country_url(Api::V1::Country.last)
  end

  test "should show api_v1_country" do
    get api_v1_country_url(@api_v1_country)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_country_url(@api_v1_country)
    assert_response :success
  end

  test "should update api_v1_country" do
    patch api_v1_country_url(@api_v1_country), params: { api_v1_country: { country_code: @api_v1_country.country_code, title: @api_v1_country.title } }
    assert_redirected_to api_v1_country_url(@api_v1_country)
  end

  test "should destroy api_v1_country" do
    assert_difference('Api::V1::Country.count', -1) do
      delete api_v1_country_url(@api_v1_country)
    end

    assert_redirected_to api_v1_countries_url
  end
end
