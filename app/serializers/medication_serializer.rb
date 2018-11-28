class MedicationSerializer < ActiveModel::Serializer
  attributes(*Medication.attribute_names.map(&:to_sym))
end
