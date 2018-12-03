class UserSerializer < ActiveModel::Serializer
  attributes(*User.attribute_names.map(&:to_sym))
  has_many :notes
  has_many :medications
  has_many :appointments
  has_many :doctors
  has_many :pains
end
