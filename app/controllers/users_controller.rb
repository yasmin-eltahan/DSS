class UsersController < ApplicationController
require 'koala'



def index
	
	#@graphs = Koala::Facebook::GraphAPI.new
	#@graph = Koala::Facebook::API.new(current_user.oauth_token)
	#(CAACEdEose0cBAJ0cpjv2uPJXFZAqMoJytX9GHJdggQtB5hrFz8W5IsZCMYxqiJMfkQEJU2ocrMjJlcNBblZCg5ohAFxxSgMPilVHB6zOR91ZCawcpdlPs1yO32KQogFPBafYleQvnNVJu0t1nSHMRyvRxgwiIDKgmROp7pxLlLf35n15YNEaBpKZBGsKABwisK1KP3XzyvQZDZD)
	#@graph.get_connections("SAP", "feed")
	#@graph.class
	#@graph.first
	#@results = params[:page] ?
	#@graph.get_page('params[:page]') :
	#@result = @graph.get_object("koppel")
	#@likes = @graph.get_connections("me", "feed")
	# posts = @graph.get_connections("me", "posts")
 #    @postids = posts.map { |p| p['id'] }
end

# def index
#  graph = Koala::Facebook::GraphAPI.new(@facebook_cookies["access_token"])
#  @likes = graph.get_connections("me", "likes")

# end

   # def index   
   #      if params[:code]
   #          # acknowledge code and get access token from FB
   #          session[:access_token] = session[:oauth].get_access_token(params[:code])
   #      end 
 
   #      # auth established, now do a graph call:
   #     @api = Koala::Facebook::API.new(session[:access_token])
   #     # @graph = Koala::Facebook::GraphAPI.new(your_oauth_token) # pre 1.2beta
   #    #  @api = Koala::Facebook::API.new(your_oauth_token)
   #    #  @results = @api.get_object("me")
 
   #      begin
   #          @results = @api.get_object("koppel")
   #      rescue Exception=>ex
   #          puts ex.message
   #          #if user is not logged in and an exception is caught, redirect to the page where logging in is requested
   #          redirect_to '/login' and return
   #      end
 
   #      respond_to do |format|
   #       format.html {   }    
   #      end
   #  end
     
   #  #########################################################
     
   #  def login
   #      session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/')
   #      @auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"read_stream publish_stream")  
 
   #      redirect_to @auth_url
   #  end




end
