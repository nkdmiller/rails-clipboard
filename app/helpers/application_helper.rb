module ApplicationHelper
	def is_logged_in?
	    !!current_user
	end
   def log_in(user)
      session[:user_id] = user.id
   end
   def current_user(session)
   	# return unless session[:user_id]
   	@logged_in_user ||= User.find(session[:user_id])
   end
   def access?(id)
   	if current_user.id == id.to_i
   		return true
   	else
   		return false
   	end
   end
   def find_user_name(id)
   	User.find(id).name
   end
end
