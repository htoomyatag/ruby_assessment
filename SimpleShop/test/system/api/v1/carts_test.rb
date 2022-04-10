require "application_system_test_case"

class Api::V1::CartsTest < ApplicationSystemTestCase
  setup do
    @api_v1_cart = api_v1_carts(:one)
  end

  test "visiting the index" do
    visit api_v1_carts_url
    assert_selector "h1", text: "Api/V1/Carts"
  end

  test "creating a Cart" do
    visit api_v1_carts_url
    click_on "New Api/V1/Cart"

    click_on "Create Cart"

    assert_text "Cart was successfully created"
    click_on "Back"
  end

  test "updating a Cart" do
    visit api_v1_carts_url
    click_on "Edit", match: :first

    click_on "Update Cart"

    assert_text "Cart was successfully updated"
    click_on "Back"
  end

  test "destroying a Cart" do
    visit api_v1_carts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cart was successfully destroyed"
  end
end
