class CreateTable < ActiveRecord::Migration[5.0]
  def change
    create_table :tables do |t|
      t.string :name, null: false
      t.integer :min_guests, null: false, default: 1
      t.integer :max_guests, null: false, default: 2
      t.references :venue, index: true
    end
  end
end
