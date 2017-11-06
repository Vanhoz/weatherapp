OpenWeatherAPI.configure do |config|
  # API key
  config.api_key = "e2ff41c4f94d5eebfd2a6593f3b36a01"

  # Optionals
  config.default_language = 'ru'     # 'en' by default
  config.default_country_code = 'ru' # nil by default (ISO 3166-1 alfa2)
  config.default_units = 'metric'    # 'metric' by default
end