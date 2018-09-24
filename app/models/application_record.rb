class ApplicationRecord < ActiveRecord::Base
	require 'byebug'
  self.abstract_class = true
end
