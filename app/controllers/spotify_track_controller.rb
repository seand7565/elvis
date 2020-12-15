class SpotifyTrackController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    if event = JSON.parse(request.body.read)["event"]
      spotify_user = RSpotify::User.new(User.last.user_hash)
      playlist = RSpotify::Playlist.find(ENV['SPOTIFY_USER'], ENV['SPOTIFY_PLAYLIST_ID'])
      track = event["links"][0]["url"].match(/(?<=\/track\/)(\w+)/)[0]
      playlist.add_tracks!(["spotify:track:#{track}"])
    end

    render json: request.body
  end
end
