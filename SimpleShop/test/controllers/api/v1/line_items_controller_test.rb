require "test_helper"

class Api::V1::LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_line_item = api_v1_line_items(:one)
  end

  test "should get index" do
    get api_v1_line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_line_item_url
    assert_response :success
  end

  test "should create api_v1_line_item" do
    assert_difference('Api::V1::LineItem.count') do
      post api_v1_line_items_url, params: { api_v1_line_item: { cart_id: @api_v1_line_item.cart_id, order_id: @api_v1_line_item.order_id, product_id: @api_v1_line_item.product_id, quantity: @api_v1_line_item.quantity } }
    end

    assert_redirected_to api_v1_line_item_url(Api::V1::LineItem.last)
  end

  test "should show api_v1_line_item" do
    get api_v1_line_item_url(@api_v1_line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_line_item_url(@api_v1_line_item)
    assert_response :success
  end

  test "should update api_v1_line_item" do
    patch api_v1_line_item_url(@api_v1_line_item), params: { api_v1_line_item: { cart_id: @api_v1_line_item.cart_id, order_id: @api_v1_line_item.order_id, product_id: @api_v1_line_item.product_id, quantity: @api_v1_line_item.quantity } }
    assert_redirected_to api_v1_line_item_url(@api_v1_line_item)
  end

  test "should destroy api_v1_line_item" do
    assert_difference('Api::V1::LineItem.count', -1) do
      delete api_v1_line_item_url(@api_v1_line_item)
    end

    assert_redirected_to api_v1_line_items_url
  end
end
