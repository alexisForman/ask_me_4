class PasswordResetController < ApplicationController
  def new
    
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_now
      redirect_to root_path
      flash[:notice] = "If an account with that email was found, we have sent a link to reset your password."
    end
  end

  def edit
    @user = User.find_signed(params[:token], purpose: "password_reset")

  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to password_reset_path
    flash[:notice] = "Your reset token has expired, please request a new one and try again."
  end

  def update
    @user = User.find_signed(params[:token], purpose: "password_reset")
    if @user.update(password_params)
    flash[:notice] = "Your password successfully updated. Please log in using your new password"    
    redirect_to login_path
    else
      render :edit
      flash[:notice] = "That didnt work. Try again."
      
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password)
  end
end
