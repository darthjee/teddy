class BillsUser < ApplicationRecord
  belongs_to :user
  belongs_to :bill

  scope :active, -> { where(active: true) }
end
