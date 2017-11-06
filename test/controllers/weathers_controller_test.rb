require 'test_helper'

class WeathersControllerTest < ActionDispatch::IntegrationTest
  # test 'the truth' do
  #   assert true
  # end
  setup do
    @weather = weathers(:one)
  end

  test 'should get index' do
    get weathers_url
    assert_response :success
  end

  test 'should not get new without admin role' do
    @weather = weathers(:two)
    get new_weather_path
    assert_redirected_to login_path
  end

  test 'should not show weather without login' do
    get weather_url(@weather)
    assert_redirected_to login_path
  end
end
