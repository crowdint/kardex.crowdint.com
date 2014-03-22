# This migration comes from kardex (originally 20140319222506)
class CreateKardexAttendances < ActiveRecord::Migration
  def change
    create_table :kardex_attendances do |t|
      t.belongs_to :user
      t.belongs_to :event

      t.timestamps
    end
  end
end