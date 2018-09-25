module ApplicationHelper
	def is_logged_in?
	    !!session[:user_id]
	end
   def current_user
   	return unless session[:user_id]
   	@user ||= User.find(session[:user_id])
   end
   def find_user_name(id)
   	User.find(id).name
   end
end
