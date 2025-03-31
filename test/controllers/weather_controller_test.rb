require "test_helper"

class WeatherControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get weather_search_url
    assert_response :success
  end

  test "should get show" do
    get weather_show_url
    assert_response :success
  end
end
