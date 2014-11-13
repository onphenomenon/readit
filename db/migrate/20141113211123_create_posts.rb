class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.float :rank
      t.integer :status, limit: 1, null: false, default: 0
      t.references :user
      t.references :topic
      t.timestamps
    end
    add_index :posts, :status
    add_foreign_key :posts, :users
    add_foreign_key :posts, :topics
  end

end
