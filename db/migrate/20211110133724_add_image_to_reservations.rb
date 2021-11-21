class AddImageToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :image, :string
    add_column :reservations, :kane, :integer
    add_column :reservations, :roomname, :string
    add_column :reservations, :juusyo, :string
    add_column :reservations, :roomdata, :string
  end
end
