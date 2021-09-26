class CreateReservation < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.integer :guest_count, null: false, default: 1
      t.integer :table_id, null: false
      t.integer :shift_id, null: false
      t.references :venue, index: true
      t.references :user, index: true
    end
    add_index :reservations, %i[table_id shift_id]
  end
end
