module SessionsHelper

	def signed_in?
		!session[:uid].nil?
	end

end
