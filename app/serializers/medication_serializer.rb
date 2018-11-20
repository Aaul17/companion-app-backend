class MedicationSerializer < ActiveModel::Serializer
  attributes(*Medication.attribute_names.map(&:to_sym))
  belongs_to :user
  belongs_to :doctor
end
