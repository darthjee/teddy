class Serializers::Calendar < ActiveModel::Serializer
  attributes :first_date, :last_date
  has_many :payments, serializer: Serializers::Payment
end
