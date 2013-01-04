class ModifyPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_id, :integer
    add_column :posts, :type, :string
    remove_column :posts, :name
    remove_column :posts, :title
    remove_column :posts, :content
    remove_column :posts, :list_id
    remove_column :posts, :fb_id
  end
end