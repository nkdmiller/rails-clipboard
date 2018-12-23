class TaskSerializer < ActiveModel::Serializer
  attributes :id, :role, :details, :comment, :project_id, :user_id, :filled, :admin, :username
  belongs_to :project, serializer: ProjectSerializer
end