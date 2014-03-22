# This migration comes from kardex (originally 20140319165454)
class CreateKardexUsers < ActiveRecord::Migration
  def change
    create_table :kardex_users do |t|
      t.string :email, null: false
      t.string :name
      t.string :department
      t.boolean :active

      t.timestamps
    end
  end
end
