class DoctorSerializer < ActiveModel::Serializer
  attributes(*Doctor.attribute_names.map(&:to_sym))
end
