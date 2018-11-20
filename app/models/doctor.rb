class Doctor < ApplicationRecord
  has_many :users, through: :medications
  has_many :users, through: :appointments
  has_many :medications
  has_many :appointments
end
