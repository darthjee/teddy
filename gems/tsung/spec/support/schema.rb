ActiveRecord::Schema.define do
  self.verbose = false

  create_table :users, :force => true do |t|
    t.string :name
    t.string :email
    t.string :authentication_token
    t.string :code
    t.datetime :created_at
    t.datetime :updated_at
    t.string :password, limit: 64
  end
end

