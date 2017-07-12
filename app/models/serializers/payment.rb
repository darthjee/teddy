class Serializers::Payment < ActiveModel::Serializer
  attributes(*(::Payment.attribute_names.map(&:to_sym)))
  has_one :bill, serializer: Serializers::Bill
end
