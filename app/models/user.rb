class User < ApplicationRecord
  has_many :notes
  has_many :doctors, through: :medications
  has_many :doctors, through: :appointments
  has_many :medications
  has_many :appointments
end
