# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'date'

User.destroy_all
Note.destroy_all
Doctor.destroy_all
Medication.destroy_all
Appointment.destroy_all

puts 'creating users'

name_hash = []
10.times do
  name_hash.push(Faker::Name.unique.first_name)
end

email_hash = []
name_hash.each do |names|
  email_hash.push(names.gsub(' ', '_') + "@gmail.com")
  email_hash.map!(&:downcase)
end

i=0
10.times do
  User.create!(name: name_hash[i], email: email_hash[i], password_digest: "test", date_of_birth: Date.new(rand(1950..2010), rand(1..12), rand(1..29)), location: Faker::Address.state, gender: Faker::Gender.type)
  i += 1
end

puts "users created"
