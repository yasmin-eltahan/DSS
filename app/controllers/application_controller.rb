class ApplicationController < ActionController::Base
 
#app/controller/application.rb

protect_from_forgery

private

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end
helper_method :current_user

# after_filter :store_location
# def store_location
# 	if(request.fullpath != "/users/sign_in" && request.fullpath != "/users/sign_up" && request.fullpath != "/users/password" && request.fullpath != "/users/sign_out" && !request.xhr? )
# 		session[:previous_url] = request.fullpath
# 	end
# end

# def after_sign_in_path_for(resource)
# 	session[:previous_url] || root_path
# end

# before_filter :parse_facebook_cookies
# def parse_facebook_cookies
#  @facebook_cookies = Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
# end

end
