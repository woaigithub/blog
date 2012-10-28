class AddLockVersionToClient < ActiveRecord::Migration
  def change
    add_column :clients, :lock_version, :integer, :default => 0
  end
end
