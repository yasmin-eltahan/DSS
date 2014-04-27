desc "Fetch system reviews"
task :fetch_reviews => :environment do
require 'nokogiri'
require 'open-uri'
    system = System.find(4)
 	url = "http://www.g2crowd.com/products/#{CGI.escape(system.name)}/reviews"
 	doc = Nokogiri::HTML(open(url))


   doc.css(".comment-response").each do |ite|
   # ite.css(".formatted-text").each do |i|

    review1 = ite.at_css(".message-response:nth-child(2)").text
  #  review = Review.create(:review => review1)
    review2 = ite.at_css(".message-response:nth-child(4)").text
  #  review = Review.create(:review => reviews2)
    review3 = ite.at_css(".message-response:nth-child(6)").text
 #   review = Review.create(:review => reviews3)
    review = Review.create(:review=> review1, :review2 => review2 , :review3 => review3)
    #reviews = doc.at_css(".message-response:nth-child(2)").text   
	#end
   end
end


 





 




  