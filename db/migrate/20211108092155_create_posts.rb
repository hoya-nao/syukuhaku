class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :roomname
      t.text :roomdata
      t.integer :kane
      t.string :juusyo
      t.string :roomgazou

      t.timestamps
    end
  end
end
