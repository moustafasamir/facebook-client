class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :category
      t.string :fb_id

      t.timestamps
    end
  end
end
