class RemovePostIdFromPost < ActiveRecord::Migration
  def up
    remove_column :posts, :post_id
  end

  def down
    add_column :posts, :post_id, :integer
  end
end
