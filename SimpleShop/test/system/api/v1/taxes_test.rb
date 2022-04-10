require "application_system_test_case"

class Api::V1::TaxesTest < ApplicationSystemTestCase
  setup do
    @api_v1_tax = api_v1_taxes(:one)
  end

  test "visiting the index" do
    visit api_v1_taxes_url
    assert_selector "h1", text: "Api/V1/Taxes"
  end

  test "creating a Tax" do
    visit api_v1_taxes_url
    click_on "New Api/V1/Tax"

    fill_in "Tax category", with: @api_v1_tax.tax_category
    fill_in "Tax rate", with: @api_v1_tax.tax_rate
    click_on "Create Tax"

    assert_text "Tax was successfully created"
    click_on "Back"
  end

  test "updating a Tax" do
    visit api_v1_taxes_url
    click_on "Edit", match: :first

    fill_in "Tax category", with: @api_v1_tax.tax_category
    fill_in "Tax rate", with: @api_v1_tax.tax_rate
    click_on "Update Tax"

    assert_text "Tax was successfully updated"
    click_on "Back"
  end

  test "destroying a Tax" do
    visit api_v1_taxes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tax was successfully destroyed"
  end
end
