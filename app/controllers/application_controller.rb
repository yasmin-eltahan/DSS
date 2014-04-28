class ApplicationController < ActionController::Base
 
#app/controller/application.rb

protect_from_forgery

private

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end
helper_method :current_user

# before_filter :parse_facebook_cookies
# def parse_facebook_cookies
#  @facebook_cookies = Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
# end

end
