class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @is_admin = current_user&.email == "elvisstack@gmail.com"
  end
end
