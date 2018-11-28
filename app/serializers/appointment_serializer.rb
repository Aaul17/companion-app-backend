class AppointmentSerializer < ActiveModel::Serializer
  attributes(*Appointment.attribute_names.map(&:to_sym))
end
