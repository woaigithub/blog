class ChangePostColumnContentToText < ActiveRecord::Migration
  def up
    change_column :posts, :content, :text
  end

  def down
  end
end
