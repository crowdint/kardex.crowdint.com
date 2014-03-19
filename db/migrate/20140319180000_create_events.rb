class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table(:events) do |t|
      t.string :name, null: false
      t.string :department, null: false
      t.integer :owner_id
      t.index :owner_id
    end
  end
end
