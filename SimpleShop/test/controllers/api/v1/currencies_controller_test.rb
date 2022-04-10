require "test_helper"

class Api::V1::CurrenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_currency = api_v1_currencies(:one)
  end

  test "should get index" do
    get api_v1_currencies_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_currency_url
    assert_response :success
  end

  test "should create api_v1_currency" do
    assert_difference('Api::V1::Currency.count') do
      post api_v1_currencies_url, params: { api_v1_currency: { currency_code: @api_v1_currency.currency_code, title: @api_v1_currency.title } }
    end

    assert_redirected_to api_v1_currency_url(Api::V1::Currency.last)
  end

  test "should show api_v1_currency" do
    get api_v1_currency_url(@api_v1_currency)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_currency_url(@api_v1_currency)
    assert_response :success
  end

  test "should update api_v1_currency" do
    patch api_v1_currency_url(@api_v1_currency), params: { api_v1_currency: { currency_code: @api_v1_currency.currency_code, title: @api_v1_currency.title } }
    assert_redirected_to api_v1_currency_url(@api_v1_currency)
  end

  test "should destroy api_v1_currency" do
    assert_difference('Api::V1::Currency.count', -1) do
      delete api_v1_currency_url(@api_v1_currency)
    end

    assert_redirected_to api_v1_currencies_url
  end
end
