require "application_system_test_case"

class GeneresTest < ApplicationSystemTestCase
  setup do
    @genere = generes(:one)
  end

  test "visiting the index" do
    visit generes_url
    assert_selector "h1", text: "Generes"
  end

  test "should create genere" do
    visit generes_url
    click_on "New genere"

    fill_in "Title", with: @genere.title
    click_on "Create Genere"

    assert_text "Genere was successfully created"
    click_on "Back"
  end

  test "should update Genere" do
    visit genere_url(@genere)
    click_on "Edit this genere", match: :first

    fill_in "Title", with: @genere.title
    click_on "Update Genere"

    assert_text "Genere was successfully updated"
    click_on "Back"
  end

  test "should destroy Genere" do
    visit genere_url(@genere)
    click_on "Destroy this genere", match: :first

    assert_text "Genere was successfully destroyed"
  end
end
