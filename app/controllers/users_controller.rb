class UsersController < ApplicationController
  def show # 追加
   @user = User.find(params[:id])
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
  before_action :logged_in_user, only: [:edit]
  def edit
    @user = User.new
  end
  
  def update
  end
  
end