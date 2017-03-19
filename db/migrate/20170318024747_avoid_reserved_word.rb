class AvoidReservedWord < ActiveRecord::Migration[5.0]
  def change
    rename_column :bills, :start, :start_date
    rename_column :bills, :end, :end_date
  end
end
