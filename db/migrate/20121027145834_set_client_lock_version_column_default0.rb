class SetClientLockVersionColumnDefault0 < ActiveRecord::Migration
  def change
    change_column :clients, :lock_version, :integer, :default => 0
  end

end
