class Serializers::Bill < ActiveModel::Serializer
  attributes * (::Bill.attribute_names.map(&:to_sym))
end

