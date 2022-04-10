require "application_system_test_case"

class Api::V1::ProductsTest < ApplicationSystemTestCase
  setup do
    @api_v1_product = api_v1_products(:one)
  end

  test "visiting the index" do
    visit api_v1_products_url
    assert_selector "h1", text: "Api/V1/Products"
  end

  test "creating a Product" do
    visit api_v1_products_url
    click_on "New Api/V1/Product"

    fill_in "Description", with: @api_v1_product.description
    fill_in "Image url", with: @api_v1_product.image_url
    fill_in "Order total", with: @api_v1_product.order_total
    fill_in "Price", with: @api_v1_product.price
    fill_in "Sku", with: @api_v1_product.sku
    fill_in "Stock", with: @api_v1_product.stock
    fill_in "Title", with: @api_v1_product.title
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit api_v1_products_url
    click_on "Edit", match: :first

    fill_in "Description", with: @api_v1_product.description
    fill_in "Image url", with: @api_v1_product.image_url
    fill_in "Order total", with: @api_v1_product.order_total
    fill_in "Price", with: @api_v1_product.price
    fill_in "Sku", with: @api_v1_product.sku
    fill_in "Stock", with: @api_v1_product.stock
    fill_in "Title", with: @api_v1_product.title
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit api_v1_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
