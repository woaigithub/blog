class RenameColumnInUsersSaltToPasswordSalt < ActiveRecord::Migration
  def up
    rename_column :users, :salt, :password_salt
  end

  def down
    rename_column :users, :password_salt, :salt
  end
end
