class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
 
  def edit
    @user = User.find(params[:id])
    if (current_user != @user)
      redirect_to root_path
    end
  end
  
  def update
    @user = User.find(params[:id])
    if (current_user !=@user)
      redirect_to root_path
    end
    if(@user.update(user_profile))
      redirect_to user_path(@user.id), notice:"save succeed"
    else
      flash.now[:alert] = "update failed"
      render :edit
    end
  end
  
  # http://servername/users/1/followings
  def followings
    @user = User.find(params[:id])
    @f_users = @user.following_users
  end
  
  def followers
    @user = User.find(params[:id])
    @f_users = @user.follower_users
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :profile, :area, :password,
                                 :password_confirmation)
  end

  def user_profile
    params.require(:user).permit(:name, :email, :profile, :area, :password,
                                 :password_confirmation)
  end


end
