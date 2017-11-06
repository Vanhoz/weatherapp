# Users controller
class UsersController < ApplicationController
  before_action :authorize
  before_action :admin?
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
    return unless @user.update(user_params)
    redirect_to users_path
  end

  def user_params
    params.require(:user).permit(:login, :password, :admin_role)
  end
end
