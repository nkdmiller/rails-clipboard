class AddFilledToTasks < ActiveRecord::Migration[5.2]
  def change
  	add_column :tasks, :filled, :boolean
  end
end
