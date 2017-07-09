class Serializers::Payment < ActiveModel::Serializer
  attributes *(::Payment.attribute_names)
end
