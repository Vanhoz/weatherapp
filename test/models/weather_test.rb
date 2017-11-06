require 'test_helper'

class WeatherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should create Weather' do
    weather = Weather.new city_name: 'Somecity', city_id: 'Someid', user: users(:one)
    assert weather.save
  end

  test 'should not create Weather without validated parameters' do
    weather = Weather.new
    assert_not weather.save
  end
end
