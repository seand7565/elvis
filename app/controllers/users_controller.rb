class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def spotify
    if spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
      User.find_by(email: "elvisstack@gmail.com").update(user_hash: spotify_user.to_hash)
    end
  end
end
