class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :flight_id
      t.integer :user_id
      t.text :description
      t.integer :weight

      t.timestamps
    end
  end
end
