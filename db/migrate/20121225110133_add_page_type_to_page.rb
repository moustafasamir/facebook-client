class AddPageTypeToPage < ActiveRecord::Migration
  def change
    add_column :pages, :page_type, :string
  end
end
