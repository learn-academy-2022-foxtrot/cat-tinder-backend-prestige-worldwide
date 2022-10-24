class CreateMemes < ActiveRecord::Migration[7.0]
  def change
    create_table :memes do |t|
      t.string :title
      t.integer :likes
      t.integer :dislikes
      t.text :image
      t.text :description

      t.timestamps
    end
  end
end
