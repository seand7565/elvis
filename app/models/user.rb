class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tracks, through: :playlists
  has_many :playlists, inverse_of: :user
  has_many :messages, inverse_of: :user

  def find_playlist
    current_playlist = playlists.active.last
    current_playlist = add_new_playlist if current_playlist.nil?

    return current_playlist if current_playlist.created_at.season == Date.today.season

    add_new_playlist
  end

  def add_new_playlist
    playlist = playlists.create!(name: name_for_season)

    if playlist.post
      playlist.activate
    end

    playlist
  end

  def name_for_season
    "Nebulab #{Date.today.season} Mix"
  end
end
