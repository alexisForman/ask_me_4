class SessionsController < ApplicationController
  # before_action :already_signed_in?, except: [:destroy]

  def new

  end

  def create
    user = User.find_by(username: params[:username])
    session[:user_id] = user.id
    if user && user.authenticate(params[:password])
      flash[:notice] = "Login successful, welcome back!"
      redirect_to upload_path
    else
      flash[:notice] = "Login unsuccessful, try again!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Goodbye for now! You have successfully logged out."
    redirect_to root_path
  end

end
