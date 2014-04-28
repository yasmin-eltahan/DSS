desc "fetch_system_reviews"
task :fetch_reviews => :environment do 
require 'nokogiri'
 require 'open-uri' 

 url = "http://www.g2crowd.com/products/sap-erp/reviews"
    doc = Nokogiri::HTML(open(url)) 
  	doc.css(".comment-response").each do |item|
  		review1 =item.css(".message-response:nth-child(2)").text
  		review2= item.css(".message-response:nth-child(4)").text
  		review3= item.css(".message-response:nth-child(6)").text
  		Review.create(:review => review1 , :review2 => review2 , :review3 => review3)
	
  end
end
