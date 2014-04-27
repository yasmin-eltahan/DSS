class Rank < ActiveRecord::Base
   attr_accessible :rank, :system_id , :source, :vendor_id
   belongs_to :system
   belongs_to :vendor
end
