class CreateVideos < ActiveRecord::Migration[8.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :duration
      t.integer :likes_count, default: 0
      t.integer :views_count, default: 0

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
