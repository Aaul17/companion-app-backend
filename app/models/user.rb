class User < ApplicationRecord
  has_many :notes, dependent: :destroy
  has_many :medications, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :doctors, dependent: :destroy
  has_many :pains, dependent: :destroy
end
