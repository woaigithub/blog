class AddClientRoleRelationTable < ActiveRecord::Migration
  def change
    create_table :clientroles do |t|
      t.references :client
      t.references :role

      t.timestamps
    end
  end

  
end
