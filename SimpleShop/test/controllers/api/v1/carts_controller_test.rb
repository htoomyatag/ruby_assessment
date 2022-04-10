require "test_helper"

class Api::V1::CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_cart = api_v1_carts(:one)
  end

  test "should get index" do
    get api_v1_carts_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_cart_url
    assert_response :success
  end

  test "should create api_v1_cart" do
    assert_difference('Api::V1::Cart.count') do
      post api_v1_carts_url, params: { api_v1_cart: {  } }
    end

    assert_redirected_to api_v1_cart_url(Api::V1::Cart.last)
  end

  test "should show api_v1_cart" do
    get api_v1_cart_url(@api_v1_cart)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_cart_url(@api_v1_cart)
    assert_response :success
  end

  test "should update api_v1_cart" do
    patch api_v1_cart_url(@api_v1_cart), params: { api_v1_cart: {  } }
    assert_redirected_to api_v1_cart_url(@api_v1_cart)
  end

  test "should destroy api_v1_cart" do
    assert_difference('Api::V1::Cart.count', -1) do
      delete api_v1_cart_url(@api_v1_cart)
    end

    assert_redirected_to api_v1_carts_url
  end
end
