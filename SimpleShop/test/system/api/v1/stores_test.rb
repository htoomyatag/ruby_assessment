require "application_system_test_case"

class Api::V1::StoresTest < ApplicationSystemTestCase
  setup do
    @api_v1_store = api_v1_stores(:one)
  end

  test "visiting the index" do
    visit api_v1_stores_url
    assert_selector "h1", text: "Api/V1/Stores"
  end

  test "creating a Store" do
    visit api_v1_stores_url
    click_on "New Api/V1/Store"

    fill_in "Region", with: @api_v1_store.region_id
    fill_in "Title", with: @api_v1_store.title
    click_on "Create Store"

    assert_text "Store was successfully created"
    click_on "Back"
  end

  test "updating a Store" do
    visit api_v1_stores_url
    click_on "Edit", match: :first

    fill_in "Region", with: @api_v1_store.region_id
    fill_in "Title", with: @api_v1_store.title
    click_on "Update Store"

    assert_text "Store was successfully updated"
    click_on "Back"
  end

  test "destroying a Store" do
    visit api_v1_stores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Store was successfully destroyed"
  end
end
