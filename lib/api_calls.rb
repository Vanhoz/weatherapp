# methods for API calls
module ApiCalls
  def find_city(city_name)
    res = RestClient.get 'http://api.openweathermap.org/data/2.5/find', params:
    { q: city_name, type: 'like', lang: 'ru', units: 'metric', APPID: 'e2ff41c4f94d5eebfd2a6593f3b36a01' }
    JSON.parse res
  end

  def show_city(city_id)
    res = RestClient.get 'http://api.openweathermap.org/data/2.5/weather', params:
    { id: city_id, units: 'metric', lang: 'ru', APPID: 'e2ff41c4f94d5eebfd2a6593f3b36a01' }
    JSON.parse res
  end
end
