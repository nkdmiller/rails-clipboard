class AddAdminToTasks < ActiveRecord::Migration[5.2]
  def change
  	add_column :tasks, :admin, :boolean
  end
end
