class AddForeignKeyToComment < ActiveRecord::Migration
  def change
    add_column :comments, :post_id, :integer
    add_foreign_key :comments, :posts
  end
end
