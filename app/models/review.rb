class Review < ActiveRecord::Base
   attr_accessible :review, :source ,:result ,:system_id , :review2, :review3
   belongs_to :system
end
