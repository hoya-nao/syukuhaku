class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :hiyou
      t.integer :nanmei
      t.integer :goukei
      t.datetime :hajime
      t.datetime :owari

      t.timestamps
    end
  end
end
