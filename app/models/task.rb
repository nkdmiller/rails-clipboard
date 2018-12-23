class Task < ApplicationRecord
	belongs_to :project
	belongs_to :user
	scope :created, -> (creator_id) { where(["user_id = ? and admin = ?", creator_id, true]) }
	scope :picked_up, -> { where("filled = ?", true) }
end
