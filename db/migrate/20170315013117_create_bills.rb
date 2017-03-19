class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.integer :day
      t.date :start
      t.date :end
      t.boolean :active

      t.timestamps
    end

    add_index :bills, :start
    add_index :bills, :end
    add_index :bills, :active
  end
end
