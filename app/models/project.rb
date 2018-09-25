class Project < ApplicationRecord
	has_many :tasks
	has_many :users, through: :tasks
	accepts_nested_attributes_for :tasks
	scope :created, -> (creator_id) { where(["user_id = ? and admin = ?", creator_id, true]) }
	def create_project_tasks(params)
		params[:project][:tasks].each do |key, task|
			count = task[:number].to_i
			count.times do
				@task = Task.create!(:project_id => self.id, :role => task[:role], :details => task[:details], :user_id => task[:user_id].to_i)
				@task.save
			end
		end
	end
end
