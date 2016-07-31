class SessionsController < ApplicationController

  def create
    @user = User.confirm(user_params)
    if @user
      login(@user)
      redirect_to '/users/#{@user.id}'
      flash[:notice] = "You have logged in successfully"
    else
      redirect_to '/sign_in'
      flash[:error] = "Log in error. Please try again."
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
