class AppointmentSerializer < ActiveModel::Serializer
  attributes(*Appointment.attribute_names.map(&:to_sym))
  belongs_to :user
  belongs_to :doctor
end
