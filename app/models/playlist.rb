class Playlist < ApplicationRecord
  belongs_to :user, inverse_of: :playlists
  has_many :tracks, inverse_of: :playlist

  validates :name, uniqueness: { scope: :user_id }

  scope :active, -> { where(state: "active") }

  state_machine initial: :pending do
    event :post do
      transition pending: :posted
    end

    event :activate do
      transition posted: :active
    end

    event :deactivate do
      transition active: :inactive
    end

    before_transition to: :posted, do: :push_to_spotify
    before_transition to: :active, do: :deactivate_active_playlist
    after_transition to: :active, do: :notify_slack
  end

  def push_to_spotify
    spotify_playlist = ::Elvis::Spotify.new(user).post_playlist(self)
    update!(spotify_id: spotify_playlist.id)
  end

  def spotify_url
    "https://open.spotify.com/playlist/#{spotify_id}"
  end

  def notify_slack
    message = user.messages.create!(message_type: Elvis::Messages::NewPlaylist)
    message.post!
  end

  def to_spotify
    ::RSpotify::Playlist.find_by_id(spotify_id)
  end

  def deactivate_active_playlist
    user.playlists.active.map(&:deactivate!)
  end
end
