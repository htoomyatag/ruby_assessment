require "application_system_test_case"

class Api::V1::RegionsTest < ApplicationSystemTestCase
  setup do
    @api_v1_region = api_v1_regions(:one)
  end

  test "visiting the index" do
    visit api_v1_regions_url
    assert_selector "h1", text: "Api/V1/Regions"
  end

  test "creating a Region" do
    visit api_v1_regions_url
    click_on "New Api/V1/Region"

    fill_in "Country", with: @api_v1_region.country_id
    fill_in "Currency", with: @api_v1_region.currency_id
    fill_in "Tax", with: @api_v1_region.tax_id
    fill_in "Title", with: @api_v1_region.title
    click_on "Create Region"

    assert_text "Region was successfully created"
    click_on "Back"
  end

  test "updating a Region" do
    visit api_v1_regions_url
    click_on "Edit", match: :first

    fill_in "Country", with: @api_v1_region.country_id
    fill_in "Currency", with: @api_v1_region.currency_id
    fill_in "Tax", with: @api_v1_region.tax_id
    fill_in "Title", with: @api_v1_region.title
    click_on "Update Region"

    assert_text "Region was successfully updated"
    click_on "Back"
  end

  test "destroying a Region" do
    visit api_v1_regions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Region was successfully destroyed"
  end
end
