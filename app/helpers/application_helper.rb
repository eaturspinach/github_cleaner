module ApplicationHelper

	def full_title(page_title)                         
	    base_title = "Github Mobile"
	    if page_title.empty?
	      base_title
	    else
	      "#{base_title} | #{page_title}"
	    end
  	end

  	def user_id
  		session[:uid].nil? ? 0 : Authentication.find_by_uid(session[:uid]).user_id
  	 end
end
