# Users controller
class UsersController < ApplicationController
  before_action :admin?, only: %i[index update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Спасибо за регистрацию!'
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    end
  end

  def add_city
    open_weather_api = OpenWeatherAPI::API.new api_key: "e2ff41c4f94d5eebfd2a6593f3b36a01", default_language: 'ru', default_units: 'metric', default_country_code: 'ru'
    # cities = open_weather_api.raw 'http://api.openweathermap.org/data/2.5/find', q: 'Moscow', type: 'like', APPID: "e2ff41c4f94d5eebfd2a6593f3b36a01"
    res = RestClient.get 'http://api.openweathermap.org/data/2.5/find', params: { q: 'Moscow', type: 'like', APPID: "e2ff41c4f94d5eebfd2a6593f3b36a01", default_language: 'ru' }
    # city = cities[:list][0][:name]
    cities = JSON.parse res
    params[:city_name] = cities['list'][0]['name']
    puts params
    # cities['list'].each {|h| puts h['name'], h['sys']['country']}
    #puts res
  end

  def user_params
    params.require(:user).permit(:login, :password, :admin_role)
  end
end
