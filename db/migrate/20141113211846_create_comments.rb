class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.references :user
      t.references :post
      t.integer :status, limit: 1, null: false, default: 0
      t.timestamps
    end
    add_index :comments, :status
    add_foreign_key :comments, :users
    add_foreign_key :comments, :posts
  end
end
