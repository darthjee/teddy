class Serializers::Payment < ActiveModel::Serializer
  attributes *(::Payment.attribute_names.map(&:to_sym))
  attributes :day

  delegate :bill, to: :object
  delegate :day, to: :bill
end
