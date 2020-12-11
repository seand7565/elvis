class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def spotify
    Rails.cache.write("user", RSpotify::User.new(request.env['omniauth.auth']).to_hash)
  end
end
