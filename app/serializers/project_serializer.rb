class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title

  # Associations
  has_many :tasks
end
