class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password))
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
end
