class AddRoomnameRoomdateKaneJuusyoRoomgazouToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :roomname, :string
    add_column :users, :roomdate, :text
    add_column :users, :kane, :integer
    add_column :users, :juusyo, :string
    add_column :users, :roomgazou, :string
  end
end