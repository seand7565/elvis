module Elvis
  module Messages
    class NewPlaylist
      def self.text(user)
        "Good news, everyone! The new playlist - #{user.name_for_season} - is available here: #{user.playlists.active.last.spotify_url}"
      end
    end
  end
end
