class UserSessionsController < ApplicationController
  before_action :require_login,  only: [:destroy]
  before_action :require_logout, only: [:new, :create]

  layout 'login'

  # GET /sessions/new
  def new
    @user_session = UserSession.new
  end

  # POST /sessions
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to root_path, info: 'Logged in!'
    else
      flash[:warning] = 'Invalid username or password'
      render :new
    end
  end

  # DELETE /sessions
  def destroy
    current_session.destroy
    redirect_to root_path, info: 'Logged out!'
  end
end
