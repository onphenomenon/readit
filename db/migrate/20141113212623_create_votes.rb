class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user
      t.references :post
      t.integer :status, limit: 1, null: false, default: 0
      t.timestamps
    end
    add_index :votes, :status
    add_foreign_key :votes, :users
    add_foreign_key :votes, :posts
  end
end
