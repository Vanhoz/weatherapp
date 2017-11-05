# Weather controller
class WeathersController < ApplicationController
  include ApiCalls
  before_action :authorize, only: %i[show]
  def index
    @weathers = Weather.all
  end

  # def add_city
  #   @weather = Weather.new
  #   if params[:city_name]
  #     res = RestClient.get 'http://api.openweathermap.org/data/2.5/find', params:
  #           { q: "#{params[:city_name]}", type: 'like', lang: 'ru', units: 'metric', APPID: 'e2ff41c4f94d5eebfd2a6593f3b36a01' }
  #     @cities = JSON.parse res
  #   end
  # end

  def new
    @weather = Weather.new
    if params[:city_name]
      @cities = find_city(params[:city_name])
    end
  end

  def create
    @weather = Weather.new(weather_params)
    @weather.user_id = current_user.id
    if @weather.save
      redirect_to root_url, notice: 'Спасибо за регистрацию!'
    else
      render 'new'
    end
  end

  def show
    @weather = Weather.find(params[:id])
    @city = show_city(@weather.city_id)
  end

  def weather_params
    params.require(:weather).permit(:city_name, :city_id, :user_id)
  end
end
