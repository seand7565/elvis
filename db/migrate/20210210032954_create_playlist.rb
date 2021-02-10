class CreatePlaylist < ActiveRecord::Migration[6.1]
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :state, default: "pending"
      t.string :spotify_id
      t.references :user

      t.timestamps
    end
  end
end
