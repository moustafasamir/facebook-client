class CreateListPageJoinTable < ActiveRecord::Migration
  def change
    create_table :lists_pages, :id => false do |t|
      t.integer :list_id
      t.integer :page_id
    end
  end
end
