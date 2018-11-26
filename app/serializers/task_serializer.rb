class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :project, serializer: ProjectSerializer
end
