class CreateUsersBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills_users do |t|
      t.integer :user_id
      t.integer :bill_id

      t.timestamps
    end
  end
end
