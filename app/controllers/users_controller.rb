# Users controller
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to signup_url, notice: 'Спасибо за регистрацию!'
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:login, :password)
  end
end
