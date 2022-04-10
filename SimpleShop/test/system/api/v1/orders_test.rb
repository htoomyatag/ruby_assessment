require "application_system_test_case"

class Api::V1::OrdersTest < ApplicationSystemTestCase
  setup do
    @api_v1_order = api_v1_orders(:one)
  end

  test "visiting the index" do
    visit api_v1_orders_url
    assert_selector "h1", text: "Api/V1/Orders"
  end

  test "creating a Order" do
    visit api_v1_orders_url
    click_on "New Api/V1/Order"

    fill_in "First name", with: @api_v1_order.first_name
    fill_in "Last name", with: @api_v1_order.last_name
    fill_in "Order status", with: @api_v1_order.order_status
    fill_in "Order total", with: @api_v1_order.order_total
    fill_in "Paid at", with: @api_v1_order.paid_at
    fill_in "Shipping address", with: @api_v1_order.shipping_address
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit api_v1_orders_url
    click_on "Edit", match: :first

    fill_in "First name", with: @api_v1_order.first_name
    fill_in "Last name", with: @api_v1_order.last_name
    fill_in "Order status", with: @api_v1_order.order_status
    fill_in "Order total", with: @api_v1_order.order_total
    fill_in "Paid at", with: @api_v1_order.paid_at
    fill_in "Shipping address", with: @api_v1_order.shipping_address
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit api_v1_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
