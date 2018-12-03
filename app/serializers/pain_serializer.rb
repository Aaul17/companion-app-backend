class PainSerializer < ActiveModel::Serializer
  attributes(*Pain.attribute_names.map(&:to_sym))
end
