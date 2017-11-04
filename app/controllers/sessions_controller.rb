# Sessions
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_login(params[:login])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      puts session
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now.alert = 'Email or password is invalid'
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to signup_url, notice: 'Logged out!'
  end
end
