class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.belongs_to :user
      t.belongs_to :event

      t.timestamps
    end
  end
end
