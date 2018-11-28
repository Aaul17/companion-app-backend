class NoteSerializer < ActiveModel::Serializer
  attributes(*Note.attribute_names.map(&:to_sym))
end
