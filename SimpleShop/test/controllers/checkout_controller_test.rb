require "test_helper"

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "should get purchase" do
    get checkout_purchase_url
    assert_response :success
  end
end
