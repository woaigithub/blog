class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :detail
      t.references :client

      t.timestamps
    end
    add_index :addresses, :client_id
  end
end
