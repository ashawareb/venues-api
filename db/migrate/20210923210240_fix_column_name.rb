class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :venues, :toke, :token
  end
end
