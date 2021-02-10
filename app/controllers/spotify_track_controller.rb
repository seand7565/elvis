class SpotifyTrackController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    if event = JSON.parse(request.body.read)["event"]
      user = User.find_by(email: "elvisstack@gmail.com")
      track = find_track(event, user)
      playlist = user.find_playlist

      playlist.tracks.create!(
        spotify_id: find_spotify_url(event),
        submitter: find_spotify_submitter(event),
        artist: track.artists.first,
        name: track.name
      )
    end

    render json: request.body
  end

  private

  def find_track(event, user)
    Elvis::Spotify.new(user).find_track(find_spotify_url(event))
  end

  def find_spotify_url(event)
    event["links"][0]["url"].match(/(?<=\/track\/)(\w+)/)[0]
  end

  def find_spotify_submitter(event)
    Elvis::Slack.new.get_user_name(event["user"])
  end
end
