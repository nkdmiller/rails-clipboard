class Project < ApplicationRecord
	has_many :tasks
	has_many :users, through: :tasks
	accepts_nested_attributes_for :tasks
	validates :name, length: { minimum: 2 }
	def add_task(params, proj)
		count = params[:number].to_i
		count.times do
			@task = Task.create!(:project_id => params[:project_id], :role => params[:role], :details => params[:details], :user_id => proj.users.first.id, :filled => false, :admin => false, :username => User.find(proj.users.first.id).name)
			@task.save
		end
	end
	def create_project_tasks(params)
		params[:project][:tasks].each do |key, task|
			count = task[:number].to_i
			count.times do
				@task = Task.create!(:project_id => self.id, :role => task[:role], :details => task[:details], :user_id => task[:user_id].to_i, :filled => false, :admin => false, :username => User.find(task[:user_id].to_i).name)
				@task.save
			end
		end
	end
end
