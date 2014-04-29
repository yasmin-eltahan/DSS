class SystemsController < ApplicationController
	def list
    @systems = System.all
	#@user = current_user.id
	end

	def show
		@system = System.find(params[:id])
		@technicals = SystemTechnical.find(:all,:conditions => {:system_id => @system.id})
		@versions = Version.find(:all,:conditions => {:system_id => @system.id})
            require 'rubygems'
			require 'nokogiri'
	        require 'open-uri'
	        require "net/http"
		urll = URI.parse("http://www.g2crowd.com/products/#{CGI.escape(@system.name)}/reviews")
		req = Net::HTTP.new(urll.host, urll.port)
		res = req.request_head(urll.path)  
		if (res.code == "200" ) 
	 	url = "http://www.g2crowd.com/products/#{CGI.escape(@system.name)}/reviews"
	    doc = Nokogiri::HTML(open(url))
	    doc.css("#ajax-replace-surveys > div.messages.survey-messages.better-slats.with-seperator > div.message.b-slat").each do |ite|
	    review1 = ite.at_css(".message-response:nth-child(2)").text
	    review2 = ite.at_css(".message-response:nth-child(4)").text
	    review3 = ite.at_css(".message-response:nth-child(6)").text
	    name = ite.at_css(".message-user-name .js-popover").text  
	    date = ite.at_css("time").text 
	    review = Review.new(:review=> review1, :review2 => review2 , :review3 => review3, :reviewer => name, :source =>date,:system_id=> @system.id) 
	    @totalreviews = Review.all
		   if !@totalreviews.nil?
			   boolean = "no"
				   @totalreviews.each do |rev|
			         if((rev.review.to_s == review.review.to_s) && (rev.reviewer.to_s == review.reviewer.to_s))
			         	boolean = "yes"
			         	break
			         end	
				   end

			       if (boolean.to_s == "no")
			       	review.save
			       			
			       end
	       else
	       		review.save 			
	       end 
	   end
	   #	@reviews= Review.find(:all,:conditions => {:system_id => @system.id})	
	end
        @count = 2
	    urll2 = URI.parse("http://www.g2crowd.com/products/#{CGI.escape(@system.name)}/reviews?&page=#{@count}") 
		req2 = Net::HTTP.new(urll2.host, urll2.port)
		res2 = req2.request_head(urll2.path)  
		if (res2.code == "200" ) 
	 	url2 = "http://www.g2crowd.com/products/#{CGI.escape(@system.name)}/reviews?&page=2"
	    doc2 = Nokogiri::HTML(open(url2))
	    doc2.css("#ajax-replace-surveys > div.messages.survey-messages.better-slats.with-seperator > div.message.b-slat").each do |ite|
	   # ite.css(".formatted-text").each do |i|
	    review4 = ite.at_css(".message-response:nth-child(2)").text
	  # review = Review.create(:review => review1)
	    review5 = ite.at_css(".message-response:nth-child(4)").text
	  # review = Review.create(:review => reviews2)
	    review6 = ite.at_css(".message-response:nth-child(6)").text
	  # review = Review.create(:review => reviews3)
	    name2 = ite.at_css(".message-user-name .js-popover").text 
	   # stars = ite.at_css(".stars").text 
	   date2 = ite.at_css("time").text 
	   reviewpage2 = Review.new(:review=> review4, :review2 => review5 , :review3 => review6 , :reviewer => name2 , :source =>date2 ,:system_id=> @system.id) 
	   @totalreviews2 = Review.all
		   if !@totalreviews2.nil?
		   	 puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
			   boolean2 = "no"
			   @totalreviews2.each do |rev2|
		         if((rev2.review.to_s == reviewpage2.review.to_s) && (rev2.reviewer.to_s == reviewpage2.reviewer.to_s))
		         	boolean2 = "yes"
		         	break
		         end	
			   end

		       if (boolean2.to_s == "no")
		       	reviewpage2.save
		       end
	       else
	       		reviewpage2.save
	       end
	   # review = Review.create(:review=> review1, :review2 => review2 , :review3 => review3 , :reviewer => name)
	   end
	   @reviews= Review.find(:all,:conditions => {:system_id => @system.id})
	 end



	end
end
