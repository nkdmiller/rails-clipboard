class AddUsernameToTasks < ActiveRecord::Migration[5.2]
  def change
  	add_column :tasks, :username, :string
  end
end
