class AddBillOwner < ActiveRecord::Migration[5.0]
  def change
    change_table :bills do |t|
      t.integer :user_id
      t.index :user_id
    end
  end
end
