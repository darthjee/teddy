class Bill < ApplicationRecord
  default_scope { where(active: true) }
end
