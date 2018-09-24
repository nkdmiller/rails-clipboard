class Project < ApplicationRecord
	has_many :tasks
	has_many :users, through: :tasks
	accepts_nested_attributes_for :tasks

	def create_project_tasks(params)
		params[:project][:tasks].each do |key, task|
			count = task[:number].to_i
			count.times do
				@task = Task.create!(:project_id => self.id, :role => task[:role], :details => task[:details], :user_id => 1)
				@task.save
			end
		end
	end
end
