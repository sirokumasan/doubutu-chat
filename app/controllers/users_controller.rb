class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def show
    @user = User.find(params[:id])
    @messages = @user.messages
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash.now[:success] = "ようこそ" 
      #flash[:success] = "Welcome to the Sample App!"
      redirect_to root_path
    else   
      render 'new'
    end
  end

  #GET /users/:id/edit
  def edit
    @user = User.find(params[:id])
  end

  # PATCH /users/:id
  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
    redirect_to root_path
    flash[:success] = "プロフィールを更新しました"
    else  
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_url
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in? 
        store_location
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user? @user
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
