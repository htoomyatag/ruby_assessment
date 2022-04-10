require "test_helper"

class Api::V1::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_product = api_v1_products(:one)
  end

  test "should get index" do
    get api_v1_products_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_product_url
    assert_response :success
  end

  test "should create api_v1_product" do
    assert_difference('Api::V1::Product.count') do
      post api_v1_products_url, params: { api_v1_product: { description: @api_v1_product.description, image_url: @api_v1_product.image_url, order_total: @api_v1_product.order_total, price: @api_v1_product.price, sku: @api_v1_product.sku, stock: @api_v1_product.stock, title: @api_v1_product.title } }
    end

    assert_redirected_to api_v1_product_url(Api::V1::Product.last)
  end

  test "should show api_v1_product" do
    get api_v1_product_url(@api_v1_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_product_url(@api_v1_product)
    assert_response :success
  end

  test "should update api_v1_product" do
    patch api_v1_product_url(@api_v1_product), params: { api_v1_product: { description: @api_v1_product.description, image_url: @api_v1_product.image_url, order_total: @api_v1_product.order_total, price: @api_v1_product.price, sku: @api_v1_product.sku, stock: @api_v1_product.stock, title: @api_v1_product.title } }
    assert_redirected_to api_v1_product_url(@api_v1_product)
  end

  test "should destroy api_v1_product" do
    assert_difference('Api::V1::Product.count', -1) do
      delete api_v1_product_url(@api_v1_product)
    end

    assert_redirected_to api_v1_products_url
  end
end
