class CreateShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :shifts do |t|
      t.string :name, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.references :venues, index: true
      t.timestamps
    end
    add_index :shifts , [:start_time , :end_time]
  end
end
