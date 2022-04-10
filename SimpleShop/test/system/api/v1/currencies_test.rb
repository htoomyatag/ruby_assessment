require "application_system_test_case"

class Api::V1::CurrenciesTest < ApplicationSystemTestCase
  setup do
    @api_v1_currency = api_v1_currencies(:one)
  end

  test "visiting the index" do
    visit api_v1_currencies_url
    assert_selector "h1", text: "Api/V1/Currencies"
  end

  test "creating a Currency" do
    visit api_v1_currencies_url
    click_on "New Api/V1/Currency"

    fill_in "Currency code", with: @api_v1_currency.currency_code
    fill_in "Title", with: @api_v1_currency.title
    click_on "Create Currency"

    assert_text "Currency was successfully created"
    click_on "Back"
  end

  test "updating a Currency" do
    visit api_v1_currencies_url
    click_on "Edit", match: :first

    fill_in "Currency code", with: @api_v1_currency.currency_code
    fill_in "Title", with: @api_v1_currency.title
    click_on "Update Currency"

    assert_text "Currency was successfully updated"
    click_on "Back"
  end

  test "destroying a Currency" do
    visit api_v1_currencies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Currency was successfully destroyed"
  end
end
