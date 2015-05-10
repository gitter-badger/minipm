class PasswordResetsController < ApplicationController
  before_action :require_logout
  before_action :load_user_perishable_token, only: [:edit, :update]

  layout 'login'

  # GET /password_resets/new
  def new
  end

  # POST /password_resets
  def create
    @user = User.find_by_email(params[:email])
    if @user
      UserMailer.password_reset(@user).deliver_later
      redirect_to login_path, info: 'Password reset instruction has been sent'
    else
      flash.now[:warning] = 'Email not found!'
      render :new
    end
  end

  # GET /password_resets/:perishable_token/edit
  def edit
  end

  # PUT /password_resets/:perishable_token
  def update
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    # Save without direct login
    if @user.save_without_session_maintenance
      redirect_to login_path, info: 'Password has been reset'
    else
      render :edit
    end
  end

  private

  # Load user using perishable token
  def load_user_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    redirect_to login_path unless @user
  end
end
