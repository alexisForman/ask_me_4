class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Account successfully created! Please log in using your new username and password."
      redirect_to login_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end


  private 

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
