require "test_helper"

class GeneresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @genere = generes(:one)
  end

  test "should get index" do
    get generes_url
    assert_response :success
  end

  test "should get new" do
    get new_genere_url
    assert_response :success
  end

  test "should create genere" do
    assert_difference("Genere.count") do
      post generes_url, params: { genere: { title: @genere.title } }
    end

    assert_redirected_to genere_url(Genere.last)
  end

  test "should show genere" do
    get genere_url(@genere)
    assert_response :success
  end

  test "should get edit" do
    get edit_genere_url(@genere)
    assert_response :success
  end

  test "should update genere" do
    patch genere_url(@genere), params: { genere: { title: @genere.title } }
    assert_redirected_to genere_url(@genere)
  end

  test "should destroy genere" do
    assert_difference("Genere.count", -1) do
      delete genere_url(@genere)
    end

    assert_redirected_to generes_url
  end
end
