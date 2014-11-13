class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
  	  t.references :user
      t.references :post
      t.integer :status, limit: 1, null: false, default: 0
      t.timestamps
      t.timestamps
    end
    add_index :favorites, :status
    add_foreign_key :favorites, :users
    add_foreign_key :favorites, :posts
  end
end
