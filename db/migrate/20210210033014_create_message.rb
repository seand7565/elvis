class CreateMessage < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :message_type
      t.string :state, default: "pending"
      t.references :user

      t.timestamps
    end
  end
end
