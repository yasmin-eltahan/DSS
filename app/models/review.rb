class Review < ActiveRecord::Base
   attr_accessible :review, :review2 , :review3 , :reviewer, :source ,:result ,:system_id
   belongs_to :system
end
