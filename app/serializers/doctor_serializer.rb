class DoctorSerializer < ActiveModel::Serializer
  attributes(*Doctor.attribute_names.map(&:to_sym))
  has_many :users, through: :medications
  has_many :users, through: :appointments
  has_many :medications
  has_many :appointments
end
