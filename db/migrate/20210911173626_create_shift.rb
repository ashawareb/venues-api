class CreateShift < ActiveRecord::Migration[5.0]
  def change
    create_table :shifts do |t|
      t.string :name, null: false
      t.time :start_at, null: false
      t.time :end_at, null: false
      t.references :venue, index: true
    end
    add_index :shifts, %i[start_at end_at]
  end
end
