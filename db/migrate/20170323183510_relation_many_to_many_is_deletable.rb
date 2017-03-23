class RelationManyToManyIsDeletable < ActiveRecord::Migration[5.0]
  def up
    remove_column :bills_users, :id
    remove_column :bills_users, :active
    remove_timestamps :bills_users
  end

  def down
    add_column :bills_users, :id, :primary_key
    add_column :bills_users, :active, :boolean, default: true
    add_timestamps :bills_users, null: true
  end
end
