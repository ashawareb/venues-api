class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :token, null: false, default: ''
      t.timestamps
    end
    add_index :venues, :email, unique: true
  end
end
