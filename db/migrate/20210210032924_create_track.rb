class CreateTrack < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string :submitter
      t.string :artist
      t.string :name
      t.string :spotify_id
      t.string :state, default: "pending"
      t.references :playlist

      t.timestamps
    end
  end
end
