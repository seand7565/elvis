class Track < ApplicationRecord
  belongs_to :playlist, inverse_of: :tracks

  delegate :user, to: :playlist

  validates :spotify_id, uniqueness: { scope: :playlist_id }

  after_commit :post, on: :create

  state_machine initial: :pending do
    event :post do
      transition pending: :posted
    end

    before_transition to: :posted, do: :push_to_spotify
  end

  def push_to_spotify
    ::Elvis::Spotify.new(user).post_track(self)
  end
end
