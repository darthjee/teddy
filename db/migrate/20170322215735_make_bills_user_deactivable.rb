class MakeBillsUserDeactivable < ActiveRecord::Migration[5.0]
  def change
    change_table :bills_users do |t|
      t.boolean :active, default: true
    end
  end
end
