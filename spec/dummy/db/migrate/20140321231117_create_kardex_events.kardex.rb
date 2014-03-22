# This migration comes from kardex (originally 20140319180000)
class CreateKardexEvents < ActiveRecord::Migration
  def self.up
    create_table(:kardex_events) do |t|
      t.string :name, null: false
      t.string :department, null: false
      t.integer :owner_id
      t.index :owner_id
    end
  end
end
