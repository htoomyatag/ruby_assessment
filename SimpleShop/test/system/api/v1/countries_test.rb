require "application_system_test_case"

class Api::V1::CountriesTest < ApplicationSystemTestCase
  setup do
    @api_v1_country = api_v1_countries(:one)
  end

  test "visiting the index" do
    visit api_v1_countries_url
    assert_selector "h1", text: "Api/V1/Countries"
  end

  test "creating a Country" do
    visit api_v1_countries_url
    click_on "New Api/V1/Country"

    fill_in "Country code", with: @api_v1_country.country_code
    fill_in "Title", with: @api_v1_country.title
    click_on "Create Country"

    assert_text "Country was successfully created"
    click_on "Back"
  end

  test "updating a Country" do
    visit api_v1_countries_url
    click_on "Edit", match: :first

    fill_in "Country code", with: @api_v1_country.country_code
    fill_in "Title", with: @api_v1_country.title
    click_on "Update Country"

    assert_text "Country was successfully updated"
    click_on "Back"
  end

  test "destroying a Country" do
    visit api_v1_countries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Country was successfully destroyed"
  end
end
