require "test_helper"

class Api::V1::TaxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_tax = api_v1_taxes(:one)
  end

  test "should get index" do
    get api_v1_taxes_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_tax_url
    assert_response :success
  end

  test "should create api_v1_tax" do
    assert_difference('Api::V1::Tax.count') do
      post api_v1_taxes_url, params: { api_v1_tax: { tax_category: @api_v1_tax.tax_category, tax_rate: @api_v1_tax.tax_rate } }
    end

    assert_redirected_to api_v1_tax_url(Api::V1::Tax.last)
  end

  test "should show api_v1_tax" do
    get api_v1_tax_url(@api_v1_tax)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_tax_url(@api_v1_tax)
    assert_response :success
  end

  test "should update api_v1_tax" do
    patch api_v1_tax_url(@api_v1_tax), params: { api_v1_tax: { tax_category: @api_v1_tax.tax_category, tax_rate: @api_v1_tax.tax_rate } }
    assert_redirected_to api_v1_tax_url(@api_v1_tax)
  end

  test "should destroy api_v1_tax" do
    assert_difference('Api::V1::Tax.count', -1) do
      delete api_v1_tax_url(@api_v1_tax)
    end

    assert_redirected_to api_v1_taxes_url
  end
end
