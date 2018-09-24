class ChangeNameToRoleInTasks < ActiveRecord::Migration[5.2]
  def change
  	rename_column :tasks, :name, :role
  end
end
