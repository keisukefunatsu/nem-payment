require 'test_helper'

class XemPricesControllerTest < ActionDispatch::IntegrationTest
  test "should get fetch_xem_price" do
    get xem_prices_fetch_xem_price_url
    assert_response :success
  end

end
