require "application_system_test_case"

class Api::V1::LineItemsTest < ApplicationSystemTestCase
  setup do
    @api_v1_line_item = api_v1_line_items(:one)
  end

  test "visiting the index" do
    visit api_v1_line_items_url
    assert_selector "h1", text: "Api/V1/Line Items"
  end

  test "creating a Line item" do
    visit api_v1_line_items_url
    click_on "New Api/V1/Line Item"

    fill_in "Cart", with: @api_v1_line_item.cart_id
    fill_in "Order", with: @api_v1_line_item.order_id
    fill_in "Product", with: @api_v1_line_item.product_id
    fill_in "Quantity", with: @api_v1_line_item.quantity
    click_on "Create Line item"

    assert_text "Line item was successfully created"
    click_on "Back"
  end

  test "updating a Line item" do
    visit api_v1_line_items_url
    click_on "Edit", match: :first

    fill_in "Cart", with: @api_v1_line_item.cart_id
    fill_in "Order", with: @api_v1_line_item.order_id
    fill_in "Product", with: @api_v1_line_item.product_id
    fill_in "Quantity", with: @api_v1_line_item.quantity
    click_on "Update Line item"

    assert_text "Line item was successfully updated"
    click_on "Back"
  end

  test "destroying a Line item" do
    visit api_v1_line_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Line item was successfully destroyed"
  end
end
