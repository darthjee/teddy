class User < ApplicationRecord
  include Tsung::User

  has_and_belongs_to_many :bills
end
