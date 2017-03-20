class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.date :due_date
      t.integer :bill_id
      t.boolean :paid

      t.timestamps
    end
  end
end
