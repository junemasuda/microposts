class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)

   before_action :logged_in_user, only: [:edit, :update]
  
  
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