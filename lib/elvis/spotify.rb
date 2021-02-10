module Elvis
  class Spotify
    def initialize(user)
      @user = ::RSpotify::User.new(user.user_hash)
    end

    def post_track(track)
      track.playlist.to_spotify.add_tracks!(["spotify:track:#{track.spotify_id}"])
    end

    def post_playlist(playlist)
      @user.create_playlist!(playlist.name)
    end

    def find_track(track_id)
      ::RSpotify::Track.find(track_id)
    end
  end
end
