class WelcomeController < ApplicationController
  def index
    current_user
    require_user
    #if session[:user_id]
    #  @user = User.find(session[:user_id])
    #end

  end
end
