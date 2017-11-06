# Weather controller
class WeathersController < ApplicationController
  include ApiCalls
  before_action :authorize, only: %i[new show]
  before_action :admin?, only: %i[new]
  def index
    @weathers = Weather.all
  end

  def new
    @weather = Weather.new
    return unless params[:city_name]
    @cities = find_city(params[:city_name])
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
