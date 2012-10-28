class AddCategoryToPost < ActiveRecord::Migration
  def change
    add_column :posts, :category_id, :integer, :default => 0
    
  end
end
