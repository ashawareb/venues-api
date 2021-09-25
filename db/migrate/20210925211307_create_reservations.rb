class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.integer :guest_count, null: false, default: 1
      t.integer :table_id, :integer, null: false
      t.integer :shift_id, :integer, null: false
      t.references :venues, index: true
      t.references :user, index: true
      t.timestamps
    end
    add_index :reservations, [:table_id , :shift_id]
  end
end
