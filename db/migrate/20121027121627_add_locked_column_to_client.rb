class AddLockedColumnToClient < ActiveRecord::Migration
  def change
    add_column :clients, :locked, :boolean, :default => false
  end
end
