class WelcomeController < ApplicationController
  def index
    current_user
    require_user
  end
end
