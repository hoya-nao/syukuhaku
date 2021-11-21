class AddNanmeiToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :nanmei, :integer
    add_column :posts, :hajime, :datetime
    add_column :posts, :owari, :datetime
  end
end
