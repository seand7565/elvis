class SpotifyTrackController < ApplicationController
  def create
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    playlist = RSpotify::Playlist.find('3ghCcmmzyqsf864poIstH9')
    track = request.body["event"]["links"][0]["url"]
    playlist.add_tracks!([track])

    render json: request.body
  end
end
