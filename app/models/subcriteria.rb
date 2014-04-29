class Subcriteria < ActiveRecord::Base
   attr_accessible :name, :description ,:criteria_id
   belongs_to :criteria
end
