class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.integer :status, limit: 1, null: false, default: 0
      t.timestamps
    end
  end
end
