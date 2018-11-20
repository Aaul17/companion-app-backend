class UserSerializer < ActiveModel::Serializer
  attributes(*User.attribute_names.map(&:to_sym))
  has_many :notes
  has_many :doctors, through: :medications
  has_many :doctors, through: :appointments
  has_many :medications
  has_many :appointments
end
