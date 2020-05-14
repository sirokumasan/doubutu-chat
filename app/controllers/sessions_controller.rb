class SessionsController < ApplicationController
  #before_action :set_user, only: [:create]
 

  def new
  end

  # POST/login
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      #binding.pry
      redirect_to root_url
    else
      flash.now[:danger] = t('.flash.invalid_password')
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
