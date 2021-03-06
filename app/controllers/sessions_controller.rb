class SessionsController < ApplicationController
  #before_action :set_user, only: [:create]
 

  def new
  end

  # POST/login
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else 
      flash.now[:alert] = "ログインに失敗しました"
      render 'new'
    end
  end

  #
  def destroy 
    log_out if logged_in?
    redirect_to root_url
  end

  private

    def set_user
    end

    def session_params
      params.require(:session).permit(:email, :password)
    end

end
