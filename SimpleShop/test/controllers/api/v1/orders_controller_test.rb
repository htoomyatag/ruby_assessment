require "test_helper"

class Api::V1::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_order = api_v1_orders(:one)
  end

  test "should get index" do
    get api_v1_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_order_url
    assert_response :success
  end

  test "should create api_v1_order" do
    assert_difference('Api::V1::Order.count') do
      post api_v1_orders_url, params: { api_v1_order: { first_name: @api_v1_order.first_name, last_name: @api_v1_order.last_name, order_status: @api_v1_order.order_status, order_total: @api_v1_order.order_total, paid_at: @api_v1_order.paid_at, shipping_address: @api_v1_order.shipping_address } }
    end

    assert_redirected_to api_v1_order_url(Api::V1::Order.last)
  end

  test "should show api_v1_order" do
    get api_v1_order_url(@api_v1_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_order_url(@api_v1_order)
    assert_response :success
  end

  test "should update api_v1_order" do
    patch api_v1_order_url(@api_v1_order), params: { api_v1_order: { first_name: @api_v1_order.first_name, last_name: @api_v1_order.last_name, order_status: @api_v1_order.order_status, order_total: @api_v1_order.order_total, paid_at: @api_v1_order.paid_at, shipping_address: @api_v1_order.shipping_address } }
    assert_redirected_to api_v1_order_url(@api_v1_order)
  end

  test "should destroy api_v1_order" do
    assert_difference('Api::V1::Order.count', -1) do
      delete api_v1_order_url(@api_v1_order)
    end

    assert_redirected_to api_v1_orders_url
  end
end
