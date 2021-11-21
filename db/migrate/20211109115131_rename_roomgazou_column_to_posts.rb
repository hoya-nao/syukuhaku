class RenameRoomgazouColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :roomgazou, :img
  end
end
