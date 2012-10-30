class AddPictureToPost < ActiveRecord::Migration
  def change
    add_column :posts, :picture, :string
  end
end
